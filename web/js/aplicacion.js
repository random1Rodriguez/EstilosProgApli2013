$(document).ready(function(){
    var msj_validacion;
    var div_datos = $("#datos_perfil");
    
    div_datos.hide();
    function validar(campo, valor){
        var direccion = "validarNickEmail?"+campo+"="+valor;
        $.ajax({
            url: direccion,
            type: "GET",
            success: function(data){
                
                if (campo === "nick"){
                    msj_validacion = $("#validacion_nick");
                }
                if (campo === "email"){
                    msj_validacion = $("#validacion_email");
                }
                msj_validacion.empty();
                if (data === "1"){
                    //mensaje.css("color","green");
                    //mensaje.append("Disponible");
                    msj_validacion.append("<img src='img/tick24.png'>");
                }
                else{
                    //mensaje.css("color","red");
                    //mensaje.append("Esta en Uso");
                    msj_validacion.append("<img src='img/cruz24.png'>");
                }
                console.log(data);
            },
            error: function(){
                alert("error");
            }
        });
    }
    
    //manejo del evento de soltar una tecla en el campo nick
    $("#nick").keyup(function(){
        var nick = $(this).val();
        if (nick !== ""){
            validar("nick", nick);
        }
        else{
            msj_validacion.empty();
        }
    });
    
    //manejo del evento de soltar una tecla en el campo email
    $("#email").keyup(function(){
        var email = $(this).val();
        if (email !== ""){
            validar("email", email);
        }
        else{
            msj_validacion.empty();
        }
    });
    
    //manejo del evento de seleccion en el combobox del tipo de perfil
    $("#tipo").change(function(){
        var visible = false;
        var opcion = $(this).find("option:selected").val();
        console.log(opcion);
        
        var input_sitio = "<label class='linea' id='sitio'>"+
                          "<input type='url' name='sitio' value='' placeholder='Sitio Web'>"+
                          "</label>";
                   
        console.log("cambio");
        
        if (! visible && opcion === "d"){
            $(this).parent().after(input_sitio);
            visible = true;
        }
        else{
            $("#sitio").remove();
            visible = false;
        }
    });
    
    //manejo evento soltar tecla en campo confirmar contraseña
    $("#conf_pass").keyup(function(){
        
        msj_validacion = $("#validacion_pass");
        msj_validacion.empty();
        
        var nick = $("#nick").val();
        var email = $("#email").val();
        var pass = $("#pass").val();
        var conf_pass = $(this).val();
        
        console.log(nick+","+email+","+pass+","+conf_pass);
       
        if (pass !== ""){
            console.log("pass != vacio");
            if (conf_pass !== pass){
                console.log("pass != conf_pass");
               msj_validacion.append("<img src='img/cruz24.png'>");
               div_datos.hide();
            }
            else{
                console.log("pass == conf_pass");
                msj_validacion.append("<img src='img/tick24.png'>");
                if (nick !== "" && email !== ""){
                    console.log("nick y email != vacio");
                    div_datos.show();
                }
            }
        }
    });
    
    /*------------------ mostrar popup registro ------------------------*/
    $("#boton_registro").click(function(){
       $("#popup_reg").fadeIn(300);
    });
    
    /*------------------ ocultar popup registro ------------------------*/
    $("#cerrar").click(function(){
        $("#popup_reg").fadeOut(300);
    });
    
});

