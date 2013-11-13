<%@page import="controladores.Controladorjuegos"%>
<%@page import="dominio.Version"%>
<%@page import="org.apache.el.lang.FunctionMapperImpl.Function"%>
<%@page import="dominio.Comentario"%>
<%@page import="dominio.Juego"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <script src='js/jquery-2.0.3.js'></script>
        <script src="http://jdwebfiles.webcindario.com/Easy%20slider/easy-slider.js"></script> 
        <title>La Mejor Tienda de Juegos Online</title>
        
    </head>
    <body>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        <div id="contenedor">
            <div id="fondotransparente">
            <%-- SLIDER --%>
            <div id="sliderContainer"> 
                <a href="#siguiente" class="next" title="Siguiente"></a> 
                <a href="#anterior" class="prev" title="Anterior"></a>
                
                <div id="slider"> <div class="slidesContainer" style="width: 2700px;"> 
                        <div class="slide">
                            <img src="http://progapli2013.comule.com/slider/Juegos1.jpg" alt="Imagen 01">
                        </div> 
                        <div class="slide">
                            <img src="http://progapli2013.comule.com/slider/Juegos2.jpg" alt="Imagen 02">
                        </div> 
                        <div class="slide">
                            <img src="http://progapli2013.comule.com/slider/Juegos3.jpg" alt="Imagen 01">
                        </div>
                        <div class="slide">
                            <img src="http://progapli2013.comule.com/slider/Juegos4.jpg" alt="Imagen 01">
                        </div> 
                    </div> <!-- /slidesContainer --> 
                </div> <!-- /slider --> 
            </div>
                            
            <%-- SLIDER --%>
            
            <%
                // si el atributo listaJuegos es null quiere decir que no 
                // eligio ninguna categoria para mostrar, entonces muestra los mas
                // comprados y los que tienen mejor puntuacion
                if (request.getAttribute("listaJuegos")== null){
            %>
                    <%-- MAS COMPRADOS --%>
                    <div id="mas-comprados" class="contenedor-destacados">
                        <div class="titulo-grande">
                            <span>LOS MAS COMPRADOS</span>
                        </div>
                        <div>
                        <%
                            Controladorjuegos cj = Controladorjuegos.getInstancia();
                            String ruta = "http://progapli2013.comule.com/imagenes/juegos/";

                            ArrayList juegos_masComprados = (ArrayList)cj.listarMasComprados(3);
                            int i=0;

                            while(i<juegos_masComprados.size()){
                                Juego j = (Juego)juegos_masComprados.get(i);
                                //out.write("<li>");
                                out.write("<div class='ModuloJuego'><a href='verInfoJuego?id=" + j.getId() + "'>");
                                out.write("<div class='imgJuego'>");
                                out.write("<img class='imgJuego' src='" +ruta + j.getPortada() + "'>");
                                out.write("</div>");
                                out.write("<div class='nombrejuego'><b>");
                                out.write(j.getNombre());
                                out.write("</b></div>");
                                out.write("<div class='descjuego'>");
                                String desc = j.getDescripcion();
                                if(desc.length()>200){
                                    out.write(desc.substring(0, 200) + "...");
                                }else{
                                    out.write(desc);
                                }
                                out.write("</div>");
                                out.write("<div class='preciojuego'> u$s <b>");        
                                out.write(Double.toString(j.getPrecio()));
                                out.write("</b></div>");
                                out.write("</a>");        
                                out.write("</div>");
                                //out.write("</li>");
                                i++;
                            }
                        %>
                        </div>
                    </div>
                    <%-- FIN MAS COMPRADOS --%>

                    <%-- MEJOR PUNTUADOS --%>
                    <div id="mejor-puntuados" class="contenedor-destacados">
                        <div class="titulo-grande">
                            <span>LOS MEJORES PUNTUADOS</span>
                        </div>
                        <div>
                            <%
                            ArrayList juegos_masPuntuados = (ArrayList)cj.listarMejorPuntuados(3);
                            i=0;

                            while(i<juegos_masPuntuados.size()){
                                Juego j = (Juego)juegos_masPuntuados.get(i);
                                //out.write("<li>");
                                out.write("<div class='ModuloJuego'><a href='verInfoJuego?id=" + j.getId() + "'>");
                                out.write("<div class='imgJuego'>");
                                out.write("<img class='imgJuego' src='" +ruta + j.getPortada() + "'>");
                                out.write("</div>");
                                out.write("<div class='nombrejuego'><b>");
                                out.write(j.getNombre());
                                out.write("</b></div>");
                                out.write("<div class='descjuego'>");
                                String desc = j.getDescripcion();
                                if(desc.length()>200){
                                    out.write(desc.substring(0, 200) + "...");
                                }else{
                                    out.write(desc);
                                }
                                out.write("</div>");
                                out.write("<div class='preciojuego'> u$s <b>");        
                                out.write(Double.toString(j.getPrecio()));
                                out.write("</b></div>");
                                out.write("</a>");        
                                out.write("</div>");
                                //out.write("</li>");
                                i++;
                            }
                            %>
                        </div>
                    </div>
                    <%-- TERMINA MEJOR PUNTUADOS --%>
            <%
                }
            %>
            
            <div  id="contenedorJuegos" >
                <div>
                <%
                    
                    String ruta = "http://progapli2013.comule.com/imagenes/juegos/";
                    if(request.getAttribute("listaJuegos")!= null){
                        ArrayList<Juego> juegos = (ArrayList<Juego>)request.getAttribute("listaJuegos");
                        int i=0;

                        while(i<juegos.size()){
                            Juego j = juegos.get(i);
                            out.write("<div class='ModuloJuego'><a href='verInfoJuego?id=" + j.getId() + "'>");
                            out.write("<div class = 'imgJuego'>");
                            out.write("<img class='imgJuego' src='" +ruta + j.getPortada() + "'>");
                            out.write("</div>");
                            out.write("<div class='nombrejuego'><b>");
                            out.write(j.getNombre());
                            //out.write("<ul>");
                            out.write("</b></div>");
                            out.write("<div class='descjuego'>");
                            String desc = j.getDescripcion();
                            if(desc.length()>200){
                                out.write(desc.substring(0, 200) + "...");
                            }else{
                                out.write(desc);
                            }
                            out.write("</div>");
                            out.write("<div class='preciojuego'> u$s <b>");        
                            out.write(Double.toString(j.getPrecio()));
                            out.write("</b></div>");
                            out.write("</a>");        
                            out.write("</div>");
                            i++;
                        }
                    }
                    %>
                    </div>
                </div>
            </div>
        </div>
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>
</html>
