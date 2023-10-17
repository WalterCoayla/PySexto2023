

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
        <a data-id="<?=$d["id"]?>" href="#" class="btn btn-success editar">
            <i class="fa fa-edit"></i> 
            Editar
        </a>
        <a data-id="<?=$d["id"]?>" data-nombre="<?=$d["nombre"]?>" href="#" class="btn btn-danger eliminar">
          <i class="fa fa-trash"></i>  
          Eliminar
        </a>
        <a href="?ctrl=CtrlCarrito&accion=agregar&id=<?=$d["id"]?>" class="btn btn-info">
          <i class="fa fa-edit"></i>  
          Agregar a Matricula
        </a>
        
    </td>
</tr>

<?php
}
?>
      </tbody>
    </table>

    <a href="?">Retornar</a>
