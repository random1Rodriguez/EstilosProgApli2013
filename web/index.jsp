
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ControladorCategorias"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La Mejor Tienda de Juegos Online</title>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
    </head>
    <body>
        <span>
            <button id="boton_registro">Registro popup</button>
        </span>
               
        <div>
            Prueba Login
            <form method="post" action="Login">
                <input id="user" name="user" placeholder="Usuario" required>
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                <input type="submit" value="Login">
                <span id="error" class="error" >${error}</span>
            </form>
            <span>
                Usuario: <a href="Perfil"><%= session.getAttribute("usuario") %></a>
                <a href='Logout'><button>Logout</button></a>
            </span>
        </div>
        
        <div id="popup_reg">
            <div id="cerrar"><img src="img/cruz.png"></div>
            <form id="reg" method="post" action="registro">
                <div id="requeridos">
                    <label class="linea">
                        <input id="nick" name="nick" required autofocus placeholder="Usuario" autocomplete="off">
                        <span id="validacion_nick"></span>
                    </label>

                    <label class="linea">
                        <input type="text" id="email" name="email" placeholder="Email" required autocomplete="off">
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
                        <input id="nombre" name="nom" value="" placeholder="Nombre" autocomplete="off">
                    </label>

                    <label class="linea">
                        <input id="apellido" name="ape"value="" placeholder="Apellido" autocomplete="off">
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
        </div>
        
            
                
        
                
                
        <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
    
</html>
