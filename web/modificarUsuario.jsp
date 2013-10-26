
<%@page import="dominio.Categoria"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ControladorCategorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Juego</title>
    </head>
    <body>
        <div id="contenedor">
            <jsp:include page="plantillas/header.jsp"></jsp:include>
            <div id="fondotransparente">
        <%
                        ManejadorBD.getInstancia().setBd("market");
                        ManejadorBD.getInstancia().setHost("localhost");
                        ManejadorBD.getInstancia().setPuerto("3306");
                        ManejadorBD.getInstancia().setUsuario("root");
                        ManejadorBD.getInstancia().setPassword("root");

                        if (ManejadorBD.getInstancia().estaDesconectado())
                            ManejadorBD.getInstancia().conectar();

                        ControladorCategorias cc = ControladorCategorias.getInstancia();
                    %>
                    <div id="contenedorinputs">
                        <h2>Modificar usuario</h2>
                        <form id="modificarPerfil" method="post" action="modificarUsuario" enctype="multipart/form-data">
                     <div>
                        <label class="linea">
                            <input type="text" id="idJuego"  hidden="true" name="idJuego" value="<% out.write(String.valueOf(request.getAttribute("idUsuario"))); %>">
                        </label>   
                       <%--       IMG SUBIR --%>
                       
                       <label class="imgjuego">
                            <b>Imagen: </b><br>
                            <input type="file" id="imgjuego" name="subirImgJuego" required accept="image/png, image/jpeg, .gif">
                        </label>
                  
                
                     </div>    
                            <input id="updatUser" type="submit" value="   Finalizar Editado   ">
                    </form>
                            </div>
                            </div>
    </div>
                            <jsp:include page="plantillas/footer.jsp"></jsp:include>
        </body>
</html>
