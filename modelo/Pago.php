<?php
require_once './core/Modelo.php';

class Pago extends Modelo {
    private $id;
    private $nombre;
    private $_tabla='pagos';
    

    public function __construct($id=null,$nombre=null){
        $this->id = $id;
        $this->nombre=$nombre;
        parent::__construct($this->_tabla);
    }
    public function getTodo(){
        return $this->getAll();
    }
    public function getMontosXConceptoPago(){
        $sql = "Select * from v_montoRecaudado_x_conceptoPago";
        $this->setSql($sql);
        return $this->ejecutarSql()['data'];
    }
}