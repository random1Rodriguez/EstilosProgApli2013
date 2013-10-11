<%@page import="org.apache.el.lang.FunctionMapperImpl.Function"%>
<%@page import="dominio.Comentario"%>
<%@page import="dominio.Juego"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style2.css">
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>La Mejor Tienda de Juegos Online</title>
    </head>
    <body>
        <div id="contenedor">
            <jsp:include page="plantillas/header.jsp"></jsp:include>
            <div id="fondotransparente">
            <%-- SLIDER 
            <section id="slideshow">
	
		<a class="commands prev commands1" href="#sl_i4" title="Go to last slide">&lt;</a>
		<a class="commands next commands1" href="#sl_i2" title="Go to 2nd slide">&gt;</a>
		<a class="commands prev commands2" href="#sl_i1" title="Go to 1rst slide">&lt;</a>
		<a class="commands next commands2" href="#sl_i3" title="Go to 3rd slide">&gt;</a>
		<a class="commands prev commands3" href="#sl_i2" title="Go to 2nd slide">&lt;</a>
		<a class="commands next commands3" href="#sl_i4" title="Go to 4th slide">&gt;</a>
		<a class="commands prev commands4" href="#sl_i3" title="Go to 3rd slide">&lt;</a>
		<a class="commands next commands4" href="#sl_i1" title="Go to first slide">&gt;</a>
		
		<a class="play_commands pause" href="#sl_pause" title="Maintain paused">Pause</a>
		<a class="play_commands play" href="#sl_play" title="Play the animation">Play</a>
		
		<div class="container">
			<div class="c_slider"></div>
			<div class="slider">
				<figure>
					<img src="img/dummy-640x310-1.jpg" alt="" width="640" height="310" />
					<figcaption>The mirror of soul</figcaption>
				</figure><!--
				--><figure>
					<img src="img/dummy-640x310-2.jpg" alt="" width="640" height="310" />
					<figcaption>Let's cross that bridge when we come to it</figcaption>
				</figure><!--
				--><figure>
					<img src="img/dummy-640x310-3.jpg" alt="" width="640" height="310" />
					<figcaption>Sushi<em>(do)</em> time</figcaption>
				</figure><!--
				--><figure>
					<img src="img/dummy-640x310-4.jpg" alt="" width="640" height="310" />
					<figcaption>Waking Life</figcaption>
				</figure>
			</div>
		</div>
		
		<span id="timeline"></span>
		
		<ul class="dots_commands"><!--
			--><li><a title="Show slide 1" href="#sl_i1">Slide 1</a></li><!--
			--><li><a title="Show slide 2" href="#sl_i2">Slide 2</a></li><!--
			--><li><a title="Show slide 3" href="#sl_i3">Slide 3</a></li><!--
			--><li><a title="Show slide 4" href="#sl_i4">Slide 4</a></li>
		</ul>
		
	</section>
             SLIDER --%>


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
                    if(request.getAttribute("infoJuego")!= null){

                       Juego ju = (Juego)request.getAttribute("infoJuego");
                       out.write("<div id='contenedorinputs'><ul>");
                           
                           out.write("<li id='infoJnombre'><b> Nombre: </b>");
                               out.write(ju.getNombre());
                           out.write("</li>");
                           
                           out.write("<li id='infoJdesc'> Descpicion: ");
                               out.write(ju.getDescripcion());
                           out.write("</li>");
                           
                           out.write("<li id='infoJdes'> Desarrollador: ");
                               out.write(ju.getDes().getNick());
                           out.write("</li>"); 
                           
                           out.write("<li id='infoJsize'> Tamaño: ");
                               out.write(String.valueOf(ju.getSize()) + " Kb");
                           out.write("</li>");
                           
                           out.write("</li id='infoJlistcats'> Categorias: ");
                           ArrayList<Categoria> lstCat = (ArrayList<Categoria>)ju.getCategorias();
                           int i=0;
                           out.write("<div>");
                           while(i<lstCat.size()){
                               out.write("<li>");
                                   out.write(lstCat.get(i).getNombre());
                               out.write("</li>");
                               i++;
                           }
                           out.write("</div>");


                           if(session.getAttribute("usuario") != null){
                              /* out.write("<div id=ultiVersion>");


                               out.write("</div>");*/
                           }
                       out.write("</ul></div>");
                    }

                %>
            </ul>
            
        </div>
             <div id="imgderecha"></div>
</div>
           
        </div>
        
             <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
