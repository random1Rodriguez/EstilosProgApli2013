
<%@page import="dominio.Juego"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La Mejor Tienda de Juegos Online</title>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
    </head>
    <body>
        <div id="cuerpo">
            <div>
                <ul>
                <%
                if(request.getAttribute("listaJuegos")!= null){
                    ArrayList<Juego> juegos = (ArrayList<Juego>)request.getAttribute("listaJuegos");
                    int i=0;

                    while(i<juegos.size()){
                        Juego j = juegos.get(i);
                        out.write("<div>");
                        out.write("<li>");
                        out.write(j.getNombre());
                        out.write("<ul>");
                        out.write("<li>");
                        out.write(j.getDescripcion());
                        out.write(Double.toString(j.getPrecio()));
                        out.write("</li>");
                        out.write("</ul>");
                        out.write("</li>");
                        out.write("</div>");
                        i++;
                    }
                }
                %>
                </ul>
            </div>
        </div>
        <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
