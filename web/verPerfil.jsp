
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
        
        <div id="desarrollos">
            
        </div>
    </body>
</html>
