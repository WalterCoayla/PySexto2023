<a href="#" class="btn btn-success" id="imprimirPDF">
    <i class="fa fa-print"></i> 
    Imprimir 
</a>
    <table class="table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            
            <th>Programa Estud.</th>
            <th>Año de Término</th>
            <th>Nota Teoria</th>
            <th>Nota Práctica</th>
            <th>Opciones</th>
        </tr>
        </thead>
        <tbody>
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
    <td><?=$d['añoTermino']?></td>
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
</tbody>
    </table>

    <a href="?">Retornar</a>
