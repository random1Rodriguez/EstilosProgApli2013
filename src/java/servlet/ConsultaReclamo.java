/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import baseDatos.ManejadorBD;
import controladores.ControladorReclamos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ConsultaReclamo", urlPatterns = {"/ConsultaReclamo"})
public class ConsultaReclamo extends HttpServlet {
    private ManejadorBD mbd = ManejadorBD.getInstancia();
    private ControladorReclamos cr = ControladorReclamos.getInstancia();
    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            mbd.setHost("localhost");
            mbd.setPuerto("3306");
            mbd.setBd("market");
            mbd.setUsuario("root");
            mbd.setPassword("root");
            if (mbd.estaDesconectado()) {
                mbd.conectar();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Perfil.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("Excepcion en la conexion: " + ex.getMessage());
        }
        
        PrintWriter out = response.getWriter();
        HttpSession s = request.getSession(true);
        if (s.getAttribute("usuario") != null){
            int idj = Integer.parseInt(request.getParameter("idJuego"));
            //int idu = Integer.parseInt(request.getParameter("idUsuario"));
            
            ArrayList reclamos = new ArrayList();
            try {
                reclamos = cr.ConsultaReclamo(idj);
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaReclamo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
