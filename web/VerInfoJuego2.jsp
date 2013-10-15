<%-- 
    Document   : VerInfoJuego2
    Created on : 14-oct-2013, 19:50:02
    Author     : BlackArmor
--%>

<%@page import="dominio.Comentario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            #InfoJComentsR{
                width: 100%;
    float: right;
    background: rgb(248, 248, 248);
    border-radius: 0px 10px;
    border: solid 1px gray;
    padding: 2%;
    
            } 
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="InfoJComentsR">
        <% 
             if(request.getAttribute("comentariosHijo") != null){
                                         ArrayList<Comentario> lstComH = (ArrayList<Comentario>) request.getAttribute("comentariosHijo");
                                            int f=0;
                                            if(lstComH.size() != 0){
                                            while(f<lstComH.size()){
                                                 Comentario comH = lstComH.get(f);
                                                out.write("<li>");
                                                     out.write("<a href = desplegarComentarios?idCP=" + comH.getId() +  ">" + comH.getTexto() + " >> </a>");
                                                out.write("</li>");
                                                f++;
                                            }
                                            }else{
                                                out.write("El comentario no tiene Respuestas.");
             }
             }
            %>
        </div>
    </body>
</html>
