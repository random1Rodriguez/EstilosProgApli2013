
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/aplicacion.js"></script>
        
        <title>Registro de Usuario</title>
    </head>
    <body>
        <form method="post" action="registro">
            <label>
                <span>Nick</span>
                <input id="nick" name="nick">
                <span id="validacion_nick"></span>
            </label>
            <label>
                <span>Email</span>
                <input id="email" name="email">
                <span id="validacion_email"></span>
            </label>
            
            <input id="boton" type="submit" name="enviar">
        </form>
    </body>
</html>
