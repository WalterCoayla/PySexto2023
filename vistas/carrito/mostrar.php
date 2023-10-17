

<a href="?ctrl=CtrlCarrito" class="btn btn-primary">
    <i class="fa fa-plus"></i> 
    Ver Carrito
</a>


    <table class="table">
      <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>HT</th>
            <th>HL</th>
            <th>Cred.</th>
            <th>Semestre</th>
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
    <td>
        <?=$d['nombre']?>
    </td>
    <td>
        <?=$d['ht']?>
    </td>
    <td>
        <?=$d['hl']?>
    </td>
    <td>
        <?=$d['cred']?>
    </td>
    <td>
        
        <a href="?ctrl=CtrlCarrito&accion=retirar&id=<?=$d["id"]?>" class="btn btn-danger">
          <i class="fa fa-trash"></i>  
          Sacar
        </a>
        
    </td>
</tr>

<?php
}
?>
      </tbody>
    </table>

    <a href="?">Retornar</a>
