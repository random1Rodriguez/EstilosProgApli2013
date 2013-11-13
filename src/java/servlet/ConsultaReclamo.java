/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import baseDatos.ManejadorBD;
import clientes.juegos.Juego;
import controladores.ControladorReclamos;
import controladores.Controladorjuegos;
import dominio.Reclamo;
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
    private Controladorjuegos cj = Controladorjuegos.getInstancia();

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



            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true);
            if (s.getAttribute("usuario") != null) {
                int idu = Integer.parseInt(request.getParameter("idUsu"));

                //array de juegos desarrollados por ese usuario
                ArrayList juegosD = new ArrayList();
                juegosD = cj.listarJuegosPorDesarrollador(idu);
                int i = 0;
                ArrayList general = new ArrayList();//el array general donde van a estar todos lor reclamos

                dominio.Juego j = new dominio.Juego();
                while (i < juegosD.size()) {
                    j = (dominio.Juego) juegosD.get(i);
                    general.add(cr.ConsultaReclamo(j.getId()));
                    i++;
                }
                request.setAttribute("general", general);
                request.getRequestDispatcher("consultaReclamo.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Perfil.class.getName()).log(Level.SEVERE, null, ex);
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
