<?php
$id = isset($datos['id'])?$datos['id']:'';
$nombre = isset($datos['cuenta'])?$datos['cuenta']:'';
$descripcion = isset($datos['descripcion'])?$datos['descripcion']:'';
$esNuevo = isset($datos['id'])?0:1;
$titulo = $esNuevo==1?'Nueva Cta. Contable':'Editando Cta. Contable';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1><?=$titulo?></h1>
    <form action="?ctrl=CtrlCtaContable&accion=guardar" method="post">
        id:
        <input type="text" name="id" value="<?=$id?>">
        <input type="hidden" name="esNuevo" value="<?=$esNuevo?>">
        <br>
        Cta. Contable:
        <input type="text" name="nombre" value="<?=$nombre?>">
        <br>
        Descripción:
        <input type="text" name="descripcion" value="<?=$descripcion?>">
        <br>
        <input type="submit" value="Guardar">

    </form>

    <a href="?ctrl=CtrlCtaContable">Retornar</a>
</body>
</html>