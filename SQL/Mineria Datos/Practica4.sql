# EXAMEN 1

use proyecto_f;

select * from empleado;

-- Consulta 4)
select em_id id, e_nombre Nombre, E_ap_p Apellido_Pat, e_ap_m Apellido_Mat, timestampdiff(year, E_fn, curdate()) as Edad from empleado;

-- Conuslta 8)
select a.Autor_Ap Apellido_P, a.autor_am Apellido_M, a.autor_N Nombre, l.Titulo Titulo, e.Ed_nombre Editorial from autor a
join libro l on(a.Autor_id = l.L_autor_id)
join editorial e on(e.Ed_id = l.l_edit_id)
where l.Titulo like '%Cálculo%';

-- Consulta 15)
select l.Titulo Titulo from libro l 
left join pedido p on(l.id = p.pe_id_l)
where p.pe_id_l is null;

select l.titulo Libro from (
	select l.Titulo Titulo, l.id id_libro from libro l 
	join pedido p on(l.id = p.pe_id_l)
) consulta
-- where 
;



select l.Titulo Titulo from libro l 
join pedido p on(l.id <> p.pe_id_l)
group by l.id;

select * from libro;

-- Consulta 14)
select s.s_nom Sucursal, sum(v.Pago) Venta_total, avg(v.Pago) Promedio_Ventas from venta v
join sucursal s on(v.v_suc_id = s.suc_id)
group by s.suc_id;

use ultima;

select p.idproducto Producto, p.descripcion Descripcion, pe.importe Importe from producto p
right join pedido pe on(p.idproducto = pe.producto)
where pe.importe >= 25000 and p.idproducto is null;


select idproducto from producto where idproducto <> (select p.idproducto Producto, p.descripcion Descripcion, pe.importe Importe from producto p
join pedido pe on(p.idproducto = pe.producto)
where pe.importe >= 25000);
-- Consulta blanco 8)
select p.idproducto Producto, p.descripcion Descripcion, pe.importe Importe from producto p
join pedido pe on(p.idproducto = pe.producto)
where pe.importe >= 25000;

select pro.idproducto Producto, pro.descripcion Descripcion, c.importe Importe from producto pro 
join (
	select p.idproducto Producto, p.descripcion Descripcion, pe.importe Importe from producto p
	join pedido pe on(p.idproducto = pe.producto)
where pe.importe >= 25000
) c on(c.Producto = pro.idproducto)
where pro.idproducto <> c.Producto;

-- Una opcion
select * from (
	select p.idproducto Producto, p.descripcion Descripcion, pe.importe Importe from producto p
	join pedido pe on(p.idproducto = pe.producto)
	where pe.importe >= 25000
) prod_mayores
join (
	select p.idproducto Producto, p.descripcion Descripcion, pe.importe Importe from producto p
	join pedido pe on(p.idproducto = pe.producto)
) prod_todos
on(prod_mayores.Producto <> prod_todos.Producto);

-- Otra
select * from pedido;
select * from producto;

select * from pedido where importe >= 25000;
select * from producto p 
join (select * from pedido where importe >= 25000) pe
on(p.idproducto <> pe.producto)
where p.idproducto = pe.producto;


-- CONSULTA CORRECTA
-- Pedidos de los productos que no tienen un importe mayor a 25000
select * from pedido pe
left join ( -- Join para mostrar solo los productos que no estan en la sig. consulta
	-- Productos que tienen un pedido mayor a 25000
	select p.idproducto from producto p 
    join pedido pe on(p.idproducto = pe.producto)
    where pe.importe >= 25000
) prod_mayores on (pe.producto = prod_mayores.idproducto)
where prod_mayores.idproducto is null;

select pr.idfab idfab, pr.idproducto idproducto, pr.descripcion descripcion, pr.precio precio, pr.existencia existencia from producto pr
join (
	-- Productos finales
	select * from pedido pe
	left join ( -- Join para mostrar solo los productos que no estan en la sig. consulta
		-- Productos que tienen un pedido mayor a 25000
		select p.idproducto from producto p 
		join pedido pe on(p.idproducto = pe.producto)
		where pe.importe >= 25000
	) prod_mayores on (pe.producto = prod_mayores.idproducto)
	where prod_mayores.idproducto is null
) prod_resultado on (pr.idproducto = prod_resultado.producto);

select * from producto pr
join (
	-- Productos finales
	select * from pedido pe
	left join ( -- Join para mostrar solo los productos que no estan en la sig. consulta
		-- Productos que tienen un pedido mayor a 25000
		select p.idproducto from producto p 
		join pedido pe on(p.idproducto = pe.producto)
		where pe.importe >= 25000
	) prod_mayores on (pe.producto = prod_mayores.idproducto)
	where prod_mayores.idproducto is null
) prod_resultado on (pr.idproducto = prod_resultado.producto);