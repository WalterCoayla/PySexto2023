<?php
require_once './core/Controlador.php';
# require_once './modelo/Oficina.php';

class CtrlPrincipal extends Controlador {
    public function index(){
        # echo "Hola mundo";
        $datos = [
            'titulo'=>'Sexto Semestre',
            'usuario'=>'Walter',
            'menu'=>$this->getMenu()
        ];
        $this->mostrar('home.php',$datos);
        /* $obj = new Oficina();
        $data = $obj->mostrar();

        # var_dump($data);exit;

        $datos = [
            'menu'=>$this->getMenu(),
            'titulo'=>'Sistema IES.',
            'usuario'=>'Walter',
            'datos'=>$data['data']
        ];

        $this->mostrar('home.php',$datos); */

    }

    public function getMenu(){
        return [
            'CtrlCargo'=>'Cargos',
            'CtrlEstado'=>'Estados',
           #  'CtrlFactorForma'=>'Factores de Forma',
            'CtrlCtaContable'=>'Cuentas Contables',
            'CtrlConceptoPago'=>'Conceptos de Pago',
        ];
    }
}