<?php
require_once './core/Modelo.php';

class Cargo extends Modelo {
    private $id;
    private $nombre;
    private $_tabla='cargos';

    public function __construct($id=null,$nombre=null){
        $this->id = $id;
        $this->nombre=$nombre;
        parent::__construct($this->_tabla);
    }
    public function getTodo(){
        return $this->getAll();
    }
}