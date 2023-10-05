<?php
session_start();
require_once './core/Controlador.php';
require_once './modelo/Persona.php';
require_once './assets/Helper.php';

class CtrlPersona extends Controlador {
    public function index(){

        $home = $this->mostrar('personas/login.php',null,true);

        $datos = [
            'contenido'=>$home
        ];
        $this->mostrar('plantilla/home.php',$datos);

    }
    public function login(){

        # echo "Validando datos";
        $login = $_POST['usuario'];
        $clave = $_POST['clave'];
        $obj = new Persona();
        $data = $obj->validar($login, $clave);

        # var_dump($data);exit;

        /* if (! is_null($data)){
            $_SESSION['id']=$data[0]['id'];
            $_SESSION['usuario']=$data[0]['usuario'];
            $_SESSION['nombre']=$data[0]['nombres'] . ' '. $data[0]['apellidos'];

            $_SESSION['menu']=$this->getMenu();

            # var_dump($_SESSION);exit;
        }
        header("Location: ?");
 */
# var_dump($data);exit;
        if (is_null($data)){    #No existe el usuario
            header("Location: ?");
        } else {    #Mostrar las opciones del perfil disponibles
            
            $datos = [
            'data'=>$data
            ];
            $home = $this->mostrar('personas/opcionesPerfil.php',$datos,true);


            $datos= [
            'titulo'=>'Opcines de Perfil',
            'contenido'=>$home,
            'menu'=>$_SESSION['menu']
                ];
            $this->mostrar('./plantilla/home.php',$datos);
        }

    }
    public function logout(){
        session_destroy();
        header("Location: ?");
    }
    public function getMenu(){
        return [
            'CtrlCargo'=>'Cargos',
            'CtrlEstado'=>'Estados',
           #  'CtrlFactorForma'=>'Factores de Forma',
            'CtrlCtaContable'=>'Cuentas Contables',
            'CtrlConceptoPago'=>'Conceptos de Pago',
            'CtrlEstudiante'=>'Estudiante',
        ];
    }

    public function accederModulo(){
        $idModulo = $_GET['idModulo'];
        $idPerfil = $_GET['idPerfil'];
        $idPersona = $_GET['id'];


        $_SESSION['menu']= Helper::getMenu($idModulo,$idPerfil);

       # var_dump($_SESSION['menu']);exit;

        header("Location: ?");
    }
}
        