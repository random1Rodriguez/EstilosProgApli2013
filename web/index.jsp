
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La Mejor Tienda de Juegos Online</title>
        <jsp:include page="plantillas/header.jsp"></jsp:include>
    </head>
    <body>
        Prueba Registro
        <a href="registro.jsp" >
            <button>Registrarse</button>
        </a>
        Prueba Login
        
        <div>
            <form method="post" action="Login">
                <input id="user" name="user" placeholder="Usuario" required>
                <input type="password" id="pass" name="pass" placeholder="Contraseña" required>
                <input type="submit" value="Login">
            </form>
            
            <a href='Logout'><button>Logout</button></a>
            
        </div>
        <span>
            Usuario: <%= session.getAttribute("usuario") %>
        </span>
    
        <jsp:include page="plantillas/footer.jsp"></jsp:include>
    </body>
    
</html>
