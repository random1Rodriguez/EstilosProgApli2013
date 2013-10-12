
<%@page import="controladores.ControladorUsuarios"%>
<%@page import="dominio.Juego"%>
<%@page import="dominio.Version"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Alta version de Juego</title>
    </head>
    <body>
        
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        
           <%
               
                 ArrayList juegos = (ArrayList)request.getAttribute("juegos");
                int i = 0;
                %>
                <div id="juegosPublicados">
                <%
                out.write("<ul>");
                while (i < juegos.size()){
                    Juego j = (Juego)juegos.get(i);
                    out.write("<li>");
                    out.write("<a href= 'verJuego?idJuego=" + j.getId() + "'>"+j.getNombre() + "</a>");
                    out.write("</li>");
                    i++;
                }
                out.write("</ul>");
            
            
        %>
                </div>
        
        
    </body>
</html>
