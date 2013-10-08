
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/aplicacion.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <title>Alta de version</title>
    </head>
    <body>
        <form id="altVer" method="post" action="altaVersionJuego" >
            <div>
              
                <label class="linea">
                    <input type="text" id="idJ" name="idJ" value="<%
          if(request.getAttribute("idJuego") != null){
              out.write(String.valueOf(request.getAttribute("idJuego")).trim());
          }
              %>">
           
                <label class="linea">
                    <input type="text" id="nroVersion" name="nroVersion" required autofocus placeholder="Numero de version">
                    
                </label>

                <label class="linea">
                    <input type="file" id="archivoJuego" name="subirJuego" required>
                    
                </label>

            </div>
            <input id="boton" type="submit" value="Confirmar">
        </form>
    </body>
</html>
