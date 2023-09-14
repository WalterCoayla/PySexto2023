<?php
require_once './core/Modelo.php';
class ProgramaEstudio extends Modelo {
    private $id;
    private $nombre;
    private $logo;
    private $_tabla='programas_estudios';
    public function __construct($id=null,$nombre=null,$logo=null){
        $this->id = $id;
        $this->nombre=$nombre;
        $this->logo=$logo;
        parent::__construct($this->_tabla);
    }

    public function mostrar(){
        return $this->getAll();
    }
    public function getRegistro(){
        return $this->getById($this->id);
    }
    public function guardar(){
        $data=[
            'nombre'=>"'$this->nombre'",
            'logo'=>"'$this->logo'"
        ];
        return $this->insert($data);
    }
    public function actualizar(){
        $data=[
            'nombre'=>"'$this->nombre'",
            'logo'=>"'$this->logo'",
        ];
        $wh = 'id='.$this->id;
        return $this->update($wh, $data);
    }
    public function eliminar(){
        return $this->deleteById($this->id);
    }
}