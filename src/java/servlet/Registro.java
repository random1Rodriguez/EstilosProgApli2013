
package servlet;

import controladores.ControladorUsuarios;
import dominio.Desarrollador;
import dominio.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
        String fnac = request.getParameter("fnac");
        String tipo = request.getParameter("tipo");
        //Date f = new Date(fnac);
        
        System.out.println(nick+email+pass+nombre+apellido+fnac+tipo);
        Usuario u = new Usuario();
        
        if (tipo.equals("d")){
            Desarrollador d = new Desarrollador();
            d.setWeb(request.getParameter("sitio"));
            u = d;
        }
        
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setNick(nick);
        u.setPass(pass);
        u.setTipo(tipo);
        //u.setFecha_nac(f);
        try {        
            cu.altaUsuario(u);
            out.write("Exito");
        } catch (Exception ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

}
