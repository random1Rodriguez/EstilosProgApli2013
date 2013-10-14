
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
        <title>Perfil de usuario</title>
    </head>
    <body>
       <jsp:include page="plantillas/header.jsp"></jsp:include>
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
        <div id="menu_des">
            <%
            if(!u.getTipo().equals("c"))
            {
                %>
                <div id="contenedorinputs">
                <span>
                        <a href="juegosPublicados">Agregar Version de Juego</a>
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
        <div id="compras">
            
            <% 
            if (request.getAttribute("juegos_comprados") != null && u.getTipo().equals("c")) {
                %>
                out.write(<div class="titulo">)
                <span>Juegos Comprados</span>
                </div>
                <%
                ArrayList <Juego>juegos = (ArrayList)request.getAttribute("juegos_comprados");
                int i = 0;
                out.write("<ul>");
                while (i < juegos.size()){
                    Juego j = juegos.get(i);
                    out.write("<li><a href='verInfoJuego?id="+j.getId()+"'>"+j.getNombre()+"</a>"
                            + "<div class='imagen'><img src='"+imagenes_juegos+j.getPortada()+"'></div></li>");
                    i++;
                }
                out.write("</ul>");
            }
            %>
        </div>
        </div>
    </body>
    <jsp:include page="plantillas/footer.jsp"></jsp:include>
</html>
