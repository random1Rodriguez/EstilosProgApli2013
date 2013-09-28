package servlet;

import baseDatos.ManejadorBD;
import controladores.Controladorjuegos;
import dominio.Juego;
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

@WebServlet(name = "juegosCategoria", urlPatterns = {"/juegosCategoria"})
public class juegosCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try{
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>");
            out.println("<title>La Mejor Tienda de Juegos Online</title>");
            out.println("<jsp:include page=\'plantillas/header.jsp\'></jsp:include>");
            out.println("</head>");         
            out.println("<body>");
            ManejadorBD.getInstancia().conectar();
            Controladorjuegos jj = Controladorjuegos.getInstancia();
            String cad=request.getParameter("id");
            int valor=Integer.parseInt(cad);
            ArrayList juegos = jj.listarJuegosPorCategoria(valor);

            if (juegos != null){
                  int i = 0;

                  while (i < juegos.size()){
                      Juego jue;
                      jue = (Juego)juegos.get(i);
                      out.println("<li>" + jue.getNombre() + "</a></li>");
                      i++;
                  }
              }
            
                            
             
            
             out.println("</body>");
             out.println("</html>");      
        } catch (SQLException ex) {
            Logger.getLogger(juegosCategoria.class.getName()).log(Level.SEVERE, null, ex);
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
