
package servlet;

import dominio.Version;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "descargaJuego", urlPatterns = {"/descargaJuego"})
public class descargaJuego extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Version v = new Version();
            if (request.getParameter("id") !=null){
               v =controladores.ControladorVersiones.getInstancia().ultimaVerAprobada(Integer.valueOf(request.getParameter("id")));
            }
            response.setContentType(".jar");
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
        } catch (IOException ex) {
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
