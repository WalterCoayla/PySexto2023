
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            
            <th>Programa Estud.</th>
            <th>Nota Teoria</th>
            <th>Nota Práctica</th>
            <th>Opciones</th>
        </tr>
<?php
if (is_array($datos))
foreach ($datos as $d) {
    ?>
<tr>
    <td>
        <?=$d['id']?>
    </td>
    <td><?=$d['nombres']?></td>
    <td><?=$d['apellidos']?></td>
    
    <td><?=$d['programaEst']?></td>
    <td><?=$d['notaTeoriaJur']?></td>
    <td><?=$d['notaPracticaJur']?></td>
    <td>
        <a href="?ctrl=CtrlDocente&accion=poneNota&idJuradoExamen=<?=$d['idJuradoExamen']?>&nombre=<?=$d['nombres']?> <?=$d['apellidos']?>">
            Poner Nota
        </a>
        
        
    </td>
</tr>

<?php
}
?>

    </table>

    <a href="?">Retornar</a>
