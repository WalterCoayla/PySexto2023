<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="./assets/images/AdminLTELogo.png" alt="Logo IST" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">IES JCM</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="./assets/images/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">
            <?=(isset($_SESSION['usuario']))?$_SESSION['usuario']:'Visitante';?>
          </a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Opciones
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">


              <?php 
              if (isset($_SESSION['menu']))
        foreach ($_SESSION['menu'] as $key => $value) {
        ?>
        <li class="nav-item" >
            <a href="?ctrl=<?=$key?>" class="nav-link">
            <i class="nav-icon fas fa-th"></i>
               <p> <?=$value?></p>
            </a>
        </li>

        <?php
        }

        ?>

            </ul>
          </li>


          <li class="nav-header">CERRAR</li>

          <li class="nav-item">
            <a href="?ctrl=CtrlPersona&accion=logout" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Cerrar Sesión</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Salir</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>