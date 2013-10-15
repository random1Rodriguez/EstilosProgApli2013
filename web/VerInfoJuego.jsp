
<%@page import="dominio.Comentario"%>
<%@page import="dominio.Version"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .imagenJuego img {
                margin: 0 24%;
                width: 52%;
                height: 224px;
                border-radius: 00px 15px 0 15px;
                border: solid 1px #3071a9;
}
            
        </style>
        <link rel="stylesheet" href="css/style2.css">
        
 <title>Informacion de Juego</title> 
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
            <jsp:include page="plantillas/header.jsp"></jsp:include>

            <div id="contendorinputs">          
                <%
            String server = "http://progapli2013.comule.com/";
            String imagenes_perfil = server + "imagenes/perfiles/";
            String imagenes_juegos = server + "imagenes/juegos/";
               if(request.getAttribute("infoJuego")!= null){

                       Juego ju = (Juego)request.getAttribute("infoJuego");
                       out.write("<ul id='infoGralJuego'>");//Genera UL InfoGeneral
                           out.write("<div class='imagenJuego'><img src='"+imagenes_juegos+ju.getPortada()+"'></div>");//Carga IMG
                           out.write("<li id='infoJnombre'><b>");//
                               out.write(ju.getNombre());
                           out.write("</b></li>");// InfoNombre
                           
                           out.write("<li id='infoJdesc'><b> Descpicion: </b>");
                               out.write(ju.getDescripcion());
                           out.write("</li>");
                           
                           out.write("<li id='infoJdes'><b> Desarrollador: </b>");
                               out.write(ju.getDes().getNick());
                           out.write("</li>"); 
                           
                           out.write("<li id='infoJsize'><b> Tamaño: </b>");
                               out.write(String.valueOf(ju.getSize()) + " Kb");
                           out.write("</li>");
                           
                           
                           
                           
                           Version v = controladores.ControladorVersiones.getInstancia().ultimaVerAprobada(ju.getId());
                           
                           out.write("<li>");
                           if(session.getAttribute("usuario") != null && 
                                   controladores.ControladorCompras.getInstancia().comproJuego(
                                   controladores.ControladorUsuarios.getInstancia().find(String.valueOf(session.getAttribute("usuario"))).getId(), 
                                   ju.getId())){
                            out.write("<li>");
                                out.write("<b> Download: </b><a href='descargaJuego?id=" + v.getId_juego() + "'>" + v.getNro_version() + "</a>");
                            out.write("</li>");
                           } else{
                           out.write("<li>");
                           out.write(v.getNro_version());
                           
                           out.write("</li>");
                           }
                           
                           out.write("</li>");
                           
                           
                           ArrayList<Categoria> lstCat = (ArrayList<Categoria>)ju.getCategorias();
                           int i=0;
                           out.write("<b> Categorias: </b>");
                           while(i<lstCat.size()){
                               out.write("<li style='margin-left:25px'>");
                                   out.write(lstCat.get(i).getNombre());
                               out.write("</li>");
                               i++;
                           }
                           out.write("</ul>");//Info Gral Cierre
                           
                          
               out.write("<a class='btn' href='comprarJuego?id=" + ju.getId() + "'>Comprar</a><br><br>");
               
                           ArrayList<Comentario> lstCom = (ArrayList<Comentario>)ju.getComentarios();
                           i=0;
                           if(lstCom.size() != 0 ){
                           out.write("<b>Comentarios:</b> ");
                           out.write("<div id='comentsPH' style='clear: both; height: 267px;'> <ul id='InfoJComents'>");
                           Comentario com = null;
                           while(i<lstCom.size()){
                                
                               com = lstCom.get(i);
                               if(com.getId_padre() == 0){
                               out.write("<li>");
                                    out.write("<a href = desplegarComentarios?idCP=" + com.getId() +  " target='ComentsResp'>" + com.getTexto() + " >> </a>");
                                    
                                    
                               }
                           
                            i++;
                           
                    }
                           
                    
                            out.write("</li>");
                                    out.write("</ul>");
                                    out.write("<ul id='InfoJComentsR'>");
                                    out.write("<iframe name='ComentsResp' id='" + com.getId_padre() +"' src='desplegarComentarios?idCP='" + com.getId() +"'</iframe>");
                                    out.write("</ul></div>");
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
               }else{
                   out.write("<div id='comentsPH'> <ul id='InfoJComents'> El juego no tiene comentarios</ul></div>");
               }
            %>
        </div>
          <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
    
</html>
