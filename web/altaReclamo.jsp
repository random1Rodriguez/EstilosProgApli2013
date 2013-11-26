<%-- 
    Document   : altaReclamo
    Created on : 12-nov-2013, 16:02:24
    Author     : Alexandro
--%>

<%@page import="dominio.Juego"%>
<%@page import="controladores.Controladorjuegos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">        
        <title>Alta Reclamo</title>
    </head>
    <body>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        <%
            String carpeta = "http://progapli2013.comule.com/imagenes/juegos/";
            Controladorjuegos cj = Controladorjuegos.getInstancia();
            Juego j = cj.verInfoJuego(Integer.parseInt(request.getParameter("id")));
        %>

        <div id="contenedor">
            <div id="fondotransparente">
                <div id="imagenJuegoRec">
                    <img src="<%=carpeta + j.getPortada()%>"><br>
                    <div id="nom_j_rec">
                    <span><%=j.getNombre()%></span>
                    </div>
                </div>
            <div id="form_rec">    
                <form name="frm" action="altaReclamo" method="get">
                    <input type="radio" name="select" value="Mal Funcionamiento">Mal Funcionamiento<br>
                    <input type="radio" name="select" value="Contenido Inapropiado">Contenido Inapropiado<br>
                    <input type="radio" name="select" value="Facturacion Erronea">Facturacion Erronea<br>
                    <textarea name="texto" rows="4" cols="50"></textarea><br>
                    <input type="submit" value="enviar">
                    <input name="idJu" hidden="true" value="<%= request.getParameter("id")%>">
                    <input name="idUsu" hidden="true" value="<%= session.getAttribute("idU")%>">
                </form>    
             </div>>
            </div>
        </div>
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
