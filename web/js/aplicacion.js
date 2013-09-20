$(document).ready(function(){
    var mensaje;
    function validar(campo, valor){
        var direccion = "validarNickEmail?"+campo+"="+valor;
        $.ajax({
            url: direccion,
            type: "GET",
            success: function(data){
                
                if (campo === "nick"){
                    mensaje = $("#validacion_nick");
                }
                if (campo === "email"){
                    mensaje = $("#validacion_email");
                }
                mensaje.empty();
                if (data === "1"){
                    //mensaje.css("color","green");
                    //mensaje.append("Disponible");
                    mensaje.append("<img src='img/tick.png'>");
                }
                else{
                    //mensaje.css("color","red");
                    //mensaje.append("Esta en Uso");
                    mensaje.append("<img src='img/cruz.png'>");
                }
                console.log(data);
            },
            error: function(){
                alert("error");
            }
        });
    }
    
    $("#nick").keyup(function(){
        var nick = $(this).val();
        if (nick !== ""){
            validar("nick", nick);
        }
        else{
            mensaje.empty();
        }
    });
    
    $("#email").keyup(function(){
        var email = $(this).val();
        if (email !== ""){
            validar("email", email);
        }
        else{
            mensaje.empty();
        }
    });
    
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
    
    
    
    
});

