<?php
session_start();
require_once './core/Controlador.php';
require_once './modelo/Pago.php';
require_once './assets/Helper.php';

class CtrlPago extends Controlador {
    public function index(){
        $obj = new Pago();
        $data = $obj->getMontosXConceptoPago();
        /* $data = [
            [
                'nombre'=>'Matriculas',
                'monto'=>100
            ],
            [
                'nombre'=>'Certificados',
                'monto'=>80
            ],
            [
                'nombre'=>'Anexos',
                'monto'=>30
            ],
        ]; */

        $datos = [

            'label'=> json_encode(array_column($data, 'nombre')),
            'montos'=> json_encode(array_column($data, 'suma'))
        ];
        #       var_dump(json_encode($datos));exit;
       // var_dump($label);exit;

        $home=$this->mostrar('pagos/estadisticas.php',$datos, true);
        $datos = [
            'contenido'=> $home
        ];
        $this->mostrar('./plantilla/home.php',$datos);
    }
}