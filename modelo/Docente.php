<?php
# require_once './core/Modelo.php';
require_once 'Persona.php';

class Docente extends Persona {
    private $id;
    private $idPrograma;
    private $_tabla='docentes';
    private $_vista='v_docentes';

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
    /* public function getTodo(){
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
    } */

    public function getBachilleresExamen($id){
        $sql = "Select * from v_bach_examen where idjurado=$id";
        $this->setSql($sql);
        return $this->ejecutarSQL();
    }
    public function guardarNotasExamen($notaT, $notaP){
        $sql = "update jurados_examen_suficiencia  
                set notaTeoria=$notaT, notaPractica=$notaP 
                where id=".$_SESSION['idJuradoExamen'];
        $this->setSql($sql);
        // var_dump($sql);exit;
        return $this->ejecutarSQL();
    }

}