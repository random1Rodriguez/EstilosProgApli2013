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
                mensaje.append(data);
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
    
});

