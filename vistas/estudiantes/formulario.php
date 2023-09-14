<?php
$id = isset($datos['id'])?$datos['id']:'';
$nombres = isset($datos['nombres'])?$datos['nombres']:'';
$apellidos = isset($datos['apellidos'])?$datos['apellidos']:'';
$dni = isset($datos['dni'])?$datos['dni']:'';
$direccion = isset($datos['direccion'])?$datos['direccion']:'';
$correo = isset($datos['correo'])?$datos['correo']:'';
$fechaNacimiento = isset($datos['fechaNacimiento'])?substr($datos['fechaNacimiento'], 0, 10):'';
$genero = isset($datos['genero'])?$datos['genero']:'';
$telefono = isset($datos['Telefono'])?$datos['Telefono']:'';
$idPrograma = isset($datos['idPrograma_estudios'])?$datos['idPrograma_estudios']:'';
$esNuevo = isset($datos['id'])?0:1;
?>
    <form action="?ctrl=CtrlEstudiante&accion=guardar" method="post">
        id:
        <input class="form-control" type="text" name="id" value="<?=$id?>">
        <input type="hidden" name="esNuevo" value="<?=$esNuevo?>">
        <br>
        Nombres:
        <input class="form-control" type="text" name="nombres" value="<?=$nombres?>">
        <br>
        Apellidos:
        <input class="form-control" type="text" name="apellidos" value="<?=$apellidos?>">
        <br>
        DNI:
        <input class="form-control" type="text" name="dni" value="<?=$dni?>">
        <br>
        Dirección:
        <input class="form-control" type="text" name="direccion" value="<?=$direccion?>">
        <br>
        Correo:
        <input class="form-control" type="email" name="correo" value="<?=$correo?>">
        <br>
        Fecha de Nacimiento:
        <input class="form-control" type="date" name="fechaNacimiento" value="<?=$fechaNacimiento?>">
        <br>
        Teléfono:
        <input class="form-control" type="text" name="telefono" value="<?=$telefono?>">
        <br>
        Programa de estudios:
        <select name="idPrograma">
            <?php
            if (is_array($programas))
            foreach ($programas as $p) {
                $selected = ($p['id']==$idPrograma)?'selected':'';
            ?>
            <option value="<?=$p['id']?>" <?=$selected?>><?=$p['nombre']?></option>
            <?php
            }
            ?>
        </select>
        
        <br>
        Genero: <?=($genero)?><br>
        
        <input  type="radio" name="genero" <?=($genero==0)?'checked':''?> value="0">Masculino
        <br>
        <input  type="radio" name="genero" <?=($genero==1)?'checked':''?> value="1">Femenino
        <br>
        <input class="btn btn-primary mb-3" type="submit" value="Guardar">

    </form>

    <a href="?ctrl=CtrlEstudiante">Retornar</a>
