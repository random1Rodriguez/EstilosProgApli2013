$(document).ready(function(){
    var msj_validacion;
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
                    msj_validacion.append("<img src='img/tick.png'>");
                }
                else{
                    //mensaje.css("color","red");
                    //mensaje.append("Esta en Uso");
                    msj_validacion.append("<img src='img/cruz.png'>");
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
                          "<span class='titulo'>Sitio Web</span>"+
                           "<input type='url' name='sitio' value=''></label>";
                   
        console.log("cambio");
        
        if (! visible && opcion === "d"){
            $(this).after(input_sitio);
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
        
        var pass = $("#pass").val();
        var conf_pass = $(this).val();
       
        if (pass !== ""){
            if (conf_pass !== pass){
               msj_validacion.append("<img src='img/cruz.png'>");
            }
            else{
                msj_validacion.append("<img src='img/tick.png'>");
            }
        }
    });
    
    
});

