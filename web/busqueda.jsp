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
            #listaJuegos{
                width: 75%;
                margin: auto;
            }
            
            .div_juego{
                border: solid;
                height: 330px;
                max-width: 30%;
                float: left;
                margin: 2%;
            }
            
            .imgJuego{
                width: 95%;
                margin: 3% auto;
            }
            
            .imgJuego img{
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        <div id="contenedor">
            <div id="fondotransparente">
                <div  id="contenedorJuegos">/*
                    <ul>
                        <%  
                            String ruta = "http://progapli2013.comule.com/imagenes/juegos/";
                            Controladorjuegos cj = Controladorjuegos.getInstancia();
                            System.out.println("busqueda: "+request.getParameter("busqueda"));
                            ArrayList juegos = cj.buscar(request.getParameter("busqueda"));

                            if (juegos != null){
                                if(! juegos.isEmpty()){
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
                                }
                                else{
                                    out.write("No se encontro ningun juego");
                                }
                            }
                        %>
                    </ul>

                </div>
            </div>
        </div>
        <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
