<?php
require_once './core/Modelo.php';

class Curso extends Modelo {
    private $id;
    private $nombre;
    
    private $_tabla='cursos';

    public function __construct($id=null,$nombre=null){
        $this->id = $id;
        $this->nombre=$nombre;
        parent::__construct($this->_tabla);
    }
    public function getTodo(){
        return $this->getAll();
    }
    public function getCursosCarrito(){
        if(isset($_SESSION['carrito'])){
            $datos  = $_SESSION['carrito']->getElementos();
            $valoresEn = '';
            foreach ($datos as $key => $value) {
                $valoresEn .= "$key,";
            }
            $valoresEn = substr($valoresEn,0,-1); 

            $sql = "Select * from cursos where id IN ($valoresEn)";
            # echo $sql; exit;
            $this->setSql($sql);
           
            return $this->ejecutarSql();
        }
    }
   
}