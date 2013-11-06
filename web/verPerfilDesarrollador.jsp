<%@page import="controladores.ControladorUsuarios"%>
<%@page import="controladores.Controladorjuegos"%>
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
            <div id="contenedor">
                <div id="contenedorinputs">
                <%
                    ControladorUsuarios cu = ControladorUsuarios.getInstancia();
                    Controladorjuegos cj = Controladorjuegos.getInstancia();
                    
                    Usuario u = cu.verInfoUsuario(Integer.valueOf(request.getParameter("id").toString()));
                    ArrayList<Juego> juegos_subidos_ver_aprobada = cj.listarJuegosPorDesarrolladorVersionAprobada(u.getId());
                    request.setAttribute("juegos", juegos_subidos_ver_aprobada);
                    String server = "http://progapli2013.comule.com/";
                    String imagenes_perfil = server + "imagenes/perfiles/";
                    String imagenes_juegos = server + "imagenes/juegos/";
                    
                    String tipo;
                    if (request.getAttribute("perfil") != null) {
                        u = (Usuario) request.getAttribute("perfil");
                    }

                    tipo = "Desarrollador";

                %>


                <div id="imagen">
                    <%
                        if (u.getImg().equals("")) {
                            out.write("<div class='imagen'><img src='img/perfil_defecto.jpg'></div>");
                        } else {
                            out.write("<div class='imagen'><img src='" + imagenes_perfil + u.getImg() + "'></div>");
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
                    if (request.getAttribute("juegos") != null) {

                        int i = 0;


                        ArrayList juegos = (ArrayList) request.getAttribute("juegos");
                        i = 0;
                        out.write("<ul class='JuegosDesarrollador'><b>Juegos: <br></b>");

                        while (i < juegos.size()) {
                            Juego j = (Juego) juegos.get(i);

                            out.write("<div>");
                            out.write("<li>");
                            out.write(j.getNombre());
                            out.write("</li>");
                            out.write("</div>");
                            i++;
                        }

                        out.write("</ul>");
                        out.write("</div>");
                    }
                %>

            </div>
        </div>
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
