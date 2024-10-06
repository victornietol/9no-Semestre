#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <crypt.h>


// Funcion para extraer el hash del archivo a atacar
void obtener_salt(const char *hash, char *salt) {
	// Extraer ek salt
	const char *ptr = hash;
	int dollar_conteo = 0;
	int i = 0;
	
	// Copiar caracteres hasta que el tercer '$' sea encontrado
	while(*ptr && dollar_conteo < 3) {
		salt[i++] = *ptr;
		if(*ptr == '$') {
			dollar_conteo++;
		}
		ptr++;
	}
	salt[i] = '\0'; // Termindar la cadena salt
}


// Funcion para realizar el ataque
void ataque_dicc(const char *user, const char *hash, const char *archivo_dicc, FILE *output_file) {
	char salt[256];
	obtener_salt(hash, salt); // Extraer la salt del hash dado
	
	FILE *file = fopen(archivo_dicc, "r");
	if(!file) {
		perror("Error al abrir el diccionario");
		exit(EXIT_FAILURE);
	}
	
	char word[256];
	struct crypt_data data;
	data.initialized = 0; // inicializar crypt_r
	
	// Leer palabra por palabra del diccionario
	while(fgets(word, sizeof(word), file)) {
		word[strcspn(word, "\n")] = '\0'; // Eliminar el salto de linea
		
		// Generando el hash
		char *hash_generado = crypt_r(word, salt, &data);
		
		// Comparando el hash generado con el hash del archivo objetivo
		if(strcmp(hash, hash_generado) == 0) {
			printf("Contraseña encontrada para %s: %s\n", user, word);
			
			// Guardar la contrasenia en un archivo
			fprintf(output_file, "Usuario: %s,  Hash: %s, Contrasenia: %s\n", user, hash, word);
			
			fclose(file);
			return;
		}
	}
	
	printf("No se encontro la contraseña para %s.\n", user);
	fclose(file);
}


int main (int argc, char *argv[]) {
	if(argc != 3) {
		fprintf(stderr, "Uso: %s <arhivo_shadow> <archivo_diccionario\n>", argv[0]);
		return 1;
	}
	
	const char *archivo_shadow = argv[1]; // Archivo objetivo
	const char *archivo_dicc = argv[2]; // Archivo de diccionario
	
	// Abrir archivo para guardar contrasenias
	FILE *output_file = fopen("contrasenias_encontradas.txt", "a");
	if(!output_file) {
		perror("Error al abrir el archivo de salida");
		exit(EXIT_FAILURE);
	}
	
	// Leer el archivo y probar cada hash
	FILE *file = fopen(archivo_shadow, "r");
	if(!file) {
		perror("Error al abrir el archivo objetivo");
		exit(EXIT_FAILURE);
	}
	
	char line[512];
	while(fgets(line, sizeof(line), file)) {
		// si el formato es usuario:hash:
		char *user = strtok(line, ":");
		char *hash = strtok(NULL, ":");
		
		
		if(hash != NULL) {
			printf("Probando hash para el usuario %s: %s\n", user, hash);
			ataque_dicc(user, hash, archivo_dicc, output_file); // Haciendo el ataque de diccionario
		}
	}
	
	fclose(file);
	fclose(output_file);
	printf("------ Ejecucion terminada -----");
	return 0;
}
