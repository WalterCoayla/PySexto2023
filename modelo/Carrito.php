<?php
class Carrito
{
    private $_elementos;

    public function __construct(){
        $this->_elementos = [];
    }

    #Parametros básicos para AGREGAR
    # id
    # cantidad
    public function agregar($id, $cant=1){
        if (! isset($this->_elementos[$id]))
            $this->_elementos[$id]=0;
        $this->_elementos[$id]+=$cant;
    }
    public function sacar($id, $cant=1){
        if ($cant<=$this->_elementos[$id])
            $this->_elementos[$id]-=$cant;
        if ($this->_elementos[$id]==0)
            unset($this->_elementos[$id]);

    }
    public function getElementos(){
        return $this->_elementos;
    }

}