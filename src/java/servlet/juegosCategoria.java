package servlet;

import baseDatos.ManejadorBD;
import controladores.Controladorjuegos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "juegosCategoria", urlPatterns = {"/juegosCategoria"})
public class juegosCategoria extends HttpServlet {

    ManejadorBD mbd = ManejadorBD.getInstancia();

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
        }

        try {
            PrintWriter out = response.getWriter();
            Controladorjuegos jj = Controladorjuegos.getInstancia();
            String cad = request.getParameter("id");
            int valor = Integer.parseInt(cad);
            int cantidad = 9;
            int inicio = 0;
            int pagina = 0;
            if (request.getParameter("pagina") == null) {
                pagina = 0;
                inicio = pagina;
            } else {
                pagina = Integer.valueOf(request.getParameter("pagina"));
                inicio = pagina * cantidad;
            }

            
            ArrayList juegos = jj.listarJuegosPorCategoria(valor, inicio, cantidad);

            request.setAttribute("cantPagJuegos", jj.obtenerNroPag(valor, cantidad));
            request.setAttribute("listaJuegos", juegos);
            pagina+=1;
            request.getRequestDispatcher("index.jsp?id="+cad+"&pagina="+pagina).forward(request, response);

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
