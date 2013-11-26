
<%@page import="clientes.juegos.Juego"%>
<%@page import="dominio.Version"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .btnr{
                position: relative;
                left: 44px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Perfil de usuario</title>
    </head>
    <body>
        
       <jsp:include page="plantillas/header.jsp"></jsp:include>
       <div id="contenedor">
       <div id="contenedorinputs">
       <%  
            String server = "http://progapli2013.comule.com/";
            String imagenes_perfil = server + "imagenes/perfiles/";
            String imagenes_juegos = server + "imagenes/juegos/";
            Usuario u = null;
            String tipo;
            if (request.getAttribute("perfil") != null){
                u = (Usuario)request.getAttribute("perfil");
            }
            if (u.getTipo().equals("c")){
                tipo = "Cliente";
            }
            else{
                tipo = "Desarrollador";
            }
        %>
            <%
            if(!u.getTipo().equals("c"))
            {
                %>
                
                    <span>
                        <a href="altajuego.jsp" class="btn">Agregar Juego</a>
                    </span>

                    <span>
                        <a href="juegosPublicados" class="btn">Agregar Version de Juego</a>
                </span>
                <span>
                    <a href="ConsultaReclamo?idUsu=<%=session.getAttribute("idU").toString()%>" class="btn">Ver Reclamos</a>
                </span>
                <span>
                    <a href="verEstadisticas.jsp" class="btn">Ver estadisticas</a>
                </span>
                <%
            }
                %>
        
        <div id="imagen">
            <%
            if (u.getImg().equals("")){
                out.write("<div class='imagen'><img src='img/perfil_defecto.jpg'></div>");
            }
            else{
                out.write("<div class='imagen'><img src='"+imagenes_perfil+u.getImg()+"'></div>");
            }
            %>
        </div>
        
        <div id="info_cuenta">
            <span>Nick: <%=u.getNick()%></span><br>
            <span>Email: <%=u.getEmail()%></span><br>
            <span>Tipo de Perfil: <%=tipo%></span><br>
        </div>
        
        <div id="info_personal">
            <span>Nombre: <%=u.getNombre()%></span><br>
            <span>Apellido: <%=u.getApellido()%></span><br>
            <span>Fecha Nacimiento: <%=u.getFecha_nac().toString()%></span><br>
            <span>Edad: <%=String.valueOf(u.getEdad())%></span><br>
        </div>
        <%
            //si el usuario logueado 
            if(request.getAttribute("versiones") != null && u.getTipo().equals("d")){
                //ArrayList<Juego> juegos = (ArrayList<Juego>)request.getAttribute("juegos");

                int i = 0;
              /* 
                out.write("<div id='desarrollos'>");
                out.write("<ul>");

                while (i < juegos.size()){
                    Juego j = (Juego)juegos.get(i);
                    out.write("<li>");
                    out.write("<br><a href = 'verJuego?idJuego=" + j.getId() + "'>Juego: "+j.getNombre() + "</a>");
                    out.write("<div class='imagen'><img src='"+imagenes_juegos+j.getPortada()+"'></div>");
                    out.write("</li>");
                    i++;
                }
*/

                ArrayList versiones = (ArrayList)request.getAttribute("versiones");
                i = 0;
                out.write("<ul class='JuegosDesarrollador'><b>Versiones: <br></b>");

                while (i < versiones.size()){
                    Version v = (Version)versiones.get(i);
                    
                    if (v.getEstado().equals("pendiente")){
                        out.write("<div id='versionesP'>");
                    }else{
                        out.write("<div id='versionesR'>");
                    }
                    
                    out.write("<li>");
                    out.write("<b>Juego: </b>"+v.getJuego().getNombre());
                    out.write("<br><b> Numero Version: </b>"+v.getNro_version());
                    out.write("<br><b> Estado version: </b>"+v.getEstado());
                    if (v.getEstado().equals("rechazada")){
                        out.write("<br><b> Motivo: </b>"+v.getMotivo_recahazo());
                    }
                    out.write("</li>");
                    out.write("</div>");
                    i++;
                }
                
                out.write("</ul>");
                out.write("</div>");
            }
        %>
        
        <div id="desarrollo">
            <%
            if(request.getAttribute("juegos") != null && u.getTipo().equals("d"))
            %>
        </div>
        
        <div id="compras">
            
            <% 
            if (request.getAttribute("juegos_comprados") != null && u.getTipo().equals("c")) {
                %>
                <div class="titulo">
                <span style="color:white;"><b>Juegos Comprados</b></span>
                </div>
                <%
                ArrayList <Juego>juegos = (ArrayList)request.getAttribute("juegos_comprados");
                int i = 0;
                out.write("<ul id='info_compras'>");
                Juego j = new Juego();
                while(i< juegos.size()){
                    j = juegos.get(i);
                    out.write("<li style='list-style:none'><a href='verInfoJuego?id="+j.getId()+"'>"
                            + "<div class='imagenJuegoComprado'><img src='"+imagenes_juegos+j.getPortada()+"'>"
                            + "</a></div><br><a class='btn btnr' href='altaReclamo.jsp?id="+j.getId()+"'>Reclamo</a><br></li>");
                    i++;
                }
                out.write("<div class='div-ajuste'><br><br></div></ul>");
            }
            %>
            <%-- 
            este div es para que cuando se despiegan los comentarios 
            el fondo semi transparente se adapte a el tamaño del div
            que contiene los comentarios
            --%>
            <div class="div-ajuste">

            </div>
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
