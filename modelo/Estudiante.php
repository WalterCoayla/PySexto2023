<?php
# require_once './core/Modelo.php';
require_once 'Persona.php';

class Estudiante extends Persona {
    private $id;
    private $idPrograma;
    private $_tabla='estudiantes';
    private $_vista='v_estudiante';

    public function __construct($id=null,$idPrograma=null
            ,$nombres=null, $apellidos=null
            ,$DNI=null,$fechaNacimiento=null
            , $genero=null,$direccion=null,$telefono=null,
            $correo=null
            ){
        $this->id = $id;
        $this->idPrograma=$idPrograma;

        parent::__construct($id, $nombres, $apellidos
            ,$DNI,$fechaNacimiento
            , $genero,$direccion,$telefono,
            $correo);

       #  parent::__construct($this->_tabla);
    }
    public function getTodo(){
        $this->setTabla($this->_vista);
        return $this->getAll();
    }
    public function eliminar(){
        $this->setTabla($this->_tabla);
        $this->deleteById($this->id);
        # var_dump($this->_tabla);exit;
        $this->setTabla('personas');
        parent::eliminar();
    }
    public function guardar(){
        parent::guardar();
        $datos = [
            'id'=>$this->id,
            'idPrograma_estudios'=>"$this->idPrograma",
        ];
        $this->setTabla('estudiantes');
        return $this->insert($datos);
    }
    public function editar(){
        $this->setTabla($this->_vista);
        return $this->getById($this->id);
    }
    public function actualizar(){
        parent::actualizar();
        $datos = [
            'id'=>$this->id,
            'idPrograma_estudios'=>$this->idPrograma,
        ];
        $this->setTabla('estudiantes');
        $wh = "id=$this->id";
        return $this->update($wh,$datos);
    }
}