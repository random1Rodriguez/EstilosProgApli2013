$(document).ready(function(){
    var msj_validacion;
    var div_datos = $("#datos_perfil");
    $("#sitio").hide();
    var sitio_visible = false;
    
    var nick_valido = false;
    var email_valido = false;
    var pass_valida = false;
    
    
    $("#slide_cats").hide(); //se esconde el menu de las categorias
    $("#slide_login").hide(); // se esconde el cuadro de login
    
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
                    if (msj_validacion.is("#validacion_nick")){
                        nick_valido = true;
                    }
                    else{
                        email_valido = true;
                    }
                        
                }
                else{
                    //mensaje.css("color","red");
                    //mensaje.append("Esta en Uso");
                    msj_validacion.append("<img src='img/cruz24.png'>");
                    if (msj_validacion.is("#validacion_nick")){
                        nick_valido = false;
                    }
                    else{
                        email_valido = false;
                    }
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
        console.log("change");
        
        var opcion = $(this).find("option:selected").val();
        console.log(opcion);
       
        
        if (sitio_visible === false && opcion === "d"){
            console.log($(this));
            $("#sitio").show();
            sitio_visible = true;
        }
        else{
            $("#sitio").hide();
            sitio_visible = false;
        }
    });
    
    //manejo evento soltar tecla en campo confirmar contraseña
    $("#conf_pass").keyup(function(){
        
        msj_validacion = $("#validacion_pass");
        msj_validacion.empty();
        var pass = $("#pass").val();
        var conf_pass = $(this).val();
       
        if (pass !== ""){
            //console.log("pass != vacio");
            if (conf_pass !== pass){
                //console.log("pass != conf_pass");
               msj_validacion.append("<img src='img/cruz24.png'>");
               pass_valida = false;
            }
            else{
                //console.log("pass == conf_pass");
                msj_validacion.append("<img src='img/tick24.png'>");
                pass_valida = true;
            }
        }
    });
    
    $("#contenedor-registro input").keyup(function(){
       //console.log("escribio");
       
       if (nick_valido && email_valido && pass_valida){
           console.log("muestra div-datos");
           div_datos.show();
       }
       else{
           console.log("oculta div-datos");
           div_datos.hide();
       }
    });
    
    $("#menu .clickleable").click(function(e){
        $("#slide_cats").slideToggle(500);
        //e.stopPropagation();
    });
    
    $("#login .clickleable").click(function(e){
        $("#slide_login").slideToggle(500);
        //e.stopPropagation();
    });
    
//    $(document).click(function(){
//        $("#slide_cats").slideUp(400);
//        $("#slide_login").slideUp(400);
//    });

    /*---------------------- cabezal nuevo -------------------------*/
    $("#popup_login").hide();
    
    $("#login").click(function(){
       $("#popup_login").show(); 
    });
    
    
    
    
    
});

