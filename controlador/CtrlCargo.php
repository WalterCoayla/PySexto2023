<?php
session_start();
require_once './core/Controlador.php';
require_once './modelo/Cargo.php';

class CtrlCargo extends Controlador {
    public function index(){
        # echo "Hola Cargo";
        $obj = new Cargo;
        $data = $obj->getTodo();

        # var_dump($data);exit;

        $datos = [
            
            'datos'=>$data['data']
        ];

        $home = $this->mostrar('cargos/mostrar.php',$datos,true);

        $datos= [
            'titulo'=>'Cargos',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);

    }

    public function eliminar(){
        $id = $_GET['id'];
        # echo "eliminando: ".$id;
        $obj =new Cargo ($id);
        $obj->eliminar();

        $this->index();
    }
    public function nuevo(){
        # echo "Agregando..";
        $datos= [
            'titulo'=>'Nuevo Cargo',
            'contenido'=>$this->mostrar('cargos/formulario.php',null,true),
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);
        
    }
    public function editar(){
        $id = $_GET['id'];
        # echo "Editando: ".$id;
        $obj = new Cargo($id);
        $data = $obj->editar();
        # var_dump($data);exit;
        $datos = [
            'datos'=>$data['data'][0]
        ];
        $home = $this->mostrar('cargos/formulario.php',$datos,true);

         $datos= [
            'titulo'=>'Editar Cargo',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);
        
    }
    public function guardar(){
        # echo "Guardando..";
        # var_dump($_POST);
        $id = $_POST['id'];
        $nombre = $_POST['nombre'];
        $esNuevo = $_POST['esNuevo'];

        $obj = new Cargo ($id, $nombre);

        switch ($esNuevo) {
            case 0: # Editar
                $data=$obj->actualizar();
                break;
            
            default: # Nuevo
                $data=$obj->guardar();
                break;
        }

        
        # var_dump($data);exit;
        $this->index();

    }
}