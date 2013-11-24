package servlet;

import cliente.ClienteWS;
import clientes.juegos.Juego;
import controladores.Controladorjuegos;
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

@WebServlet(name = "NotificacionNuevaVersion", urlPatterns = {"/NotificacionNuevaVersion"})
public class NotificacionNuevaVersion extends HttpServlet {

    private Controladorjuegos cj = Controladorjuegos.getInstancia();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession s = request.getSession(true);
        //si esta logueado y es cliente
        if (s.getAttribute("usuario") != null && s.getAttribute("tipo").equals("c")){
            try {
                int i = 0, id_usuario = Integer.valueOf(s.getAttribute("idU").toString());
                ArrayList <dominio.Juego> disponibles = cj.nuevasVersionesDisponibles(id_usuario);
                //request.setAttribute("nuevas_versiones", disponibles);
                out.write("[");
                while (i < disponibles.size()){
                    dominio.Juego j = disponibles.get(i);
                    if (i != 0){
                        out.write(", ");
                    }
                    
                    String id = "\""+j.getId()+"\"";
                    String nombre = "\""+j.getNombre()+"\"";
                    String portada = "\""+j.getPortada()+"\"";
                    String precio = "\""+j.getPrecio()+"\"";
                    String des = "\""+j.getDes().getNick()+"\"";
                    
                    out.write("{");
                    out.write("\"id\":"+id);
                    out.write(",\"nombre\":"+nombre);
                    out.write(",\"imagen\":"+portada);
                    out.write(",\"precio\":"+precio);
                    out.write(",\"des\":"+des);
                    out.write("}");
                    i++;
                }
                out.write("]");
                
            } catch (SQLException ex) {
                Logger.getLogger(NotificacionNuevaVersion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            out.write("[]");
        }
    }
}
