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
        <link rel="stylesheet" href="css/style.css">
        
        
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


                <div  class='listaJuegos'>
            
                <%
                    
                    String ruta = "http://progapli2013.comule.com/imagenes/juegos/";
                    if(request.getAttribute("listaJuegos")!= null){
                        ArrayList<Juego> juegos = (ArrayList<Juego>)request.getAttribute("listaJuegos");
                        int i=0;

                        while(i<juegos.size()){
                            Juego j = juegos.get(i);
                            out.write("<div>");
                            out.write("<div id = 'imgJuego'>");
                            out.write("<img class='imgJuego' src='" +ruta + j.getPortada() + "'>");
                            out.write("</div>");
                            out.write("<li>");
                            out.write(j.getNombre());
                            //out.write("<ul>");
                            out.write("</li>");
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
                            out.write("</div>");
                            i++;
                        }
                    }
                    if(request.getAttribute("infoJuego")!= null){

                       Juego ju = (Juego)request.getAttribute("infoJuego");
                       out.write("<ul>");
                           out.write("<li>");
                               out.write("Nombre del juego");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(ju.getNombre());
                           out.write("</li>");
                           out.write("<li>");
                               out.write("Descripcion");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(ju.getDescripcion());
                           out.write("</li>");
                           out.write("<li>");
                               out.write("Desarrollador");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(ju.getDes().getNick());
                           out.write("</li>"); 
                           out.write("<li>");
                               out.write("Tamaño");
                           out.write("</li>");
                           out.write("<li>");
                               out.write(String.valueOf(ju.getSize()) + " Kb");
                           out.write("</li>");
                           out.write("<li>");
                           out.write("<li>");
                            out.write("Ultima version");
                           out.write("</li>");
                           
                           Version v = controladores.ControladorVersiones.getInstancia().ultimaVerAprobada(ju.getId());
                           
                            
                           
                           out.write("<li>");
                           if(session.getAttribute("usuario") != null && 
                                   controladores.ControladorCompras.getInstancia().comproJuego(
                                   controladores.ControladorUsuarios.getInstancia().find(String.valueOf(session.getAttribute("usuario"))).getId(), 
                                   ju.getId())){
                            out.write("<li>");
                                out.write("<a href='descargaJuego?id=" + v.getId_juego() + "'>" + v.getNro_version() + "</a>");
                            out.write("</li>");
                           } else{
                           out.write("<li>");
                           out.write(v.getNro_version());
                           
                           out.write("</li>");
                           }
                           
                           out.write("</li>");
                           
                           
                           ArrayList<Categoria> lstCat = (ArrayList<Categoria>)ju.getCategorias();
                           int i=0;
                           out.write("Categorias");
                           while(i<lstCat.size()){
                               out.write("<li>");
                                   out.write(lstCat.get(i).getNombre());
                               out.write("</li>");
                               i++;
                           }
                           out.write("</ul>");
                           
                           ArrayList<Comentario> lstCom = (ArrayList<Comentario>)ju.getComentarios();
                           i=0;
                           out.write("Comentarios");
                           out.write("<ul>");
                           while(i<lstCom.size()){
                                Comentario com = lstCom.get(i);
                               
                               if(com.getId_padre() == 0){
                               out.write("<li>");
                                    out.write("<a href = desplegarComentarios?idCP=" + com.getId() +  ">" + com.getTexto() + "</a>");
                                    
                                    out.write("</li>");
                               }
                               
                           
                            i++;
                           
                    }
                    out.write("</ul>");
                    }

                    if(request.getAttribute("comentariosHijo")!= null){
                                         ArrayList<Comentario> lstComH = (ArrayList<Comentario>) request.getAttribute("comentariosHijo");
                                            int f=0;
                                            while(f<lstComH.size()){
                                                 Comentario comH = lstComH.get(f);
                                                out.write("<li>");
                                                     out.write("<a href = desplegarComentarios?idCP=" + comH.getId() +  ">" + comH.getTexto() + "</a>");
                                                out.write("</li>");
                                                f++;
                                            }     
                               
                                    }
                    
                %>

         
        </div>
</div>
        </div>
        
             <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
