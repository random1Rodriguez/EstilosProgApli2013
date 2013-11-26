<%-- 
    Document   : consultaReclamo
    Created on : 12-nov-2013, 16:45:54
    Author     : Alexandro
--%>

<%@page import="dominio.Cliente"%>
<%@page import="controladores.ControladorUsuarios"%>
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
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        <div id="contenedor">
            <div id="fondotransparente">
                <div id="enc_rec"> 
                <h1>Reclamos</h1>
               </div>
                <div id="reclamo">
                    <%
                        Controladorjuegos cj = Controladorjuegos.getInstancia();
                        ControladorUsuarios cu = ControladorUsuarios.getInstancia();
                        ArrayList general = (ArrayList) request.getAttribute("general");
                        int i = 0;
                        while (i < general.size()) {

                            ArrayList reclamos = (ArrayList) general.get(i);
                            int j = 0;
                            while (j < reclamos.size()) {
                                dominio.Reclamo r = new dominio.Reclamo();
                                r = (dominio.Reclamo) reclamos.get(j);
                                int idjue = 0;
                                idjue = r.getIDJueg();
                                dominio.Juego jue = new dominio.Juego();
                                jue = cj.verInfoJuego(idjue);
                                dominio.Cliente c= new dominio.Cliente();
                                c =(Cliente)cu.verInfoUsuario(r.getIDCli());
                    %>
                    <ul>
                        <li><%= jue.getNombre()+" ("+c.getNick()+":"+ r.getCatReclamo()+") " +":  -"+ r.getTxtReclamo()%></li>   
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
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
