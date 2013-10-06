<%-- 
    Document   : login
    Created on : 05-oct-2013, 16:04:12
    Author     : Matias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProgApliPlay Market</title>
        <style>
            
            #contenedor{
                width: 480px;
                height: 340px;
                border: solid #000;
                margin: 0 auto;
            }
            #caja_error{
                border: solid #c81616;
                height: 20%;
            }
            #contenedor_login{
                height: 64%;
                padding: 5%;
            }
            #contenedor_login form{
                padding: 5%;
                height: 80%;
            }
            #contenedor_login form input{
                border-radius: 5px;
                font-size: 18px;
                margin-bottom: 4px;
                height: 2em;
                padding-left: 3%;
                width: 70%;
                display: block;
                margin: 5% auto;
            }
            #contenedor_login form .submit{
                width: 40%;
                margin: 10% auto 0;
                display: inline;
            }
        </style>
    </head>
    <body>
        <div id="contenedor">
            <div id="caja_error">
                <span id="error" class="error" >${error}</span>
            </div>
            
            <div id="contenedor_login">
                <form id="form_login" method="post" action="Login">
                    <input id="user" name="user" placeholder="Usuario" required>
                    <input type="password" id="password" name="password" placeholder="Contraseña" required>
                    <div>
                        <input class="submit" type="submit" value="Entrar">
                        <span> o <a href="registro.jsp">Registrarse</a></span>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
