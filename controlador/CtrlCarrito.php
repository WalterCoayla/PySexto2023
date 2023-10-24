<?php
require_once './modelo/Carrito.php';
session_start();
require_once './modelo/Curso.php';
require_once './core/Controlador.php';
require_once './assets/Helper.php';

class CtrlCarrito extends Controlador {
    public function index(){
        # echo "Hola Cargo";
        Helper::verificarLogin();
        $obj = new Curso;
        $data = $obj->getCursosCarrito();

        # var_dump($data);exit;
         $msg=$data['msg'];
        $datos = [
            
            'datos'=>$data['data']
        ];

        $home = $this->mostrar('carrito/mostrar.php',$datos,true);

        $datos= [
            'titulo'=>'Matricula',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu'],
            'msg'=>$msg
        ];
    $this->mostrar('./plantilla/home.php',$datos); 

    }

    public function agregar(){
        $id = $_GET['id'];
        if (! isset($_SESSION['carrito']))
            $_SESSION['carrito'] = new Carrito();
         $_SESSION['carrito']->agregar($id);

        # var_dump( $_SESSION['carrito']);
    }

    public function retirar(){
        $id = $_GET['id'];
        if (isset($_SESSION['carrito'])){
            $_SESSION['carrito']->sacar($id);
        }
        $this->index();
    }

}