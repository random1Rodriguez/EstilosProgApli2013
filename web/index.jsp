
<%@page import="dominio.Juego"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
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
                
                <div  class='listaJuegos'>
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
                                        //out.write("<ul>");
                                            out.write("<li>");
                                            String desc = j.getDescripcion();
                                            if(desc.length()>200){
                                                out.write(desc.substring(0, 200) + "...");
                                            }else{
                                                out.write(desc);
                                            }
                                            out.write("</li>");
                                            out.write("<li>");        
                                                out.write(Double.toString(j.getPrecio()));
                                            out.write("</li>");
                                            out.write("<li>");        
                                                out.write("<a href='verInfoJuego?id=" + j.getId() + "'>Ver Info Juego</a>");
                                                    
                                            out.write("</li>");
                                        //out.write("</ul>");
                                    out.write("</li>");
                                out.write("</div>");
                                i++;
                            }
                        }
                        if(request.getAttribute("infoJuego")!= null){
                                                        Juego ju = (Juego)request.getAttribute("infoJuego");
                                                        out.write(ju.getNombre());
                                                        out.write(ju.getDescripcion());
                                                        
                                                        out.write("Categorias\n");
                                                        ArrayList<Categoria> lstCat = ju.getCategorias();
                                                        int i=0;
                                                        while(i>lstCat.size()){
                                                            out.write(lstCat.get(i).getNombre() + "\n");
                                                            i++;
                                                                    
                                                        }
                                                        
                                                        out.write(ju.getNombre());
                                                     }
                        %>
                        </ul>
                </div>
        
        <div id="popup_reg">
            <div id="cerrar"><img src="img/cruz.png"></div>
            <form id="reg" method="post" action="registro">
                <div id="requeridos">
                    <label class="linea">
                        <input id="nick" name="nick" required autofocus placeholder="Usuario" autocomplete="off">
                        <span id="validacion_nick"></span>
                    </label>

                    <label class="linea">
                        <input type="text" id="email" name="email" placeholder="Email" required autocomplete="off">
                        <span id="validacion_email"></span>
                    </label>

                    <label class="linea">
                        <input type="password" id="pass" name="pass" required placeholder="Contraseña">
                    </label>

                    <label class="linea">
                        <input type="password" id="conf_pass" name="conf_pass" required placeholder="Confirmar Contraseña">
                        <span id="validacion_pass" ></span>
                    </label>
                </div>

                <div id="datos_perfil">
                    <label class="linea">
                        <input id="nombre" name="nom" value="" placeholder="Nombre" autocomplete="off">
                    </label>

                    <label class="linea">
                        <input id="apellido" name="ape"value="" placeholder="Apellido" autocomplete="off">
                    </label>

                    <label class="linea">
                        <input type="date" id="fnac" name="fnac" value="">
                    </label>

                    <label class="linea">
                        <select name="tipo" id="tipo">
                            <option value="vacio">Tipo de Perfil</option>
                            <option value="c">Cliente</option>
                            <option value="d">Desarrollador</option>
                        </select>
                    </label>
                </div>
                <input id="boton" type="submit" value="Registro">
            </form>
        </div>
  <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
