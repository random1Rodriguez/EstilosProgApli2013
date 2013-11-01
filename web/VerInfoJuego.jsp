
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
                margin: 0 33%;
                width: 34%;
                height: 224px;
                border-radius: 00px 15px 0 15px;
                border: solid 1px #3071a9;
            }
            
            #btn-comprar{
                font-size: 1.5em;
            }

            #contenedorInformacionJuego{
                /*    background-image: linear-gradient(bottom, rgb(227,227,227) 0%, rgb(219,219,219) 56%, rgb(217,217,217) 100%);
                background-image: -o-linear-gradient(bottom, rgb(227,227,227) 0%, rgb(219,219,219) 56%, rgb(217,217,217) 100%);
                background-image: -moz-linear-gradient(bottom, rgb(227,227,227) 0%, rgb(219,219,219) 56%, rgb(217,217,217) 100%);
                background-image: -webkit-linear-gradient(bottom, rgb(227,227,227) 0%, rgb(219,219,219) 56%, rgb(217,217,217) 100%);
                background-image: -ms-linear-gradient(bottom, rgb(227,227,227) 0%, rgb(219,219,219) 56%, rgb(217,217,217) 100%);
        
                background-image: -webkit-gradient(
                        linear,
                        left bottom,
                        left top,
                        color-stop(0, rgb(227,227,227)),
                        color-stop(0.56, rgb(219,219,219)),
                        color-stop(1, rgb(217,217,217))
                );*/
                background: rgba(0, 0, 0, 0.3);
                border-radius: 15px 0 15px;
                width: 80%;
                padding: 2%;
                margin: 5%;
            }

        </style>


        <title>Informacion de Juego</title> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-2.0.3.js"></script>
        <script>
            $(document).ready(function() {
                
                var path = document.location.pathname.toString();
                var nombreApp = path.split("/")[1];
                var host = document.location.host;

                $(".root-coments").css("list-style-image", "url('img/mas.png')");

                $("#InfoJComents").on("click", ".ajax", function(event) {
                    event.preventDefault();

                    var comentario = $(this);
                    //console.log(comentario);
                    var dir = "http://"+host+"/"+nombreApp +"/"+ comentario.attr("href");
                    console.log(dir);
                    //console.log(comentario.attr("href"));
                    var id_com = dir.substring(dir.indexOf("=") + 1, dir.length);
                    //console.log(id_com);

                    if (comentario.hasClass("desplegado")) {
                        $(this).parent().children().last().remove();
                        $(this).removeClass("desplegado");
                        $(this).parent().removeClass("menos");
                        $(this).parent().addClass("mas");

                        if ($(this).parent().hasClass("root-coments")) {
                            $(this).parent().css("list-style-image", "url('img/mas.png')");
                        }

                    }
                    else {

                        if ($(this).parent().hasClass("root-coments")) {
                            $(this).parent().css("list-style-image", "url('img/menos.png')");
                        }

                        $(this).parent().removeClass("mas");
                        $(this).parent().addClass("menos");
                        $.ajax({
                            url: dir,
                            dataType: "json",
                            success: function(data) {
                                console.log(data);
                                var div = "<div id='resp" + id_com + "'><ul></ul></div>";
                                comentario.after(div);
                                comentario.addClass("desplegado");
                                $.each(data, function(index) {
                                    //console.log(data[index].id);
                                    //console.log(data[index].texto);

                                    $("#resp" + id_com).find("ul").append("<li class='mas'><a class='ajax' href='VerComentariosAjax?id_com=" + data[index].id + "'>" + data[index].texto + "</a></li>");
                                });
                            },
                            error: function() {
                                alert("error");
                            }
                        });
                    }
                });
                
                $("#btn-comprar").hover(function(){
                    console.log($(this).html());
                    var precio = $(this).attr("value");
                    $(this).text("u$s "+precio);
                }, function(){
                    $(this).text("Comprar");
                });
            });
        </script>

    </head>
    <body>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
        <div id="contenedor">
        <%
            String server = "http://progapli2013.comule.com/";
            String imagenes_perfil = server + "imagenes/perfiles/";
            String imagenes_juegos = server + "imagenes/juegos/";
            out.write("<div id='contenedorInformacionJuego'>");

            if (request.getAttribute("infoJuego") != null) {

                Juego ju = (Juego) request.getAttribute("infoJuego");
                out.write("<ul id='infoGralJuego'>");//Genera UL InfoGeneral
                out.write("<div class='imagenJuego'><img src='" + imagenes_juegos + ju.getPortada() + "'></div>");//Carga IMG
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
                if (session.getAttribute("usuario") != null
                        && controladores.ControladorCompras.getInstancia().comproJuego(
                        controladores.ControladorUsuarios.getInstancia().find(String.valueOf(session.getAttribute("usuario"))).getId(),
                        ju.getId())) {
                    out.write("<li>");
                    out.write("<b> Download: </b> v <a href='descargaJuego?id=" + v.getId_juego() + "'>" + v.getNro_version() + "</a>");
                    out.write("</li>");
                } else {
                    out.write("<li><b> Version: </b>");
                    out.write(v.getNro_version());

                    out.write("</li>");
                }

                out.write("</li>");


                ArrayList<Categoria> lstCat = (ArrayList<Categoria>) ju.getCategorias();
                int i = 0;
                out.write("<b> Categorias: </b>");
                while (i < lstCat.size()) {
                    out.write("<li style='margin-left:25px'>");
                    out.write(lstCat.get(i).getNombre());
                    out.write("</li>");
                    i++;
                }

                out.write("</ul>");//Info Gral Cierre


                out.write("<a id='btn-comprar' class='btn' value='"+ju.getPrecio()+"' href='comprarJuego?id=" + ju.getId() + "'>Comprar</a><br><br>");

                ArrayList<Comentario> lstCom = (ArrayList<Comentario>) ju.getComentarios();
                i = 0;
                if (lstCom.size() != 0) {
                    out.write("<b style='color:white;'>Comentarios:</b> ");
                    out.write("<div id='comentsPH' style='clear: both; height: 267px;'> <ul id='InfoJComents'>");
                    Comentario com = null;
                    while (i < lstCom.size()) {
                        com = lstCom.get(i);
                        if (com.getId_padre() == 0) {
                            out.write("<li class='root-coments'>");
                            out.write("<a class='ajax' href='VerComentariosAjax?id_com=" + com.getId() + "'>" + com.getTexto() + "</a>");
                        }
                        i++;
                    }
                    out.write("</div>");
                }

            } else {
                out.write("<div id='comentsPH'> <ul id='InfoJComents'> El juego no tiene comentarios</ul></div>");
            }
            out.write("</div>");
        %>
        </div>
        <footer id="footer">
            <div id="txtfooter">
                Random PlayStore © || Todos los derechos reservados || Programacion de Aplicaciones || 2013 
            </div>
        </footer>
    </body>

</html>
