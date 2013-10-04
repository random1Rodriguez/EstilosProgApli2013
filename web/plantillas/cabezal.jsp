<%-- 
    Document   : cabezal
    Created on : 03-oct-2013, 16:08:57
    Author     : Estudiantes
--%>

<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ControladorCategorias"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap.css">
        <script src="../js/jquery-2.0.3.js"></script>
        <script src="../js/bootstrap.js"></script>
        <link rel="stylesheet" href="../css/matias.css">
        
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
    </head>
    
    <body>
        <header>
            <div id="encabezado">
                <div id="logo">
                    <div id="logo_imegen">
                        <img src="">
                    </div>
                    <div id="titulopagina">
                        <span>
                            Market Online
                        </span>
                    </div>
                </div>
                
                <div id="menu_categorias">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Categorias <span class="caret"></span></button>
                        <ul class="dropdown-menu" role="menu">
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
                    </div>
                </div>
                        
                <div id="search">
                    <form id="searchform">
                        <input id="searchfield" type="text" value="Buscar..." onfocus="if (this.value === 'Buscar...') {this.value = '';}" onblur="if (this.value === '') {this.value = 'Buscar...';}">
                        <input id="searchbutton" type="button" value="Ir">
                    </form>
                </div>
                        
                <div id="div_usuario">
                    <div id="icono_usuario">
                        <span>
                            <img src="">
                        </span>
                    </div>
                </div>
                <div id="caja_usaurio">
                    <div id="imagen_usaurio">
                        <img src="">
                    </div>
                    <div id="info_usuario">
                        <span id="nick_usuario">Nick Usuario</span>
                        <span id="email_usuario">Email Usuario</span>
                    </div>
                    <div id="botones">
                        <a id="salir">Salir</a>
                        <a id="ver_perfil">Ver Perfil</a>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
