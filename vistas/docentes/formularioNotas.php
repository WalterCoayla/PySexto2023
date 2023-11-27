   <h3>Registro de notas para <?=$_SESSION['nombreEstudiante']?></h3>

   <form action="?ctrl=CtrlDocente&accion=guardarNotas" method="post">
        
        
        Nota Teoria:
        <input class="form-control" type="number" name="notaTeoria" value="">
        Nota Práctica:
        <input class="form-control" type="number" name="notaPractica" value="">
        <br>
        <input class="btn btn-primary mb-3" type="submit" value="Guardar">

    </form>

    <a href="?ctrl=CtrlCargo">Retornar</a>
