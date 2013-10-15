
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
        <link rel="stylesheet" href="css/style.css">
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
    </style>
    <body>
        <header>
            <div id="encabezado">
                <div id="logo"></div>
                <div id="titulopagina">ProApliPlay Web Store</div>
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
                                out.println("<span>Visitante</span><span class='clickleable'><a href='#' id='btnlogin'>  || Login </a> </span>");
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
                        <a href="registro.jsp" class="btn btn-default" id="registro">Registro</a>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
