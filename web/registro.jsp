
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
        <form id="reg" method="post" action="registro">
            <div id="requeridos">
                <label class="linea">
                    <input id="nick" name="nick" required autofocus placeholder="Usuario">
                    <span id="validacion_nick"></span>
                </label>

                <label class="linea">
                    <input type="text" id="email" name="email" placeholder="Email" required>
                    <span id="validacion_email"></span>
                </label>

                <label class="linea">
                    <input type="password" id="pass" name="pass" required placeholder="Contraseña">
                </label>

                <label class="linea">
                    <input type="password" id="conf_pass" name="conf_pass" required placeholder="Confirmar Contraseña">
                    <span id="validacion_pass" ></span>
                </label>
            </div>
            
            <div id="datos_perfil">
                <label class="linea">
                    <input id="nombre" name="nom" value="" placeholder="Nombre">
                </label>
                
                <label class="linea">
                    <input id="apellido" name="ape"value="" placeholder="Apellido">
                </label>
                
                <label class="linea">
                    <input type="date" id="fnac" name="fnac" value="">
                </label>
                
                <label class="linea">
                    <select name="tipo" id="tipo">
                        <option value="vacio">Tipo de Perfil</option>
                        <option value="c">Cliente</option>
                        <option value="d">Desarrollador</option>
                    </select>
                </label>
            </div>
            <input id="boton" type="submit" value="Registro">
        </form>
    </body>
</html>
