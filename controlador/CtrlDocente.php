<?php
session_start();
require_once './core/Controlador.php';
require_once './modelo/Docente.php';
require_once './modelo/ProgramaEstudio.php';
require_once './assets/Helper.php';

class CtrlDocente extends Controlador {
    public function index(){
        Helper::verificarLogin();
        # echo "Hola Estudiante";
        

        $home = $this->mostrar('docentes/mostrar.php',$datos,true);

        $datos= [
            'titulo'=>'Docentes',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);

    }
    public function juradoExamen(){
        // echo "Mostrando Bachilleres por Examen";
        $obj = new Docente();
        $data = $obj->getBachilleresExamen($_SESSION['id'])['data'];
        // var_dump($data);exit;
        $datos = [
            // 'titulo'=>'Bachilleres por Examen de suficiencia',
            'datos'=>$data
        ];
        $home = $this->mostrar('docentes/mostrarBachilleresExamen.php',$datos,true);
        
        $datos = [
            'titulo'=>'Bachilleres por Examen de suficiencia',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
        $this->mostrar('./plantilla/home.php',$datos);
    }
    public function juradoTrabajo(){
        echo "Mostrando Bachilleres por Trabajo ";
    }
    public function poneNota(){
       //  $_SESSION['idEstudiante'] = $_GET['idBachiller'];
        // $_SESSION['idExamen'] = $_GET['idExamen'];
        $_SESSION['idJuradoExamen']=$_GET['idJuradoExamen'];
        $_SESSION['nombreEstudiante'] = $_GET['nombre'];

        $home = $this->mostrar('docentes/formularioNotas.php',null, true);
        
        $datos = [
            'titulo'=>'Registro de Notas de jurado',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
        $this->mostrar('./plantilla/home.php',$datos);
    }
    public function guardarNotas(){
       // echo "Guardando notas";
       $notaT = $_POST['notaTeoria'];
       $notaP = $_POST['notaPractica'];
       // var_dump($_SESSION);exit;
       $obj = new Docente();
       $data = $obj->guardarNotasExamen($notaT, $notaP);

       $this->juradoExamen();
    }
    
}