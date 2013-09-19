
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/aplicacion.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <title>Registro de Usuario</title>
    </head>
    <body>
        <form method="post" action="registro">
            <span>Nick</span>
            <input id="nick" name="nick">
            <span id="validacion_nick"></span>
            <span>Email</span>
            <input id="email" name="email">
            <span id="validacion_email"></span>
            <span>Contraseña</span>
            <input type="password" id="pass">
            <span>Confirmar Contraseña</span>
            <input type="password" id="conf_pass">
            
            <div id="datos_perfil">
                <span>Nombre</span>
                <input type="text" id="nombre" value="">
                <span>Apellido</span>
                <input type="text" id="apellido" value="">
                <span>Fecha Nacimiento</span>
                <input type="date" id="fnac" value="">
                <div>
                    <span>Tipo de Cuenta</span>
                    <span>Cliente</span>
                    <input type="radio" name="tipo_cuenta" value="c">
                    <span>Desarrollador</span>
                    <input type="radio" name="tipo_cuenta" value="d">
                </div>
            </div>
            
            <input id="boton" type="submit" name="enviar">
        </form>
    </body>
</html>
