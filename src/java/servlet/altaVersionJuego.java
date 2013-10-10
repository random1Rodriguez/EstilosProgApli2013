
package servlet;

import dominio.Version;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "altaVersionJuego", urlPatterns = {"/altaVersionJuego"})
public class altaVersionJuego extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
      
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
                
             
                 // FileItemFactory es una interfaz para crear FileItem
                FileItemFactory file_factory = new DiskFileItemFactory();

                /*ServletFileUpload esta clase convierte los input file a FileItem*/
               ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
                /*sacando los FileItem del ServletFileUpload en una lista */
                List items = servlet_up.parseRequest(request);

              
                InputStream inp = null;
                  
                    /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
                String extension = "";
                Long size = null;
                  
                    /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
                FileItem item = (FileItem)items.get(2);
                    /*item.isFormField() false=input file; true=text field*/
                if (! item.isFormField()){
                        /*cual sera la ruta al archivo en el servidor*/
                    inp=item.getInputStream();
                    extension = item.getName();
                     size = item.getSize();
                   }
                HttpSession s = request.getSession(true);
                String archivo = s.getAttribute("usuario") + extension.substring(extension.lastIndexOf("."), extension.length());
                String user = "root";
                String pass = "root";//url
                String ruta= "localhost/" + archivo;
                URL url = new URL("ftp://" + user + ":" + pass + "@" + ruta + ";type=i");
              
                URLConnection urlc = url.openConnection();
                OutputStream os = urlc.getOutputStream();
                
                byte bytes[] = new byte[1024];
                int readCount = 0;

                while ((readCount = inp.read(bytes)) > 0) {
                    os.write(bytes, 0, readCount);
                }
                
                os.flush();
                os.close();
                inp.close();
                int juego;
                item = (FileItem)items.get(0);
                juego = Integer.valueOf(item.getString());
                
                String nroV;
                item = (FileItem)items.get(1);
                nroV = item.getString();
                
               
                Version v = new Version();
                
                v.setEstado("pendiente");
                
                v.setFecha_alta(new Date());
                v.setNro_version(nroV);
               
                
                v.setId_juego(juego);
                v.setJar(ruta);
               
                v.setSize(size/1024);
              
                controladores.ControladorVersiones.getInstancia().altaversion(v);
             
               
             
             
             

                
       } catch (FileUploadException ex) {
            Logger.getLogger(altaVersionJuego.class.getName()).log(Level.SEVERE, null, ex);
        
         }catch (Exception ex) {
            Logger.getLogger(altaVersionJuego.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
