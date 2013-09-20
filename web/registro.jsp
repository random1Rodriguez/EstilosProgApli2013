
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
            <label class="linea">
                <span class="titulo">Nick</span>
                <input id="nick" name="nick" pattern="[a-zA-Z0-9]+" required autofocus title="Solo Letras y Numeros">
                <span id="validacion_nick"></span>
            </label>
            
            <label class="linea">
                <span class="titulo">Email</span>
                <input type="text" id="email" name="email" placeholder="Tu Email" required>
                <span id="validacion_email"></span>
            </label>
            
            <label class="linea">
                <span class="titulo">Contraseña</span>
                <input type="password" id="pass" name="pass" required>
            </label>
            
            <label class="linea">
                <span class="titulo">Confirmar Contraseña</span>
                <input type="password" id="conf_pass" name="conf_pass" required>
            </label>
            
            <div id="datos_perfil">
                <label class="linea">
                    <span class="titulo">Nombre</span>
                    <input id="nombre" name="nom" value="">
                </label>
                
                <label class="linea">
                    <span class="titulo">Apellido</span>
                    <input id="apellido" name="ape"value="">
                </label>
                
                <label class="linea">
                    <span class="titulo">Fecha Nacimiento</span>
                    <input type="date" id="fnac" name="fnac" value="">
                </label>
                
                <span class="titulo">Tipo de Cuenta</span>
                <select name="tipo" id="tipo">
                    <option value="c">Cliente</option>
                    <option value="d">Desarrollador</option>
                </select>
            </div>
            <input id="boton" type="submit" value="Registro">
        </form>
    </body>
</html>
