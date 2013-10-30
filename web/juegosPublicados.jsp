
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
        <style>
            #nombreJuego{
                border-radius: 10px 0 10px;
                background: #bcbbbb;
                margin: 1%;
                color: white;
            }
            
             #nombreJuego li{
                 list-style: none;
                 margin: 1%;
                 padding: 1%;
             }
             
             #nombreJuego a{
                 text-decoration: none;
                 color: white;
                 
             }
             
             #nombreJuego a:hover{
                 color: #31b0d5;
                 text-shadow: 50px #000;
                 
             }
             
        </style>
        <title>Alta version de Juego</title>
    </head>
    <body>
        
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        
        <div id="contenedorinputs">   
        <%
               
                 ArrayList juegos = (ArrayList)request.getAttribute("juegos");
                int i = 0;
                %>
                <div id="juegosPublicados" class="JuegosDesarrollador">
                <%
                out.write("<b><span style='color:white'>Selecione un juego, para dar de alta una version:</span><b> <ul id='nombreJuego'>");
                while (i < juegos.size()){
                    Juego j = (Juego)juegos.get(i);
                    out.write("<li>");
                    out.write("<a href= 'verJuego?idJuego=" + j.getId() + "'>"+j.getNombre() + "</a>");
                    out.write("</li>");
                    i++;
                }
                out.write("</ul>");
            
            
        %>
        --%>
    <div id="compras">
            <div class="titulo">
                    <span>Juegos con versiones aprobadas</span>
                </div>
                <%
                ArrayList juegos = (ArrayList)request.getAttribute("juegos");
                int i = 0;
                out.write("<ul id='info_compras'>");
                while (i < juegos.size()){
                    Juego j = (Juego)juegos.get(i);
                    out.write("<li style='list-style:none'><a href='verJuego?idJuego="+j.getId()+"'>"
                            + "<div class='imagenJuegoComprado'><img src='http://progapli2013.comule.com/imagenes/juegos/" + j.getPortada()+"'></a></div></li>");
                    i++;
                }
                out.write("</ul>");
            
            %>
        </div>
         
    </body>
</html>
