
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        <title>Registro de Usuario</title>

        <style>
            #contenedor-registro{
                width: 35%;
                margin: 10% auto;
            }

            #popup_reg{
                display: none;
                width: 400px;
                margin: auto;
                z-index: 2;
                position: relative;
                left: 0px;
                top: 120px;
            }

            #cerrar{
                float: right;
                position: relative;
                top: 10px;
                right: 7px;
                cursor: pointer;
            }

            #reg{
                background-color: rgba(33, 33, 46, 0.8);
                border-radius: 0 15px;
                padding: 35px 0px 35px 0px;  
                margin: auto;
            }

            #boton{
                position: relative;
                top: 12px;
                left: 40%;
                display: inline-block;
                padding: 6px 12px;
                margin-bottom: 0;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.428571429;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                cursor: pointer;
                border: 1px solid rgba(0, 0, 0, 0);
                border-radius: 4px;
                -webkit-user-select: none;
                color: #FFF;
                background-color: #428BCA;
                border-color: #357EBD;
                -moz-user-select: none;
                -ms-user-select: none;
                -o-user-select: none;
                user-select: none;
            }

            #boton:hover,#boton:focus,#boton:active{
                color: #ffffff;
                background-color: #3276b1;
                border-color: #285e8e;
            }

            #requeridos input, #datos_perfil input {
                border-radius: 5px;
                font-size: 18px;
                height: 2em;
                padding-left: 2%;
                width: 97%;
            }

            #requeridos :focus{
                box-shadow: 0 0 15px 5px #E7EBF7;
                outline: none;
            }

            #validacion_nick, #validacion_email, #validacion_pass{
                z-index: 3;
                position: relative;
                top: -33px;
                left: 345px;
            }

            #datos_perfil :focus{
                box-shadow: 0 0 15px 5px #E7EBF7;
                outline: none;
            }

            #tipo{
                height: 2.5em;
                border-radius: 5px;
                width: 100%;
            }
        </style>
    </head>
    <body>

        <div id="contenedor-registro">
            <form id="reg" method="post" action="registro">
                <div id="requeridos">
                    <label class="linea">
                        <input id="nick" name="nick" required autofocus placeholder="Usuario" autocomplete="false">
                        <span id="validacion_nick"></span>
                    </label>

                    <label class="linea">
                        <input type="text" id="email" name="email" placeholder="Email" required autocomplete="false">
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
                        <input id="nombre" name="nom" value="" placeholder="Nombre" autocomplete="false">
                    </label>

                    <label class="linea">
                        <input id="apellido" name="ape" value="" placeholder="Apellido" autocomplete="false">
                    </label>

                    <label class="linea">
                        <input type="date" id="fnac" name="fnac" value="" autocomplete="false">
                    </label>

                    <label class="linea">
                        <select name="tipo" id="tipo">
                            <option value="vacio">Tipo de Perfil</option>
                            <option value="c">Cliente</option>
                            <option value="d">Desarrollador</option>
                        </select>
                    </label>
                    <label class="linea" id="sitio">
                        <input name="sitio" value='' placeholder="Sitio Web">
                    </label>
                </div>
                <input id="boton" type="submit" value="Registro">
            </form>
        </div>

        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
