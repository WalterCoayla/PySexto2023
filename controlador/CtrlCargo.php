<?php
require_once './core/Controlador.php';
require_once './modelo/Cargo.php';

class CtrlCargo extends Controlador {
    public function index(){
        # echo "Hola Cargo";
        $obj = new Cargo;
        $data = $obj->getTodo();

        # var_dump($data);exit;

        $datos = [
            'titulo'=>'Cargos',
            'datos'=>$data['data']
        ];

        $this->mostrar('cargos/mostrar.php',$datos);
    }
}