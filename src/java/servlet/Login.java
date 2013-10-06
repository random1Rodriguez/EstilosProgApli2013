package servlet;

import baseDatos.ManejadorBD;
import controladores.ControladorUsuarios;
import dominio.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    ManejadorBD mbd = ManejadorBD.getInstancia();
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
        
        if (mbd.estaDesconectado()){
            mbd.setHost("localhost");
            mbd.setPuerto("3306");
            mbd.setBd("market");
            mbd.setUsuario("root");
            mbd.setPassword("root");
            try {
                mbd.conectar();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        PrintWriter out = response.getWriter();
        
        String user = request.getParameter("user");
        String pass = request.getParameter("password");
        try {
            boolean exito = cu.login(user, pass);
            if (exito){
                HttpSession s = request.getSession(true);
                Usuario u = cu.find(user);
                s.setAttribute("usuario", u.getNick());
                s.setAttribute("tipo", u.getTipo());
                response.sendRedirect("index.jsp");
            }
            else{
                String error = "El nombre de usuario y contraseña no coinciden, "
                        + "por favor intentelo de nuevo";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
