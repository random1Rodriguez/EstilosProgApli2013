/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dominio.Comentario;
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

/**
 *
 * @author Black Armor
 */
@WebServlet(name = "AltaComentario", urlPatterns = {"/AltaComentario"})
public class AltaComentario extends HttpServlet {

    private controladores.ControladorComentarios cc = controladores.ControladorComentarios.getInstancia();

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
        processRequest(request, response);

        int idJ = Integer.parseInt(request.getParameter("idJ"));

        if (request.getParameter("idU") != null) {
            String comentario = request.getParameter("desc");
            int idU = Integer.parseInt(request.getParameter("idU"));
            int idCP = Integer.parseInt(request.getParameter("idCP"));
            //idJ = Integer.parseInt(request.getParameter("idJ"));
            int Puntaje = Integer.parseInt(request.getParameter("Puntaje"));

            Comentario c = new Comentario();

            Date fecha = new Date();
            c.setFecha(fecha);
            c.setId_juego(idJ);
            c.setId_padre(idCP);
            c.setId_usu(idU);
            c.setPuntaje(Puntaje);
            c.setTexto(comentario);

            try {
                cc.altaComentario(c);
                System.out.println("Comentario creado exitosamente");
                response.sendRedirect("verInfoJuego?id=" + idJ + "");
            } catch (SQLException ex) {
                Logger.getLogger(AltaComentario.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            response.sendRedirect("verInfoJuego?id=" + idJ + "?msj='Debe estar Logueado'");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
