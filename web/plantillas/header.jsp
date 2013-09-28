<%-- 
    Document   : header
    Created on : 23-sep-2013, 19:55:23
    Author     : Estudiantes
--%>

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
    <body>
        <header>
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
        </header>
    </body>
</html>
