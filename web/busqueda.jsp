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
    </head>
    <body>
        <div  class='listaJuegos'>
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

                        while(i<juegos.size()){
                            Juego j = (Juego)juegos.get(i);
                            out.write("<div>");
                            out.write("<div id = 'imgJuego'>");
                            out.write("<img src='" +servidor+ j.getPortada() + "'>");
                            out.write("</div>");
                            out.write("<li>");
                            out.write(j.getNombre());
                            //out.write("<ul>");
                            out.write("</li>");
                            //out.write("<li>");
                            /*String desc = j.getDescripcion();
                            if(desc.length()>200){
                                out.write(desc.substring(0, 200) + "...");
                            }else{
                                out.write(desc);
                            }*/
                            //out.write("</li>");
                            /*out.write("<li>");        
                            out.write(Double.toString(j.getPrecio()));
                            out.write("</li>");*/
                            out.write("<li>");        
                            out.write("<a href='verInfoJuego?id=" + j.getId() + "'>Ver Info Juego</a>");
                            out.write("</div>");
                            i++;
                        }
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
