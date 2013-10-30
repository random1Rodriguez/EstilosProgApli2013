
package servlet;

import dominio.Usuario;
import dominio.Version;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "descargaJuego", urlPatterns = {"/descargaJuego"})
public class descargaJuego extends HttpServlet {
controladores.ControladorUsuarios cu = controladores.ControladorUsuarios.getInstancia();
controladores.ControladorCompras cc = controladores.ControladorCompras.getInstancia();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession s = request.getSession();
            
            Version v = new Version();
            if (request.getParameter("id") !=null){
               v =controladores.ControladorVersiones.getInstancia().ultimaVerAprobada(Integer.valueOf(request.getParameter("id")));
            }
            if(s.getAttribute("usuario") != null){
            Usuario u = cu.find(s.getAttribute("usuario").toString());
            if(cc.comproJuego(u.getId(), v.getJuego().getId())){
                response.setContentType("application/x-zip-compressed");
                response.setHeader("Content-Disposition", "attachment;filename=\"" + v.getJuego().getNombre() + "-"  + v.getNro_version() + v.getExtension() + "");
                InputStream in = v.getJarIs();

                OutputStream out = response.getOutputStream();

                byte [] buffer = new byte[4096];
                for (;;) {
                    int nBytes = in.read(buffer);
                    if (nBytes == -1)
                        break;
                    out.write(buffer,0,nBytes);
                }

                in.close();
                out.flush();
                out.close();
            }else{
                request.getRequestDispatcher("verInfoJuego?id=" + v.getJuego().getId()).forward(request, response);
            }
            }
            else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
            
            }
        } catch (IOException | SQLException ex) {
            Logger.getLogger(descargaJuego.class.getName()).log(Level.SEVERE, null, ex);
        }
    
     }

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
             {
        
     }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
