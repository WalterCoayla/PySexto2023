<?php
require_once './core/Modelo.php';

class Persona extends Modelo {
    private $id;
    private $nombres;
    private $apellidos;
    private $DNI;
    private $correo;
    private $fechaNacimiento;
    private $genero;
    private $usuario;
    private $password;
    private $direccion;
    private $telefono;

    private $_tabla='personas';
    
    public function __construct($id=null
                    ,$nombres=null, $apellidos=null
                    ,$DNI=null,$fechaNacimiento=null
                    , $genero=null,$direccion=null,$telefono=null,
                     $correo=null
                    ){
        $this->id = $id;
        $this->nombres=$nombres;
        $this->apellidos=$apellidos;
        $this->DNI=$DNI;
        $this->fechaNacimiento=$fechaNacimiento;
        $this->genero=$genero;
        $this->direccion=$direccion;
        $this->telefono=$telefono;
        $this->correo=$correo;

        parent::__construct($this->_tabla);
    }
    public function getTodo(){
        return $this->getAll();
    }
    public function eliminar(){
        $this->setTabla('personas');
        return $this->deleteById($this->id);
    }
    public function guardar(){
        $this->setTabla('personas');
        $datos = $this->getDatos();
        return $this->insert($datos);
    }
    public function editar(){
        $this->setTabla('personas');
        return $this->getById($this->id);
    }
    public function actualizar(){
        $this->setTabla('personas');
        $datos = $this->getDatos();

        $wh = "id=$this->id";
        return $this->update($wh,$datos);
    }
    private function getDatos(){
        return [
            'id'=>$this->id,
            'nombres'=>"'$this->nombres'",
            'apellidos'=>"'$this->apellidos'",
            'dni'=>"'$this->DNI'",
            'correo'=>"'$this->correo'",
            'fechaNacimiento'=>"'$this->fechaNacimiento'",
            'genero'=>"$this->genero",
            'direccion'=>"'$this->direccion'",
            'telefono'=>"'$this->telefono'",
        ];
    }
    public function validar($login, $clave){
        $sql = "Select * from $this->_tabla
            WHERE usuario='$login' AND password='$clave'";
        
        $this->setSql($sql);
        return $this->ejecutarSql();
   
    }
}