
<%@page import="dominio.Version"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            Usuario u = null;
            if (request.getAttribute("perfil") != null){
                u = (Usuario)request.getAttribute("perfil");
            }
        %>
        
        <div id="imagen">
            <span><img src="<%=u.getImg()%>"></span>
        </div>
        
        <div id="info_cuenta">
            <span><%=u.getNick()%></span>
            <span><%=u.getEmail()%></span>
            <span><%=u.getTipo()%></span>
        </div>
        
        <div id="info_personal">
            <span><%=u.getNombre()%></span>
            <span><%=u.getApellido()%></span>
            <span><%=u.getFecha_nac().toString()%></span>
            <span><%=String.valueOf(u.getEdad())%></span>
        </div>
        <%
            if(u.getTipo() == "d"){

        %>
        <div id="desarrollos">
            <%
                if(request.getAttribute("versiones") != null){
                    ArrayList versiones = (ArrayList)request.getAttribute("versiones");
                    int i = 0;
                    out.write("<ul>");
                    while (i < versiones.size()){
                        Version v = (Version)versiones.get(i);
                        out.write("<li>");
                        out.write("<br>Juego: "+v.getId_juego());
                        out.write("<br> Numero: "+v.getNro_version());
                        out.write("<br> Estado: "+v.getEstado());
                        out.write("<br> Motivo: "+v.getMotivo_recahazo());
                        out.write("</li>");
                        i++;
                    }
                    out.write("</ul>");
                }
            %>
                
        </div>
        <%

            }
        %>
    </body>
</html>
