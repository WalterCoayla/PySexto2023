<?php
require_once './core/Controlador.php';
require_once './modelo/CtaContable.php';
require_once './assets/Helper.php';

class CtrlCtaContable extends Controlador {
    public function index(){
        Helper::verificarLogin();
        # echo "Hola CtaContable";
        $obj = new CtaContable;
        $data = $obj->getTodo();

        # var_dump($data);exit;

        $datos = [
            'titulo'=>'Cuentas Contables',
            'datos'=>$data['data']
        ];

        $this->mostrar('ctasContables/mostrar.php',$datos);
    }

    public function eliminar(){
        Helper::verificarLogin();
        $id = $_GET['id'];
        # echo "eliminando: ".$id;
        $obj =new CtaContable ($id);
        $obj->eliminar();

        $this->index();
    }
    public function nuevo(){
        Helper::verificarLogin();
        # echo "Agregando..";
        $this->mostrar('ctasContables/formulario.php');
    }
    public function editar(){
        Helper::verificarLogin();
        $id = $_GET['id'];
        # echo "Editando: ".$id;
        $obj = new CtaContable($id);
        $data = $obj->editar();
        # var_dump($data);exit;
        $datos = [
            'datos'=>$data['data'][0]
        ];
        $this->mostrar('ctasContables/formulario.php',$datos);
    }
    public function guardar(){
        Helper::verificarLogin();
        # echo "Guardando..";
        # var_dump($_POST);
        $id = $_POST['id'];
        $nombre = $_POST['nombre'];
        $descripcion = $_POST['descripcion'];
        $esNuevo = $_POST['esNuevo'];

        $obj = new CtaContable ($id, $nombre,$descripcion);

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