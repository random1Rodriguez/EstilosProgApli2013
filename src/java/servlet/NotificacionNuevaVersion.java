package servlet;

import cliente.ClienteWS;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "NotificacionNuevaVersion", urlPatterns = {"/NotificacionNuevaVersion"})
public class NotificacionNuevaVersion extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        
        
        HttpSession s = request.getSession(true);
        //si esta logueado y es cliente
        if (s.getAttribute("usuario") != null && s.getAttribute("tipo").equals("c")){
            out.write("["); //inicio del arreglo json
            ArrayList jComprados = (ArrayList)ClienteWS.listarJuegosPorCliente((int)s.getAttribute("idU"));
            
            out.write("]"); //final del arreglo json
        }
        else{
            out.write("[]");//devuelve arreglo  vacio
        }
    }
}
