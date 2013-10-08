
<%@page import="org.apache.el.lang.FunctionMapperImpl.Function"%>
<%@page import="dominio.Comentario"%>
<%@page import="dominio.Juego"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La Mejor Tienda de Juegos Online</title>
    </head>
    <body>
        <div id="contenedor">
            <jsp:include page="plantillas/header.jsp"></jsp:include>
            <div  class='listaJuegos'>
            <ul>
                <%
                    
                    
                    if(request.getAttribute("listaJuegos")!= null){
                        ArrayList<Juego> juegos = (ArrayList<Juego>)request.getAttribute("listaJuegos");
                        int i=0;

                        while(i<juegos.size()){
                            Juego j = juegos.get(i);
                            out.write("<div>");
                            out.write("<div id = 'imgJuego'>");
                            out.write("<img src=" + j.getPortada() + ">");
                            out.write("</div>");
                            out.write("<li>");
                            out.write(j.getNombre());
                            //out.write("<ul>");
                            out.write("</li>");
                            out.write("<li>");
                            String desc = j.getDescripcion();
                            if(desc.length()>200){
                                out.write(desc.substring(0, 200) + "...");
                            }else{
                                out.write(desc);
                            }
                            out.write("</li>");
                            out.write("<li>");        
                            out.write(Double.toString(j.getPrecio()));
                            out.write("</li>");
                            out.write("<li>");        
                            out.write("<a href='verInfoJuego?id=" + j.getId() + "'>Ver Info Juego</a>");
                            out.write("</div>");
                            i++;
                        }
                    }
                    if(request.getAttribute("infoJuego")!= null){

                       Juego ju = (Juego)request.getAttribute("infoJuego");
                       out.write("<ul>");
                           out.write("<li>");
                               out.write("Nombre del juego");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(ju.getNombre());
                           out.write("</li>");
                           out.write("<li>");
                               out.write("Descripcion");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(ju.getDescripcion());
                           out.write("</li>");
                           out.write("<li>");
                               out.write("Desarrollador");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(ju.getDes().getNick());
                           out.write("</li>"); 
                           out.write("<li>");
                               out.write("Tamaño");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(String.valueOf(ju.getSize()) + " Kb");
                           out.write("</li>");
                           out.write("<li>");
                               out.write("Categorias");
                           out.write("</li>");
                           ArrayList<Categoria> lstCat = (ArrayList<Categoria>)ju.getCategorias();
                           int i=0;
                           out.write("<div>");
                           while(i<lstCat.size()){
                               out.write("<li>");
                                   out.write(lstCat.get(i).getNombre());
                               out.write("</li>");
                               i++;
                           }
                           out.write("</div>");


                           if(session.getAttribute("usuario") != null){
                              /* out.write("<div id=ultiVersion>");


                               out.write("</div>");*/
                           }
                       out.write("</ul>");
                    }

                %>
            </ul>

        </div>

        </div>
        
            <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
