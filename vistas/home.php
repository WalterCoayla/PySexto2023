<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1><?=$titulo?></h1>
    <h3>bienvenido <?=$usuario?></h3>
    
    <h3>Opciones:</h3>
    <ul>
        <?php 
        foreach ($menu as $key => $value) {
        ?>
        <li>
            <a href="?ctrl=<?=$key?>">
                <?=$value?>
            </a>
        </li>

        <?php
        }

        ?>

    </ul>


</body>
</html>