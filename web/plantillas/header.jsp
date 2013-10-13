
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ControladorCategorias"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page import="dominio.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/aplicacion.js"></script>
        <link rel="stylesheet" href="css/style2.css">
    </head>
    
    <body>
        <header>
            <div id="encabezado">
                <div id="logo"></div>
                <div id="titulopagina">ProApliPlay Web Store</div>
                <div id="menu">
                    <span class="clickleable">Categorias</span>
                    
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

                        ControladorCategorias cc = ControladorCategorias.getInstancia();
                    %>
                    <nav>
                        <ul id="menu_categorias">
                        <%
                            ArrayList categorias = cc.listarCategorias();
                            if (categorias != null){
                                int i = 0;
                            while (i < categorias.size()){
                                Categoria cat;
                                cat = (Categoria)categorias.get(i);
                                out.println("<li><a href='juegosCategoria?id=" + cat.getId() + "'>" + cat.getNombre() + "</a></li>");
                                i++;
                            }
                            }
                        %>
                        </ul>
                    </nav>
                </div>
                <div id="search">
                    <form id="searchform" method="post" action="busqueda.jsp">
                        <input id="searchfield" name="busqueda" type="text" value="Buscar..." onfocus="if (this.value == 'Buscar...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Buscar...';}">
                        <input id="searchbutton" type="submit" value="Ir">
                    </form>
                </div>
                <div id="login">
                    <span>
                        Usuario: 
                            <%
                            //Controlar botones login logout segun estado de sesion
                            if (session.getAttribute("usuario") == null){
                                out.println("<span>Visitante</span></li><span class='clickleable'><a href='#'>  || Login </a> </span>");
                            }else{
                                out.println("<a href='Perfil'><span>" +session.getAttribute("usuario")+"</span></a><a href='Logout'>  || Logout</a></li>");
                            }
                            
                                    ;
                            %>
                           
                        
                    </span>
                    
                    <div id="slide_login">
                        <form id="form_login" method="post" action="Login">
                            <input id="user" name="user" placeholder="Usuario" required>
                            <input type="password" id="password" name="password" placeholder="Contraseña" required>
                            <input type="submit" value="Login">
                        </form>
                        <button id="registro">Registro</button>
                        <span id="error" class="error" >${error}</span>
                    </div>
                </div>
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
                        <input id="apellido" name="ape" value="" placeholder="Apellido" autocomplete="off">
                    </label>

                    <label class="linea">
                        <input type="date" id="fnac" name="fnac" value="1990-01-01">
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
        </header>
    </body>
</html>
