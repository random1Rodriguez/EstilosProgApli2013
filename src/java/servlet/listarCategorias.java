
package servlet;

import baseDatos.ManejadorBD;
import controladores.Controladorjuegos;
import controladores.ControladorCategorias;
import dominio.Categoria;
import java.io.IOException;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "listarCategorias", urlPatterns = {"/listarCategorias"})
public class listarCategorias extends HttpServlet {


    ManejadorBD mbd = ManejadorBD.getInstancia();
    private ControladorCategorias ca = ControladorCategorias.getInstancia();
    private Controladorjuegos ju = Controladorjuegos.getInstancia();
    private boolean conectado= false;
    
    public void conectar() throws SQLException{
        if (! conectado){
            mbd.setHost("localhost");
            mbd.setPuerto("3306");
            mbd.setBd("market");
            mbd.setUsuario("root");
            mbd.setPassword("root");
            
            mbd.conectar();
            conectado = true;
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
            PrintWriter out = response.getWriter();
            
            ArrayList<Categoria> lstCat;
            this.conectar();
            lstCat = ca.listarCategorias();
            request.setAttribute("lstCategotias", lstCat);
            request.getRequestDispatcher("listadoJuegos.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(listarCategorias.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            
            ArrayList<Categoria> lstCat;
            this.conectar();
            lstCat = ca.listarCategorias();
            HttpSession s =request.getSession(true);
            s.setAttribute("categoria", lstCat);
            
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(listarCategorias.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
