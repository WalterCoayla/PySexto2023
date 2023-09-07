<?php
require_once './core/Modelo.php';

class CtaContable extends Modelo {
    private $id;
    private $nombre;
    private $descripcion;
    private $_tabla='ctas_contables';

    public function __construct($id=null,$nombre=null,$descripcion=null){
        $this->id = $id;
        $this->nombre=$nombre;
        $this->descripcion=$descripcion;
        parent::__construct($this->_tabla);
    }
    public function getTodo(){
        return $this->getAll();
    }
    public function eliminar(){
        return $this->deleteById($this->id);
    }
    public function guardar(){
        $datos = [
            'id'=>$this->id,
            'cuenta'=>"'$this->nombre'",
            'descripcion'=>"'$this->descripcion'",
        ];
        return $this->insert($datos);
    }
    public function editar(){
        return $this->getById($this->id);
    }
    public function actualizar(){
        $datos = [
            'id'=>$this->id,
            'cuenta'=>"'$this->nombre'",
            'descripcion'=>"'$this->descripcion'"
        ];
        $wh = "id=$this->id";
        return $this->update($wh,$datos);
    }
}