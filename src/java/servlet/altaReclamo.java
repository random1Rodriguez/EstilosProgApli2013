/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import baseDatos.ManejadorBD;
import controladores.ControladorReclamos;
import controladores.ControladorUsuarios;
import controladores.ControladorVersiones;
import controladores.Controladorjuegos;
import dominio.Cliente;
import dominio.Juego;
import dominio.Reclamo;
import dominio.Usuario;
import dominio.Version;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.swing.text.Document;
import org.apache.catalina.Session;


@WebServlet(name = "altaReclamo", urlPatterns = {"/altaReclamo"})
public class altaReclamo extends HttpServlet {

    private ManejadorBD mbd = ManejadorBD.getInstancia();
    private ControladorReclamos cr = ControladorReclamos.getInstancia();
    private ControladorUsuarios cu = ControladorUsuarios.getInstancia();
    private ControladorVersiones cv = ControladorVersiones.getInstancia();

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
        if (s.getAttribute("usuario") != null) {
            Reclamo r = new Reclamo();//creo el reclamo
            int idj = Integer.parseInt(request.getParameter("idJu"));
            int idu = Integer.parseInt(request.getParameter("idUsu"));

            //RADIOBUTTONS//
            String select = request.getParameter("select");
            r.setCatRecl(select);
            
            /*if (request.getParameter("select") != null) {
                radio = "Mal Funcionamiento";
            } else if (request.getParameter("select") != null) {
                radio = "Contenido Inapropiado";
            } else if (request.getParameter("select") != null) {
                radio = "Facturacion Erronea";
            }*/

            String texto = request.getParameter("texto");
            Date fecha = new Date();
            Version v = new Version();
            v = cv.ultimaVerAprobada(idj);
            String nro_v = v.getNro_version(); //ultima version aprovada del juego
            //seteo el reclamo
            
            r.setCli((int)idu);
            r.setFechaRecl(fecha);
            r.setJueg(idj);
            r.setTxtRecl(texto);
            r.setNroVersion(nro_v);
            try {
                cr.AltaReclamo(r);//doy de alta el reclamo
            } catch (SQLException ex) {
                Logger.getLogger(altaReclamo.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("index.jsp");


            
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
