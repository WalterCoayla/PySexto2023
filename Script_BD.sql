------------------------------
CREATE VIEW v_conceptos_pago 
AS
select
    `cp`.`nombre` AS `nombre`,
    `cp`.`monto` AS `monto`,
    `cp`.`id` AS `id`,
    `cp`.`idCta` AS `idCta`,
    `cc`.`cuenta` AS `cuenta`,
    `cc`.`descripcion` AS `descripcion`
from (
        `bdtecno2023`.`conceptos_pago` `cp`
        join `bdtecno2023`.`ctas_contables` `cc` on(`cp`.`idCta` = `cc`.`id`)
    )

---------------------