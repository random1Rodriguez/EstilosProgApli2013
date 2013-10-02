
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
                                 out.write("</div>");
                                 out.write("<li>");
                                 out.write(j.getNombre());
                                 //out.write("<ul>");
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

                                 out.write("</li>");
                                 //out.write("</ul>");
                                 out.write("</li>");
                                 out.write("</div>");
                                 i++;
                             }
                         }
                         if(request.getAttribute("infoJuego")!= null){
                             Juego ju = (Juego)request.getAttribute("infoJuego");
                             out.write(ju.getNombre());
                             out.write(ju.getDescripcion());
                             
                             out.write("Categorias\n");
                             ArrayList<Categoria> lstCat = ju.getCategorias();
                             int i=0;
                             while(i>lstCat.size()){
                                 out.write(lstCat.get(i).getNombre() + "\n");
                                 i++;
                                 
                             }
                             
                             out.write(ju.getNombre());
                         }
                         %>
            </ul>
        </div>
        </div>
    <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
