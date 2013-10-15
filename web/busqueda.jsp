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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProgApliPlay Market</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            #listaJuegos{
                width: 75%;
                margin: 5% auto;
            }
            
            .div_juego{
                border: solid;
                height: 330px;
                width: 25%;
                float: left;
                margin: 1% 1%;
                background: rgba(148, 148, 148, 0.69);
            }
            
            .imgJuego{
                width: 95%;
                margin: 3% auto;
            }
            
            .imgJuego img{
                width: 100%;
                height: auto;
            }
            
            
        .btn {
        text-decoration: none;
        display: inline-block;
        padding: 6px 12px;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: normal;
        line-height: 1.428571429;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        cursor: pointer;
        border: 1px solid transparent;
        border-radius: 4px;
        -webkit-user-select: none;
           -moz-user-select: none;
            -ms-user-select: none;
             -o-user-select: none;
                user-select: none;
    }

        .btn:focus {
      outline: thin dotted #333;
      outline: 5px auto -webkit-focus-ring-color;
      outline-offset: -2px;
    }

        .btn:hover,
        .btn:focus {
      color: #333333;
      text-decoration: none;
    }

        .btn-default {
      color: #333333;
      background-color: #ffffff;
      border-color: #cccccc;
    }

        .btn-default:hover,
        .btn-default:focus,
        .btn-default:active {
      color: #333333;
      background-color: #ebebeb;
      border-color: #adadad;
    }
    .info_juego {
margin-left: 5%;
}
    
        </style>
    </head>
    <body>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        
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
                            //out.write("<div class='row-fluid'>");
                            while(i<juegos.size()){
                                Juego j = (Juego)juegos.get(i);
                                out.write("<div class='div_juego'>"); //inicio juego
                                out.write("<div class='imgJuego'>"); //inicio imagen
                                out.write("<img src='" +servidor+ j.getPortada() + "'>");
                                out.write("</div>"); //fin imagen
                                out.write("<div class='info_juego'>"); //inicio info juego
                                out.write("<h3>"+j.getNombre()+"</h3>");
                                out.write("</div>"); //fin info juego
                                out.write("<div class='botonera_juego'>");//inicio botonera
                                out.write("<a class='btn' href='verInfoJuego?id=" + j.getId() + "'>Ver +</a>");
                                out.write("<a class='btn' href='comprarJuego?id=" + j.getId() + "'>Comprar</a>");
                                out.write("</div>");//fin botonera
                                out.write("</div>"); //fin div_juego
                                
                                /*----- con bootstrap -----*/
                %>
                    <%--            
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
                    --%>
               <%                 
                                
                                i++;
                            }
                            //out.write("</div>");
                        }
                        else{
                            out.write("No se encontro ningun juego");
                        }
                    }
                %>
            </ul>

        </div>
                <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
</html>
