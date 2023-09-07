<?php
require_once './core/Modelo.php';

class ConceptoPago extends Modelo {
    private $id;
    private $nombre;
    private $monto;
    private $idCta;
    private $_tabla='conceptos_pago';
    private $_vista='v_conceptos_pago';

    public function __construct($id=null,$nombre=null,$monto=null,$idCta=null){
        $this->id = $id;
        $this->nombre=$nombre;
        $this->monto=$monto;
        $this->idCta=$idCta;
        parent::__construct($this->_tabla);
    }
    public function getTodo(){
        $this->setTabla($this->_vista);
        return $this->getAll();
    }
    public function eliminar(){
        return $this->deleteById($this->id);
    }
    public function guardar(){
        $datos = [
            'id'=>$this->id,
            'nombre'=>"'$this->nombre'",
            'monto'=>"'$this->monto'",
            'idCta'=>"$this->idCta",
        ];
        return $this->insert($datos);
    }
    public function editar(){
        return $this->getById($this->id);
    }
    public function actualizar(){
        $datos = [
            'id'=>$this->id,
            'nombre'=>"'$this->nombre'",
            'monto'=>"'$this->monto'",
            'idCta'=>"$this->idCta",
        ];
        $wh = "id=$this->id";
        return $this->update($wh,$datos);
    }
}