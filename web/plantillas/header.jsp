

<%@page import="clientes.categorias.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ControladorCategorias"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/aplicacion.js"></script>
    </head>
    <style>
        .btn {
            text-decoration: none;
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
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
        }
        
        .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
        }
        
        .btn:hover,
        .btn:focus {
            color: #333333;
            text-decoration: none;
        }
        .btn-default {
            color: #333333;
            background-color: #ffffff;
            border-color: #cccccc;
        }

        .btn-default:hover,
        .btn-default:focus,
        .btn-default:active {
            color: #333333;
            background-color: #ebebeb;
            border-color: #adadad;
        }

        .btn-danger {
            color: #ffffff;
            background-color: #d9534f;
            border-color: #d43f3a;
        }

        .btn-danger:hover,
        .btn-danger:focus,
        .btn-danger:active {
            color: #ffffff;
            background-color: #d2322d;
            border-color: #ac2925;
        }

        .btn-primary {
            color: #ffffff;
            background-color: #428bca;
            border-color: #357ebd;
        }

        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active {
            color: #ffffff;
            background-color: #3276b1;
            border-color: #285e8e;
        }

        #boton-login{
            top: 9px !important;
            width: 35%;
            height: 33px;
            font-weight: bold;
            color: #FFF;
            background-color: #1BAD1B !important;
            font-family: arial;
            top: 10px !important;
        }

        #registro{
            position: relative !important;
            top: -26px !important;
            left: 50% !important;
            background: #EA005E !important;
            color: #FFF !important;
            font-family: arial !important;
        }

        #slide_login{
            width: 68% !important;
            top: -20px !important;
        }

    </style>

    <script>
        var nav = "";
        $(document).ready(function() {

            comprobarnavegador();
            console.log(nav);
            var path = document.location.pathname.toString();
            var nombreApp = path.split("/")[1];
            var host = document.location.host;

            var dir = location.protocol + "//" + host + "/" + nombreApp + "/";
            var so = navigator.appVersion;
            var url = document.URL;
            var datos = {"so": so, "url": url, "nav": nav};

            console.log(datos);

            $.ajax({
                url: dir + "RegistroAcceso",
                type: "POST",
                data: datos,
                success: function() {
                    console.log("FUNCIONO");
                },
                error: function() {
                    alert("error");
                }
            });

            $.ajax({
                url: dir + "NotificacionNuevaVersion",
                type: "GET",
                success: function(data) {
                    console.log(data);
                },
                error: function() {
                    console.log("error notificacion");
                }
            });
        });

        function comprobarnavegador() {
            /* Variables para cada navegador, la funcion indexof() si no encuentra la cadena devuelve -1, 
             las variables se quedaran sin valor si la funcion indexof() no ha encontrado la cadena. */
            var is_safari = navigator.userAgent.toLowerCase().indexOf('safari/') > -1;
            var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome/') > -1;
            var is_firefox = navigator.userAgent.toLowerCase().indexOf('firefox/') > -1;
            var is_ie = navigator.userAgent.toLowerCase().indexOf('msie ') > -1;

            /* Detectando  si es Safari, vereis que en esta condicion preguntaremos por chrome ademas, esto es porque el 
             la cadena de texto userAgent de Safari es un poco especial y muy parecida a chrome debido a que los dos navegadores
             usan webkit. */

            if (is_safari && !is_chrome) {

                /* Buscamos la cadena 'Version' para obtener su posicion en la cadena de texto, para ello
                 utilizaremos la funcion, tolowercase() e indexof() que explicamos anteriormente */
                var posicion = navigator.userAgent.toLowerCase().indexOf('Version/');

                /* Una vez que tenemos la posición de la cadena de texto que indica la version capturamos la
                 subcadena con substring(), como son 4 caracteres los obtendremos de 9 al 12 que es donde 
                 acaba la palabra 'version'. Tambien podraimos obtener la version con navigator.appVersion, pero
                 la gran mayoria de las veces no es la version correcta. */
                var ver_safari = navigator.userAgent.toLowerCase().substring(posicion + 9, posicion + 12);

                // Convertimos la cadena de texto a float y mostramos la version y el navegador
                ver_safari = parseFloat(ver_safari);

                nav = "Safari " + ver_safari;
            }

            //Detectando si es Chrome
            if (is_chrome) {
                var posicion = navigator.userAgent.toLowerCase().indexOf('chrome/');
                var ver_chrome = navigator.userAgent.toLowerCase().substring(posicion + 7, posicion + 11);
                //Comprobar version
                ver_chrome = parseFloat(ver_chrome);
                nav = "Chrome " + ver_chrome;
            }

            //Detectando si es Firefox
            if (is_firefox) {
                var posicion = navigator.userAgent.toLowerCase().lastIndexOf('firefox/');
                var ver_firefox = navigator.userAgent.toLowerCase().substring(posicion + 8, posicion + 12);
                //Comprobar version
                ver_firefox = parseFloat(ver_firefox);
                nav = "Firefox " + ver_firefox;
            }

            //Detectando Cualquier version de IE
            if (is_ie) {
                var posicion = navigator.userAgent.toLowerCase().lastIndexOf('msie ');
                var ver_ie = navigator.userAgent.toLowerCase().substring(posicion + 5, posicion + 8);
                //Comprobar version
                ver_chrome = parseFloat(ver_ie);
                nav = "Internet Explorer " + ver_ie;
            }
        }

    </script>

    <body>
        <header>
            <div id="encabezado">
                <a href="index.jsp"><div id="logo"></div>
                    <div id="titulopagina">ProApliPlay Web Store</div>
                </a>
                <div id="menu">
                    <span class="clickleable">CATEGORIAS</span>
                </div>
                <div id="slide_cats" class="slidingDiv">

                    <%
                        ManejadorBD.getInstancia().setBd("market");
                        ManejadorBD.getInstancia().setHost("localhost");
                        ManejadorBD.getInstancia().setPuerto("3306");
                        ManejadorBD.getInstancia().setUsuario("root");
                        ManejadorBD.getInstancia().setPassword("root");

                        if (ManejadorBD.getInstancia().estaDesconectado())
                            ManejadorBD.getInstancia().conectar();

                    %>
                    <nav>
                        <ul id="menu_categorias">

                            <%
                                try {
                                    clientes.categorias.ServicioCategorias_Service service = new clientes.categorias.ServicioCategorias_Service();
                                    clientes.categorias.ServicioCategorias port = service.getServicioCategoriasPort();
                                    List categorias =  port.listarCategorias();

                                    if (categorias != null) {
                                        System.out.println("cat: "+categorias);
                                        int i = 0;

                                        while (i < categorias.size()) {
                                            Categoria cat;
                                            cat = (Categoria)categorias.get(i);
                                            out.println("<li><a href='juegosCategoria?id=" + cat.getId() + "'>" + cat.getNombre() + "</a></li>");
                                            i++;
                                        }
                                    }
                                } catch (Exception ex) {
                                    System.err.println("ERROR: "+ex.getMessage());
                                }
                            %>
                        </ul>
                    </nav>
                </div>

                <div id="search">

                    <form id="searchform" method="post" action="busqueda.jsp">

                        <input id="searchfield" name="busqueda" type="text" value="Buscar..." onfocus="if (this.value == 'Buscar...') {
                this.value = '';
            }" onblur="if (this.value == '') {
                this.value = 'Buscar...';
            }">

                        <input id="searchbutton" type="submit" value="Ir">

                    </form>

                </div>

                <div id="login">

                    <span id="span-login">

                        Usuario: 

                        <%

                            //Controlar botones login logout segun estado de sesion

                            if (session.getAttribute("usuario") == null) {

                                out.println("<span>Visitante</span><span class='clickleable'><a href='#' id='btnlogin' class='btn btn-primary' style='top: -27px;'>Login </a> </span>");

                            } else {

                                out.println("<a href='Perfil' ><span>" + session.getAttribute("usuario") + "</span></a><a href='Logout' class='btn btn-danger' style='top: -27px;'>Logout</a></li>");

                            }

                        %>





                    </span>



                    <div id="slide_login">

                        <form id="form_login" method="post" action="Login">

                            <input id="user" name="user" placeholder="Usuario" required>

                            <input type="password" id="password" name="password" placeholder="Contraseña" required>

                            <input id="boton-login" type="submit" value="Login">

                        </form>

                        <a href="registro.jsp" class="btn btn-default" id="registro">Registro</a>

                    </div>

                </div>

            </div>

        </header>

    </body>

</html>

