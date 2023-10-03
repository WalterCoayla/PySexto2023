<?php
abstract class Helper
{
    public static function verificarLogin(){
        if (!isset($_SESSION['usuario'])){
            header("Location: ?ctrl=CtrlPersona");
            exit();
        }
    }
}