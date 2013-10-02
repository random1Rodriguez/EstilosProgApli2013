/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import baseDatos.ManejadorBD;
import dominio.Juego;
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

/**
 *
 * @author usuario
 */
@WebServlet(name = "verInfoJuego", urlPatterns = {"/verInfoJuego"})
public class verInfoJuego extends HttpServlet {
ManejadorBD mbd = ManejadorBD.getInstancia();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
            PrintWriter out = response.getWriter();
              try {
            mbd.setHost("localhost");
            mbd.setPuerto("3306");
            mbd.setBd("market");
            mbd.setUsuario("root");
            mbd.setPassword("root");
            if (mbd.estaDesconectado()){
                mbd.conectar();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Perfil.class.getName()).log(Level.SEVERE, null, ex);
        }
            Juego juego;
      
            String cad=request.getParameter("id");
            int valor=Integer.parseInt(cad);
            juego = controladores.Controladorjuegos.getInstancia().verInfoJuego(valor);
            
            request.setAttribute("infoJuego", juego);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(listarCategorias.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
