
<%@page import="dominio.Comentario"%>
<%@page import="dominio.Version"%>
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
            <jsp:include page="plantillas/header.jsp"></jsp:include>
            <%
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
          <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
