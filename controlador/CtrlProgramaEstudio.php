<?php
require_once './core/Controlador.php';
require_once './modelo/ProgramaEstudio.php';


class CtrlProgramaEstudio extends Controlador {
    public function index(){
        $obj = new ProgramaEstudio();
        $data = $obj->mostrar();
        # var_dump($data);exit;
        $datos = [
            'titulo'=>'Programa de Estudios',
            'data'=>$data['data']
        ];
        $this->mostrar('programaEstudios/mostrar.php',$datos);
    }
    public function nuevo(){
        

        $this->mostrar('programaEstudios/formulario.php');
    }
    public function editar(){
        $id = $_GET['id'];
        $obj = new ProgramaEstudio($id);
        $data = $obj->getRegistro();
        
        $datos = [
            'obj'=>$data['data'][0],
            
        ];
        $this->mostrar('programaEstudios/formulario.php',$datos);
    }
    public function guardar(){
        $id=$_POST['id'];
        $nombre=$_POST['nombre'];
        $logo=$_POST['logo'];

        $esNuevo=$_POST['esNuevo'];

        $obj = new ProgramaEstudio($id,$nombre,$logo);

        switch ($esNuevo) {
            case '0': # Editar
                $respuesta = $obj->actualizar();
                break;
            
            default:    #Nuevo
                $respuesta = $obj->guardar();
                break;
        }

        $this->index();

    }
    public function eliminar(){
        $id = $_GET['id'];
        $obj = new ProgramaEstudio($id);
        $respuesta = $obj->eliminar();
        $this->index();

    }
}