
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style2.css">
        
        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js' type='text/javascript'> </script> 
        <script src="http://jdwebfiles.webcindario.com/Easy%20slider/easy-slider.js"></script> 

 <title>Informacion de Juego</title> 
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <div  id="contenedorJuegos" >
            <ul>
                <%
                    /*
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
                    */
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
        
    </body>
</html>
