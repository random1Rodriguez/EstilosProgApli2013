package servlet;

import controladores.Controladorjuegos;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BusquedaConFiltros", urlPatterns = {"/BusquedaConFiltros"})
public class BusquedaConFiltros extends HttpServlet {
    
    private Controladorjuegos cj = Controladorjuegos.getInstancia();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("get");
            double min = 0, max = 0;
            String busqueda = request.getParameter("busqueda");
            
            if (!request.getParameter("inicio").equals("")){
                min = Double.valueOf(request.getParameter("inicio"));
            }
            
            if (!request.getParameter("fin").equals("")){
                max = Double.valueOf(request.getParameter("fin"));
            }
            
            ArrayList juegos = null;
            
            if (busqueda != null){
                juegos = cj.buscarRangoPrecio(busqueda, min, max);
            }
            if (juegos != null){
                request.setAttribute("flag", 1);
            }
            request.setAttribute("juegos", juegos);
            request.getRequestDispatcher("busqueda.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(BusquedaConFiltros.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
