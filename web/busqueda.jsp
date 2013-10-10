<%-- 
    Document   : busqueda
    Created on : 07-oct-2013, 16:56:55
    Author     : Estudiantes
--%>

<%@page import="controladores.Controladorjuegos"%>
<%@page import="baseDatos.ManejadorBD"%>
<%@page import="dominio.Categoria"%>
<%@page import="dominio.Juego"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProgApliPlay Market</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        
        <style>
            #listaJuegos{
                width: 75%;
                margin: auto;
            }
            
            .div_juego{
                
            }
        </style>
    </head>
    <body>
        <div  id="listaJuegos">
            <ul>
                <%  
                    String servidor = "http://progapli2013.comule.com/imagenes/juegos/";
                    ManejadorBD mbd = ManejadorBD.getInstancia();
                    if (mbd.estaDesconectado()){
                        mbd.setHost("localhost");
                        mbd.setPuerto("3306");
                        mbd.setBd("market");
                        mbd.setUsuario("root");
                        mbd.setPassword("root");
                    }
                    Controladorjuegos cj = Controladorjuegos.getInstancia();
                    System.out.println("busqueda: "+request.getParameter("busqueda"));
                    ArrayList juegos = cj.buscar(request.getParameter("busqueda"));
                    
                    if (juegos != null){
                        if(! juegos.isEmpty()){
                            int i=0;
                            out.write("<div class='row'>");
                            while(i<juegos.size()){
                                Juego j = (Juego)juegos.get(i);
                                /*out.write("<div class='div_juego'>"); //inicio juego
                                out.write("<div class='imgJuego'>"); //inicio imagen
                                out.write("<img src='" +servidor+ j.getPortada() + "'>");
                                out.write("</div>"); //fin imagen
                                out.write("<div class='info_juego'>"); //inicio info juego
                                out.write(j.getNombre());
                                out.write("</div>"); //fin info juego
                                out.write("<div class='botonera_juego'>");//inicio botonera
                                out.write("<a href='verInfoJuego?id=" + j.getId() + "'>Ver +</a>");
                                out.write("<a href='comprarJuego?id=" + j.getId() + "'>Comprar</a>");
                                out.write("</div>");//fin botonera
                                out.write("</div>"); //fin div_juego*/
                                
                                /*----- con bootstrap -----*/
                %>
                                
                                <div class="col-md-4">
                                  <div class="thumbnail">
                                      <img src="<%= servidor+ j.getPortada()%>">
                                    <div class="caption">
                                        <h3><%= j.getNombre()%></h3>
                                      <p><%=j.getDescripcion()%></p>
                                      <p>
                                          <a href="verInfoJuego?id=<%=j.getId()%>" class="btn btn-success">Ver Mas</a> 
                                          <a href="comprarJuego?id=<%=j.getId()%>" class="btn btn-primary">Comprar</a>
                                      </p>
                                    </div>
                                  </div>
                                </div>
               <%                 
                                
                                i++;
                            }
                            out.write("</div>");
                        }
                        else{
                            out.write("No se encontro ningun juego");
                        }
                    }
                %>
            </ul>

        </div>
    </body>
</html>
