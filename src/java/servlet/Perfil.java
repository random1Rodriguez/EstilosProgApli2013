package servlet;

import baseDatos.ManejadorBD;
import controladores.ControladorUsuarios;
import controladores.ControladorVersiones;
import controladores.Controladorjuegos;
import dominio.Juego;
import dominio.Usuario;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "Perfil", urlPatterns = {"/Perfil"})
public class Perfil extends HttpServlet {
    ManejadorBD mbd = ManejadorBD.getInstancia();
    ControladorUsuarios cu = ControladorUsuarios.getInstancia();
    ControladorVersiones cv = ControladorVersiones.getInstancia();
    Controladorjuegos cj = Controladorjuegos.getInstancia();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

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
                    ArrayList juegos_subidos = cj.listarJuegosPorDesarrollador(u.getId());
                    int i = 0;
                    ArrayList versiones = new ArrayList();
                    while(i < juegos_subidos.size()) {
                        Juego j = (Juego)juegos_subidos.get(i);
                        int id_j = j.getId();
                        ArrayList versiones_pendientes = cv.listarVersiones(id_j, 'p');
                        ArrayList versiones_rechazadas = cv.listarVersiones(id_j, 'r');
                        versiones.addAll(versiones_pendientes);
                        versiones.addAll(versiones_rechazadas);
                        i++;
                    }
                    
                    request.setAttribute("versiones", versiones);
                    ArrayList<Juego> juegos_subidos_ver_aprobada = cj.listarJuegosPorDesarrolladorVersionAprobada(u.getId());
                    request.setAttribute("juegos", juegos_subidos_ver_aprobada);
                }

                request.setAttribute("perfil", u);
                request.getRequestDispatcher("verPerfil.jsp").forward(request, response);
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
        processRequest(request, response);
    }
}
