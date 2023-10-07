<?php
session_start();

require_once './core/Controlador.php';
# require_once './modelo/Oficina.php';

class CtrlPrincipal extends Controlador {

    public function index(){
        
        $datos= [
            'contenido'=>$this->mostrar('principal.php',null,true),
            'msg'=>''
            
        ];
    $this->mostrar('./plantilla/home.php',$datos);


    }

}