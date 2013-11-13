<%-- 
    Document   : consultaReclamo
    Created on : 12-nov-2013, 16:45:54
    Author     : Alexandro
--%>

<%@page import="controladores.Controladorjuegos"%>
<%@page import="clientes.juegos.Juego"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="dominio.Reclamo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Consulta Reclamo</title>
    </head>
    <body>
        <div id="contenedor">
            <div id="fondotransparente">
                <div id="reclamo">
                    <h1>Reclamos</h1>
                    <%
                    Controladorjuegos cj = Controladorjuegos.getInstancia();
                    ArrayList general =(ArrayList)request.getAttribute("general");
                    int i=0;
                    while(i<general.size()){
                        
                       ArrayList reclamos = (ArrayList)general.get(i);
                       int j=0;
                       while(j<reclamos.size()){
                           dominio.Reclamo r = new dominio.Reclamo();
                           r =(dominio.Reclamo)reclamos.get(j);
                           int idjue=0;
                           idjue=r.getIDJueg();
                           dominio.Juego jue = new dominio.Juego();
                           jue = cj.verInfoJuego(idjue);
                           %>
                           <ul>
                               <li><%= jue.getNombre()+r.getTxtReclamo() %></li>   
                           </ul>
                           <%
                           j++;
                       }
                       i++;
                    }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
