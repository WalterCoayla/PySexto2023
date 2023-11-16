
CREATE TRIGGER `nuevoCargo` 
	 BEFORE INSERT ON `cargos` FOR EACH ROW 
	INSERT
	    auditoria (
	        tabla,
	        operacion,
	        datos_new
	    )
	VALUES (
	        'cargos',
	        'actualizar',
	        JSON_OBJECT(new.id, new.nombre)
	    )

------------------------------
CREATE TRIGGER 	`actualizarCargo` 
BEFORE INSERT ON `cargos` 
FOR EACH ROW 

INSERT
    auditoria (
        tabla,
        operacion,
        datos_new,
        datos_old
    )
VALUES (
        'cargos',
        'actualizar',
        JSON_OBJECT(new.id, new.nombre),
        JSON_OBJECT(old.id, old.nombre)
    )

---------------
CREATE TRIGGER `eliminarCargo` 
BEFORE INSERT ON `cargos` FOR EACH ROW
	INSERT
	    auditoria (tabla, operacion, datos_old)
	VALUES (
	        'cargos',
	        'actualizar',
	        JSON_OBJECT(old.id, old.nombre)
	    )

----------------
--- HAY QUE HACER SIMILAR PARA LAS DEMÁS TABLAS
-- COMO SE APRECIA, en este caso la tabla CARGOS, solo tiene 2 campos id, nombre

