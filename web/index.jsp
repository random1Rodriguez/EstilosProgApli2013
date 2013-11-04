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
        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js' type='text/javascript'> </script> 
        <script src="http://jdwebfiles.webcindario.com/Easy%20slider/easy-slider.js"></script> 
        <title>La Mejor Tienda de Juegos Online</title>
    </head>
    <body>
        <div id="contenedor">
            <jsp:include page="plantillas/header.jsp"></jsp:include>
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
<div  id="contenedorJuegos" >
            <ul>
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
                            out.write("<li class='nombrejuego'><b>");
                            out.write(j.getNombre());
                            //out.write("<ul>");
                            out.write("</b></li>");
                            out.write("<li class='descjuego'>");
                            String desc = j.getDescripcion();
                            if(desc.length()>200){
                                out.write(desc.substring(0, 200) + "...");
                            }else{
                                out.write(desc);
                            }
                            out.write("</li>");
                            out.write("<li class='preciojuego'> u$s <b>");        
                            out.write(Double.toString(j.getPrecio()));
                            out.write("</b></li>");
                            out.write("<li></a>");        
                            out.write("</div>");
                            i++;
                        }
                    }
                    %>
                    </ul>
                    </div>
                </div>
            </div>
              <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>