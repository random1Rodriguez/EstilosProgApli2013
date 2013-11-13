
package servlet;

import cliente.ClienteWS;
import controladores.ControladorUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Registro", urlPatterns = {"/registro"})
public class Registro extends HttpServlet {
    
    private ControladorUsuarios cu = ControladorUsuarios.getInstancia();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        String nick = request.getParameter("nick");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String nombre = request.getParameter("nom");
        String apellido = request.getParameter("ape");
        String tipo = request.getParameter("tipo");
        String fnac = request.getParameter("fnac");
        String sitio = request.getParameter("sitio");
        String img = "";
        
        try {        

            /*------------ invocacion al servicio --------------*/
            
            ClienteWS.altaUsuario(nombre, apellido, nick, email, fnac, pass, img, tipo, sitio);
            
            /*-------------------------------------------------*/
            
        } catch (Exception ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
            //response.sendRedirect("index.jsp");
        }
            
    }
}
