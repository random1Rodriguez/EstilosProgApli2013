
<%@page import="dominio.Juego"%>
<%@page import="dominio.Version"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .imagen img {
                max-width: 100%;
                min-width: 20%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <%  String ubicacion_imagen = "http://progapli2013.comule.com/imagenes/perfiles/";
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
        
        <div id="imagen">
            <span class="imagen"><img src="<%=ubicacion_imagen+u.getImg()%>"></span>
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
        
        <div id="desarrollos">
            
           
            <%
                if(request.getAttribute("versiones") != null){
                    ArrayList<Juego> juegos = (ArrayList<Juego>)request.getAttribute("juegos");
                    
                     int i = 0;
                    out.write("<ul>");
                    
                    while (i < juegos.size()){
                        Juego j = (Juego)juegos.get(i);
                        out.write("<li>");
                        out.write("<br><a href = 'versionJuego?idJuego=" + j.getId() + "'>Juego: "+j.getNombre() + "</a>");
                        out.write("</li>");
                        i++;
                    }
                    
                    
                    ArrayList versiones = (ArrayList)request.getAttribute("versiones");
                    i = 0;
                    out.write("<ul>");
                    while (i < versiones.size()){
                        Version v = (Version)versiones.get(i);
                        out.write("<li>");
                        out.write("Juego: "+v.getJuego().getNombre());
                        out.write("<br> Numero: "+v.getNro_version());
                        out.write("<br> Estado: "+v.getEstado());
                        if (v.getEstado().equals("rechazada")){
                            out.write("<br> Motivo: "+v.getMotivo_recahazo());
                        }
                        out.write("</li>");
                        i++;
                    }
                    out.write("</ul>");
                }
            %>
                
        </div>
        <div id="compras">
            
        </div>
    </body>
</html>
