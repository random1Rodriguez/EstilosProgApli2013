
package servlet;

import baseDatos.ManejadorBD;
import dominio.Juego;
import dominio.Version;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
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
                
             ManejadorBD.getInstancia().conectar();
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
                FileItem item;
                //obtengo el idJuego desde el formulario en el jsp
                //y obtengo el juego con ese id
                int juego;
                item = (FileItem)items.get(0);
                juego = Integer.valueOf(item.getString());
                Juego j;
                
                j = controladores.Controladorjuegos.getInstancia().buscarJuegoPorID(juego);
                
                
                //obtengo el nro de version del juego
                String nroV;
                item = (FileItem)items.get(1);
                nroV = item.getString();
                
                /*item.isFormField() false=input file; true=text field*/
                int i=0;
                
                        
                item = (FileItem)items.get(2);
                if (! item.isFormField()){
                        /*cual sera la ruta al archivo en el servidor*/
                    inp=item.getInputStream();
                    extension = item.getName();
                     size = item.getSize();
                   }
                //creo la conexion ftp
                extension = extension.substring(extension.lastIndexOf("."), extension.length());
                HttpSession s = request.getSession(true);
                String archivo = j.getNombre().trim() + "-" + nroV + extension;
                String user = "a8680950";
                String pass = "random123456";//url
                String ruta= "progapli2013.comule.com/public_html/ejecutables/" + archivo;
                String rutaHtml= "http://www.progapli2013.comule.com/ejecutables/" + archivo;
//                URL url = new URL("ftp://" + user + ":" + pass + "@" + ruta + ";type=i");
//              
//                URLConnection urlc = url.openConnection();
//                OutputStream os = urlc.getOutputStream();
//                
//                byte bytes[] = new byte[1024];
//                int readCount = 0;
//                
//                
//                //subo el archivo
//                while ((readCount = inp.read(bytes)) > 0) {
//                    os.write(bytes, 0, readCount);
//                }
//                
//                os.flush();
//                os.close();
//                inp.close();
//                
               
                Version v = new Version();
                v.setJuego(j);
                v.setEstado("pendiente");
                
                v.setFecha_alta(new Date());
                v.setNro_version(nroV);
                v.setExtension(extension);
                
                v.setId_juego(juego);
                v.setJar((FileInputStream) inp);
               
                v.setSize(size/1024);
              
                controladores.ControladorVersiones.getInstancia().altaversion(v);
                String ok = "La version del juego se dio de alta " + 
                    "con exito";
                request.setAttribute("ok", ok);
                request.getRequestDispatcher("versionJuego.jsp").forward(request, response);
                
       } catch (FileUploadException ex) {
            String error = "La version del juego no se pudo dar de alta, " + 
                    "ocurrio un error al subir el juego";
            request.setAttribute("error", error);
            request.getRequestDispatcher("versionJuego.jsp").forward(request, response);
                 
           
         }catch (SQLException ex) {
            String error = "La version del juego no se pudo dar de alta";
            request.setAttribute("error", error);
            request.getRequestDispatcher("versionJuego.jsp").forward(request, response);
            
         }
       
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
