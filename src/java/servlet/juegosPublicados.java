
package servlet;

import baseDatos.ManejadorBD;
import controladores.ControladorUsuarios;
import controladores.Controladorjuegos;
import dominio.Juego;
import dominio.Usuario;
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

@WebServlet(name = "juegosPublicados", urlPatterns = {"/juegosPublicados"})
public class juegosPublicados extends HttpServlet {

  ManejadorBD mbd = ManejadorBD.getInstancia();
  ControladorUsuarios cu = ControladorUsuarios.getInstancia();
  Controladorjuegos cj = Controladorjuegos.getInstancia();
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        
        //obtiene la session y si no existe la crea
        HttpSession sesion = request.getSession(true);
        
        //verifica si hay un usuario logueado
        if (sesion.getAttribute("usuario") != null){
            try {
                //obtiene el usuario loguedo
                String usuarioLogueado = sesion.getAttribute("usuario").toString();
                //obtiene el usuario con el nick que obtuvo de la sesion
                Usuario u = cu.find(usuarioLogueado);
                System.out.println(u);
                
                if (u.getTipo().equals("d")){ //si es desarrollador
                    System.out.println("es desarrollador");
                    //obtengo en un arreglo todos los juegos del desarrollador logueado
                    ArrayList juegos_subidos = cj.listarJuegosPorDesarrolladorVersionAprobada(u.getId()); 
                    int i = 0;
                    //seteo el arreglo con todas la versiones para obtenerlo luego desde verPerfil.jsp
                    request.setAttribute("juegos", juegos_subidos);
                }
                
                
                //seteo el objeto usuario para obtenerlo en verPerfil.jsp y mostrar su informacion
                request.setAttribute("perfil", u);
                request.getRequestDispatcher("juegosPublicados.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(Perfil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            String error = "Error, no ha iniciado sesion";
            request.setAttribute("error", error);
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
