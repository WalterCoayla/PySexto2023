<?php
require_once './core/Controlador.php';
require_once './modelo/Estado.php';
require_once './assets/Helper.php';

class CtrlEstado extends Controlador {
    public function index(){
        # echo "Hola Estado";
        Helper::verificarLogin();
        $obj = new Estado;
        $data = $obj->getTodo();

        # var_dump($data);exit;

        $datos = [
            'titulo'=>'Estados',
            'datos'=>$data['data']
        ];

        $this->mostrar('estados/mostrar.php',$datos);
    }

    public function eliminar(){
        Helper::verificarLogin();
        $id = $_GET['id'];
        # echo "eliminando: ".$id;
        $obj =new Estado ($id);
        $obj->eliminar();

        $this->index();
    }
    public function nuevo(){
        Helper::verificarLogin();
        # echo "Agregando..";
        $this->mostrar('estados/formulario.php');
    }
    public function editar(){
        Helper::verificarLogin();
        $id = $_GET['id'];
        # echo "Editando: ".$id;
        $obj = new Estado($id);
        $data = $obj->editar();
        # var_dump($data);exit;
        $datos = [
            'datos'=>$data['data'][0]
        ];
        $this->mostrar('estados/formulario.php',$datos);
    }
    public function guardar(){
        Helper::verificarLogin();
        # echo "Guardando..";
        # var_dump($_POST);
        $id = $_POST['id'];
        $nombre = $_POST['nombre'];
        $esNuevo = $_POST['esNuevo'];

        $obj = new Estado ($id, $nombre);

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