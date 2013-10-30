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
                top: 0px;
                left: -7%;
                width: 60%;
                height: 130px;
                margin: 0 auto;
                border: solid;
            }
            
            #contenedor{
                position: relative;
                top: 100px;
                margin-bottom: 325px !important;
            }
            
            #footer{
               margin-top: 0px !important;
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
            
            <%
                String ruta = "http://progapli2013.comule.com/imagenes/juegos/";
                Controladorjuegos cj = Controladorjuegos.getInstancia();
                System.out.println("busqueda: "+request.getParameter("busqueda"));
                ArrayList juegos = cj.buscar(request.getParameter("busqueda"));
                
                if(juegos != null){
                    System.out.println("juego not null");
                    int cant = juegos.size();
                    
                    if(cant > 0){
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
                            <span>Resultados para: <span><%= request.getParameter("busqueda") %> </span>(<%= cant%> Resultados)</span>
                        </div>
                    </div>
                    
                <div id="fondotransparente"> <%--comienza fondo transparente --%>
                    <div  id="contenedorJuegos"> <%-- comienza contenedor juegos --%>
                        <ul>
                        <%
                            int i=0;
                            while(i<juegos.size()){
                                Juego j = (Juego)juegos.get(i);
                                out.write("<div class='ModuloJuego'><a href='verInfoJuego?id=" + j.getId() + "'>");
                                out.write("<div class = 'imgJuego'>");
                                out.write("<img class='imgJuego' src='" +ruta + j.getPortada() + "'>");
                                out.write("</div>");
                                out.write("<li class='nombrejuego'><b>");
                                out.write(j.getNombre());
                                //out.write("<ul>");
                                out.write("</b></li>");
                                out.write("<li class='descjuego'>");
                                String desc = j.getDescripcion();
                                if(desc.length()>200){
                                    out.write(desc.substring(0, 200) + "...");
                                }else{
                                    out.write(desc);
                                }
                                out.write("</li>");
                                out.write("<li class='preciojuego'> u$s <b>");        
                                out.write(Double.toString(j.getPrecio()));
                                out.write("</b></li>");
                                out.write("<li></a>");        
                                out.write("</div>");
                                i++;
                            }
                                    
                        %>
                        </ul>
                    </div> <%-- termina contenedor juegos --%>
                </div> <%--termina fondo transparente --%>
        <%
                }
                else{
                    System.out.println("entro al else");
                    out.write("No se encontro ningun juego");
                }
            }
        %>
        </div> <%--termina contenedor --%>
        <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
