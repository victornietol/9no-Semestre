#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <crypt.h>

void get_salt(const char *hash, char *salt) {
    const char *ptr = hash;
    int dollar_count = 0;
    int i = 0;

    while (*ptr && dollar_count < 3) {
        salt[i++] = *ptr;
        if (*ptr == '$') {
            dollar_count++;
        }
        ptr++;
    }
    salt[i] = '\0';  // Terminar la cadena salt
}

void try_combination(const char *user, const char *hash, const char *word1, const char *word2, const char *salt, FILE *output_file) {
    char combined[512];
    snprintf(combined, sizeof(combined), "%s%s", word1, word2);  // Combina las palabras

    struct crypt_data data;
    data.initialized = 0;  // Inicializar crypt_r
    char *generated_hash = crypt_r(combined, salt, &data);

    if (strcmp(hash, generated_hash) == 0) {
        printf("Contraseña encontrada para %s: %s\n", user, combined);
        fprintf(output_file, "Usuario: %s, Hash: %s, Contraseña: %s\n", user, hash, combined);
    }
}

void dictionary_attack(const char *user, const char *hash, const char *dictionary_file, FILE *output_file) {
    char salt[256];
    get_salt(hash, salt);  // Extrae la salt del hash dado

    FILE *file = fopen(dictionary_file, "r");
    if (!file) {
        perror("Error al abrir el archivo de diccionario");
        exit(EXIT_FAILURE);
    }

    char word1[256], word2[256];
    struct crypt_data data;
    data.initialized = 0;  // Inicializar crypt_r

    // Leer el diccionario completo
    while (fgets(word1, sizeof(word1), file)) {
        word1[strcspn(word1, "\n")] = '\0';  // Eliminar el salto de línea

        // Probar la palabra por sí sola
        char *generated_hash = crypt_r(word1, salt, &data);
        if (strcmp(hash, generated_hash) == 0) {
            printf("Contraseña encontrada para %s: %s\n", user, word1);
            fprintf(output_file, "Usuario: %s, Hash: %s, Contraseña: %s\n", user, hash, word1);
            fclose(file);
            return;
        }

        // Volver al inicio del archivo para combinar palabras
        FILE *file2 = fopen(dictionary_file, "r");
        while (fgets(word2, sizeof(word2), file2)) {
            word2[strcspn(word2, "\n")] = '\0';  // Eliminar el salto de línea

            // Probar la combinación de word1 y word2
            try_combination(user, hash, word1, word2, salt, output_file);
        }
        fclose(file2);  // Cerrar el segundo archivo después de probar combinaciones
    }

    printf("No se encontró la contraseña para %s.\n", user);
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Uso: %s <archivo_shadow> <archivo_diccionario>\n", argv[0]);
        return 1;
    }

    const char *shadow_file = argv[1];      // Archivo shadow
    const char *dictionary_file = argv[2];  // Archivo de diccionario

    // Abrir el archivo para guardar contraseñas encontradas
    FILE *output_file = fopen("found_passwords.txt", "a");
    if (!output_file) {
        perror("Error al abrir el archivo de salida");
        exit(EXIT_FAILURE);
    }

    // Leer el archivo shadow y probar cada hash
    FILE *file = fopen(shadow_file, "r");
    if (!file) {
        perror("Error al abrir el archivo shadow");
        exit(EXIT_FAILURE);
    }

    char line[512];
    while (fgets(line, sizeof(line), file)) {
        // Suponiendo que el formato es: usuario:hash:...
        char *user = strtok(line, ":");
        char *hash = strtok(NULL, ":");

        if (hash != NULL) {
            printf("Probando hash para usuario %s: %s\n", user, hash);
            dictionary_attack(user, hash, dictionary_file, output_file);  // Ataque de diccionario
        }
    }

    fclose(file);
    fclose(output_file);  // Cerrar el archivo de salida
    printf("------- Ejecucion terminda -------");
    return 0;
}