<%-- 
    Document   : busqueda
    Created on : 07-oct-2013, 16:56:55
    Author     : Estudiantes
--%>

<%@page import="controladores.Controladorjuegos"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page import="dominio.Categoria"%>
<%@page import="dominio.Juego"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProgApliPlay Market</title>

        <style>
            #resultado-busqueda{
                position: relative;
                top: 80px;
                width: 80%;
                height: 130px;
                margin: 0 auto;
                border: solid;
                left: -4%;
            }

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
            .info_juego {
                margin-left: 5%;
            }

        </style>
    </head>
    <body>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
            <div id="contenedor">
                <div id="fondotransparente"> <%--comienza fondo transparente --%>
                <div  id="contenedorJuegos"> <%-- comienza contenedor juegos --%>
                    <%
                        String ruta = "http://progapli2013.comule.com/imagenes/juegos/";
                        Controladorjuegos cj = Controladorjuegos.getInstancia();
                        System.out.println("busqueda: " + request.getParameter("busqueda"));
                        ArrayList juegos = cj.buscar(request.getParameter("busqueda"));

                        if (juegos != null) {
                            System.out.println("juego not null");
                            int cant = juegos.size();

                            if (cant > 0) {
                                System.out.println("tamaño mayor a 0");
                    %>

                    <div id="resultado-busqueda">
                        <div id="busqueda-filtros">
                            <select id="ordenar">
                                <option>Ordenar por...</option>
                                <option>Alfabeticamente</option>
                                <option>Por Ventas</option>
                            </select>

                            <select>
                                <option>Precio</option>
                                <option>$0 a $3</option>
                                <option>$3 a $10</option>
                                <option>mas de $10</option>
                            </select>
                        </div>
                        <div id="cantidad-resultados">
                            <span>Resultados para: <span><%= request.getParameter("busqueda")%> </span>(<%= cant%> Resultados)</span>
                        </div>
                    </div>

                    <div>
                        <%
                            int i = 0;
                            while (i < juegos.size()) {
                                Juego j = (Juego) juegos.get(i);
                                out.write("<div class='ModuloJuego'><a href='verInfoJuego?id=" + j.getId() + "'>");
                                out.write("<div class = 'imgJuego'>");
                                out.write("<img class='imgJuego' src='" + ruta + j.getPortada() + "'>");
                                out.write("</div>");
                                out.write("<div class='nombrejuego'><b>");
                                out.write(j.getNombre());
                                //out.write("<ul>");
                                out.write("</b></div>");
                                out.write("<div class='descjuego'>");
                                String desc = j.getDescripcion();
                                if (desc.length() > 200) {
                                    out.write(desc.substring(0, 200) + "...");
                                } else {
                                    out.write(desc);
                                }
                                out.write("</div>");
                                out.write("<div class='preciojuego'> u$s <b>");
                                out.write(Double.toString(j.getPrecio()));
                                out.write("</b></div>");
                                out.write("</a>");
                                out.write("</div>");
                                i++;
                            }

                        %>
                    </div>


                    <%
                    } else {
                    %>
                    <div id="sin-resultados">
                        <div id="mensaje">
                            <span>No se encontro ningun juego</span>
                        </div>

                        <%
                            // si el atributo listaJuegos es null quiere decir que no 
                            // eligio ninguna categoria para mostrar, entonces muestra los mas
                            // comprados y los que tienen mejor puntuacion
                            if (request.getAttribute("listaJuegos") == null) {
                        %>
                        <%-- MAS COMPRADOS --%>
                        <div id="mas-comprados" class="contenedor-destacados">
                            <div class="titulo-grande">
                                <span>LOS MAS COMPRADOS</span>
                            </div>
                            <div>
                                <%

                                    ArrayList juegos_masComprados = (ArrayList) cj.listarMasComprados(3);
                                    int i = 0;

                                    while (i < juegos_masComprados.size()) {
                                        Juego j = (Juego) juegos_masComprados.get(i);
                                        //out.write("<li>");
                                        out.write("<div class='ModuloJuego'><a href='verInfoJuego?id=" + j.getId() + "'>");
                                        out.write("<div class='imgJuego'>");
                                        out.write("<img class='imgJuego' src='" + ruta + j.getPortada() + "'>");
                                        out.write("</div>");
                                        out.write("<div class='nombrejuego'><b>");
                                        out.write(j.getNombre());
                                        out.write("</b></div>");
                                        out.write("<div class='descjuego'>");
                                        String desc = j.getDescripcion();
                                        if (desc.length() > 200) {
                                            out.write(desc.substring(0, 200) + "...");
                                        } else {
                                            out.write(desc);
                                        }
                                        out.write("</div>");
                                        out.write("<div class='preciojuego'> u$s <b>");
                                        out.write(Double.toString(j.getPrecio()));
                                        out.write("</b></div>");
                                        out.write("</a>");
                                        out.write("</div>");
                                        //out.write("</li>");
                                        i++;
                                    }
                                %>
                            </div>
                        </div>
                        <%-- FIN MAS COMPRADOS --%>

                        <%-- MEJOR PUNTUADOS --%>
                        <div id="mejor-puntuados" class="contenedor-destacados">
                            <div class="titulo-grande">
                                <span>LOS MEJORES PUNTUADOS</span>
                            </div>
                        </div>
                        <%-- TERMINA MEJOR PUNTUADOS --%>
                        <%
                            }
                        %>
                    </div>
                    <%
                            }
                        }
                    %>
                </div> <%-- termina contenedor juegos --%>
            </div> <%--termina fondo transparente --%>
        </div> <%--termina contenedor --%>
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
