<?php
session_start();
require_once './core/Controlador.php';
require_once './modelo/Estudiante.php';
require_once './modelo/ProgramaEstudio.php';
require_once './assets/Helper.php';

class CtrlEstudiante extends Controlador {
    public function index(){
        Helper::verificarLogin();
        # echo "Hola Estudiante";
        $obj = new Estudiante;
        $data = $obj->getTodo();

        # var_dump($data);exit;

        $datos = [
            
            'datos'=>$data['data']
        ];

        $home = $this->mostrar('estudiantes/mostrar.php',$datos,true);

        $datos= [
            'titulo'=>'Estudiantes',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);

    }

    public function eliminar(){
        Helper::verificarLogin();
        $id = $_GET['id'];
        # echo "eliminando: ".$id;
        $obj =new Estudiante ($id);
        $obj->eliminar();

        $this->index();
    }
    public function nuevo(){
        Helper::verificarLogin();
        # echo "Agregando..";
        $obj = new ProgramaEstudio;
        $programas = $obj->mostrar();
        $datos = [
            // 'datos'=>$data['data'][0],
            'programas'=>$programas['data']
        ];
        $home = $this->mostrar('estudiantes/formulario.php',$datos,true);

         $datos= [
            'titulo'=>'Editar Estudiante',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);
        
    }
    public function editar(){
        Helper::verificarLogin();
        $id = $_GET['id'];
        # echo "Editando: ".$id;
        $obj = new ProgramaEstudio;
        $programas = $obj->mostrar();

        $obj = new Estudiante($id);
        $data = $obj->editar();
        # var_dump($data);exit;
        $datos = [
            'datos'=>$data['data'][0],
            'programas'=>$programas['data']
        ];
        $home = $this->mostrar('estudiantes/formulario.php',$datos,true);

         $datos= [
            'titulo'=>'Editar Estudiante',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
        ];
    $this->mostrar('./plantilla/home.php',$datos);
        
    }
    public function guardar(){
        Helper::verificarLogin();
        # echo "Guardando..";
        # var_dump($_POST);
        $id = $_POST['id'];
        $nombres = $_POST['nombres'];
        $apellidos = $_POST['apellidos'];
        $dni = $_POST['dni'];
        $direccion = $_POST['direccion'];
        $correo = $_POST['correo'];
        $fechaNacimiento = $_POST['fechaNacimiento'];
        $telefono = $_POST['telefono'];
        $idPrograma = $_POST['idPrograma'];
        $genero = $_POST['genero'];
        $esNuevo = $_POST['esNuevo'];

        $obj = new Estudiante ($id, $idPrograma, 
                        $nombres, $apellidos
                            , $dni, $fechaNacimiento
                            , $genero, $direccion
                            ,$telefono, $correo
                        );

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
    public function seleccionarModalidad(){
        // $id = $_GET['id'];
        echo "Seleccionando modalidad para ". $_SESSION['id'];
    }
    public function imprimirRequisitos(){
        // $id = $_GET['id'];
        echo "Imprimiendo requisitos para ". $_SESSION['id'];
    }
}