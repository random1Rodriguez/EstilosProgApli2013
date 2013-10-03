<%-- 
    Document   : carrucel
    Created on : 03-oct-2013, 16:55:28
    Author     : Estudiantes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <script>
        $(document).ready(function(){
            $('.carousel').carousel({
                interval: 3000
            });
            $("#caroucel").css("width", "50%");
        });
    </script>
    <body>
        <div id="caroucel" class="carousel slide carousel-fade">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#caroucel" data-slide-to="0" class="active"></li>
              <li data-target="#caroucel" data-slide-to="1"></li>
              <li data-target="#caroucel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active">
                  <img src="img/slide1.png" alt="">
              </div>
              <div class="item">
                  <img src="img/slide2.png" alt="">
              </div>
              <div class="item">
                  <img src="img/slide3.png" alt="">
              </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#caroucel" data-slide="prev">
              <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#caroucel" data-slide="next">
              <span class="icon-next"></span>
            </a>
        </div>
    </body>
</html>
