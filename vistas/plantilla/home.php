<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema IES JCM</title>
    <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="./assets/css/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="./assets/css/icheck.css">
 <!-- Theme style -->
 <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/jquery-toast.css">
  <link rel="stylesheet" href="./assets/css/adminlte.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
        
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">


<?php    
# require_once "./vistas/plantilla/nav.php";
Vista::mostrar('plantilla/nav.php');
Vista::mostrar('plantilla/aside.php');
# require_once "./vistas/plantilla/aside.php";
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <?php    
    require_once "./vistas/plantilla/pageHeader.php";
    # Vista::mostrar('plantilla/pageHeader.php');
    ?>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <?=$contenido?>
      </div>
    </section>
  </div>
  <?php    
    # require_once "./vistas/plantilla/footer.php";
    Vista::mostrar('plantilla/footer.php');
    ?>
</div>
<!-- Formularios modales -->
<!-- Modal Formulario - Nuevo / Editar -->
<div class="modal fade" id="modal-form" role="dialog">
    <div class="modal-dialog">
 
     <!-- Modal content-->
     <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" id="body-form">
    
        </div>
        
     </div>
    </div>
</div>
<!-- Modal Eliminar -->
<div class="modal fade" id="modal-eliminar" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="frm-eliminar"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" id="body-eliminar">
                <div class="text-center">
                    <h5>¿Estas seguro que deseas seguir con la eliminación?</h5>
                    <h5 class="reg-eliminacion">Registro: </h5>
                </div>
            </div>
            <div class="modal-footer justify-content-between">            
                <button type="button" class="btn btn-secundary" data-dismiss="modal">Cancelar</button>
                <a type="button" class="btn btn-danger" id="btn-confirmar" href="" data-id="">Eliminar</a>
            </div>
        </div>
    </div>
</div>

<script src="./assets/js/jq-toast.min.js"></script>

<script type="text/javascript" src="./assets/js/moment.min.js"></script>	

<!-- Bootstrap 4 -->
<script src="./assets/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./assets/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="./assets/js/demo.js"></script>

<?php require_once './vistas/plantilla/js.php'; ?>
</body>
</html>