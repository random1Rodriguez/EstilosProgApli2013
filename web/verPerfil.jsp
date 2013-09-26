
<%@page import="dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <ul>
        <%
            if (request.getAttribute("perfil") != null){
                Usuario u = (Usuario)request.getAttribute("perfil");
                out.write("<li>"+u.getNick()+"</li>");
                out.write("<li>"+u.getNombre()+"</li>");
                out.write("<li>"+u.getApellido()+"</li>");
                out.write("<li>"+u.getEmail()+"</li>");
                out.write("<li>"+u.getTipo()+"</li>");
                out.write("<li>"+u.getFecha_nac().toString()+"</li>");
                out.write("<li>"+String.valueOf(u.getEdad())+"</li>");
            }
        %>
        </ul>
    </body>
</html>
