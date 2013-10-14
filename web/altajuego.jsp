
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
                        <h2> Crear Nuevo Juego</h2>
                        <form id="crearjuego" method="post" action="UpImgJuego" enctype="multipart/form-data">
                     <div>
                       <%--       Nombre Juego          --%>  
                       <label class="linea">
                        <input id="nombre" name="nombre" required autofocus placeholder="Nombre Juego">
                       </label>    

                       <%--       Descripcion Juego          --%>
                       <label class="linea">
                           <textarea id="desc" name="desc" required autofocus placeholder="Descripcion"></textarea>
                       </label>
                       
                       <%--       Precio Juego          --%>
                       <label class="linea">
                        <input id="precio" name="precio" required autofocus placeholder="Precio">
                       </label>
                       
                       
                       
                       <%--       IMG SUBIR --%>
                       
                       <label class="imgjuego">
                            <b>Imagen: </b><br>
                            <input type="file" id="imgjuego" name="subirImgJuego" required accept=".png , .jpg, .gif">
                        </label>
                       
                       
                       <label class="imgjuego">
                            <b><br><br>Version: </b><br>
                            <input type="file" id="versionjuego" name="subirVersionJuego" required accept=".jar">
                        </label>
                       
                       <%--       Numero de Version del Juego   --%>       
                       <label class="linea">
                        <input id="version" name="version" required autofocus placeholder="Numero de Version">
                       </label>
                       
                        <nav>
                            
                            <ul id="categoriasAltaJuego">
                               <%
                         out.println("<span><b> Categorias </b></span><br><br>");
                                ArrayList categorias = cc.listarCategorias();
                                if (categorias != null){
                                int i = 0;
                                while (i < categorias.size()){
                                    Categoria cat;
                                    cat = (Categoria)categorias.get(i);
                                    out.println("<input type='checkbox' value="+ cat.getId() +" name='cats'>"+ cat.getNombre() +"<br>");
                                    i++;
                                }
                            }
                        %>
                            </ul>
                        </nav>
                
                     </div>    
                            <input id="newjuego" type="submit" value="   Finalizar    ">
                    </form>
                            </div>
                            </div>
    </div>
                            <jsp:include page="plantillas/footer.jsp"></jsp:include>
        </body>
</html>
