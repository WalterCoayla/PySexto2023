
<script type="text/javascript">
  $(function () {
    'use strict'
     <?php if (isset($msg)){?>
        let titulo = '<?=(is_array($msg))?$msg['titulo']:'' ?>';
        let cuerpo = '<?=(is_array($msg))?$msg['cuerpo']:'' ?>';
      <?php 
        }else { ?>
          let titulo =''
          let cuerpo =''
        <?php } ?>
   
   
          if(titulo!=''){
            let icono = (titulo=='Error')?'error':'success';
            $.toast({
                heading: titulo,
                text: cuerpo,
                icon: icono,
                position: 'top-right',
                showHideTransition: 'plain',
                // bgColor: 'green',
                    textColor: 'white',
                    hideAfter: 2000
            });
        }
   
        $("#txtBuscar").keyup(function (e) { 
            e.preventDefault();
            
            let clave= $("#txtBuscar").val().trim();
            if (clave){
                $("table").find('tbody tr').hide();

                $('table tbody tr').each(function(){
                    let nombres=$(this).children().eq(1);
                    /* let apellidos=$(this).children().eq(2);
                    let dni=$(this).children().eq(3); */
                    if (
                      nombres.text().toUpperCase().includes(clave.toUpperCase())
                     /*  ||
                      apellidos.text().toUpperCase().includes(clave.toUpperCase())
                      ||
                      dni.text().toUpperCase().includes(clave.toUpperCase()) */

                      ){
                        $(this).show();
                    }
                });
            }else{
                $("table").find('tbody tr').show();

            }
        });
        
        $('.nuevo').click( function(){ 
            let linkNuevo=$(this).html();
            // alert(linkNuevo)
            $(this).html('<i class="fa fa-spinner"></i> Cargando...');
            $('.modal-title').html('Nuevo Registro');
            $.ajax({
                url:'index.php',
                type:'get',
                data:{'ctrl':'<?=isset($_GET['ctrl'])?$_GET['ctrl']:''?>','accion':'nuevo'}
            }).done(function(datos){
                $('.nuevo').html(linkNuevo);
                $('#body-form').html(datos);
                $('#modal-form').modal('show');
            }).fail(function(){
                $('.nuevo').html(linkNuevo);
                alert("error");
            });
        });
        $('#cambiarClave').click( function(e){ 
          e.preventDefault();
           let linkNuevo=$(this).html();
            // alert('Cambiando')
            $(this).html('<i class="fa fa-spinner"></i> Cargando...');
            $('.modal-title').html('Cambiar Clave');
            $.ajax({
                url:'index.php',
                type:'get',
                data:{'ctrl':'<?=isset($_GET['ctrl'])?$_GET['ctrl']:''?>','accion':'showCambiarClave'}
            }).done(function(datos){
                $('#cambiarClave').html(linkNuevo);
                $('#body-form').html(datos);
                $('#modal-form').modal('show');
            }).fail(function(){
                $('#cambiarClave').html(linkNuevo);
                alert("error");
            });
        });
        $('.editar').click( function(){ 
            var id= $(this).data('id');
            $('.modal-title').html('Editando el Reg.: '+id);
            $.ajax({
                url:'index.php',
                type:'get',
                data:{'ctrl':'<?=isset($_GET['ctrl'])?$_GET['ctrl']:'';?>','accion':'editar','id':id}
            }).done(function(datos){
                $('#body-form').html(datos);
                $('#modal-form').modal('show');
            }).fail(function(){
                alert("error");
            });
        });
        $('.eliminar').click( function(){ 
            var id= $(this).data('id');
            var nombre= $(this).data('nombre');
           
            $('.modal-title').html('<i class="fa fa-trash"></i> Eliminando el Reg.: '+id );
            
            $('.reg-eliminacion').html('Registro: <code>' + nombre +'</code>');
            
            $('#btn-confirmar').attr('href', '?ctrl=<?=isset($_GET['ctrl'])?$_GET['ctrl']:'';?>&accion=eliminar&id='+id);
            
            $('#modal-eliminar').modal('show');
            
        });
        $('.cambiarClave').click( function(){ 
            var id= $(this).data('id');
            var nombre= $(this).data('nombre');
           
            $('.modal-title').html('<i class="fa fa-trash"></i> Restablecer clave');
            
            $('.reg-eliminacion').html('Registro: <code>' + nombre +'</code>');
            
            $('#btn-confirmar').attr('href', '?ctrl=<?=isset($_GET['ctrl'])?$_GET['ctrl']:'';?>&accion=restablecerClave&id='+id);
            
            $('#modal-eliminar').modal('show');
            
        });
        $('#imprimirPDF').click(function (e) { 
            e.preventDefault();
            let link=$(this).html();
            // alert(link)
            $(this).html('<i class="fa fa-spinner"></i> Descargando...');
            var datos= <?=json_encode(isset($datos)?$datos:'');?>;
            let titulo=$('#titulo').html().trim();

            var doc = new jsPDF('p')
                 // doc.addImage(logo, 'JPEG', 10, 10,20,22);
                imprimirEncabezado(doc)
                imprimirPie(doc)
                doc.setFontSize(20)
                doc.setTextColor(255, 0, 0) // Rojo
                doc.text(60, 25, titulo)
                // alert(titulo)
                let columnas =[]
                columnas.push( Object.keys(datos[0]) )

                let data = [] 

                for (let i in datos) {
                    data.push( Object.values(datos[i]));
                }

            doc.autoTable({ 
                head: columnas,
                body: data,
                    margin:{top:40}
                })
            $('#imprimirPDF').html(link);
            doc.save(titulo)
            
        });

        function imprimirEncabezado(doc){
            // alert('Imprimiendo Cabecera')
            doc.setFontSize(10)
            doc.setTextColor(255, 0, 0) // Rojo
            doc.text(10, 15, 'Sistema IES-JCM')
            doc.line(10,17,200,17)
        }
        function imprimirPie(doc){
            // alert('Imprimiendo Cabecera')
            doc.setFontSize(10)
            doc.setTextColor(0, 0, 255) // Azul
            doc.text(100, 280, 'CopyRight 2023')
            doc.line(10,273,200,273)
        }

  });

</script>
