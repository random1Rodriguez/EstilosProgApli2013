/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controladores.Controladorjuegos;
import dominio.Categoria;
import dominio.Desarrollador;
import dominio.Juego;
import dominio.Version;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.sql.SQLException;
import java.util.ArrayList;
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
import org.apache.catalina.Session;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author BlackArmor
 */
@WebServlet(name = "UpImgJuego", urlPatterns = {"/UpImgJuego"})
public class UpImgJuego extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
        } finally {            
            out.close();
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //processRequest(request, response);
            
            /*item.isFormField() false=input file; true=text field*/
             
            String extension = "";
            String extensionv = "";
            InputStream inp = null;
            InputStream inpv = null;
            Long size = null; 
            FileItem item;
            FileItemFactory file_factory = new DiskFileItemFactory();

                /*ServletFileUpload esta clase convierte los input file a FileItem*/
            ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
                /*sacando los FileItem del ServletFileUpload en una lista */
            List items = servlet_up.parseRequest(request);
            
            //obtengo el nombre del juego
                String nom;
                item = (FileItem)items.get(0);
                nom = item.getString();
            
            //obtengo descripcion del juego
                String desc;
                item = (FileItem)items.get(1);
                desc = item.getString();
                
            //obtengo el precio del juego
                Double precio;
                item = (FileItem)items.get(2);
                precio = Double.valueOf(item.getString());
                
            //obtengo nro version del juego
                String version;
                item = (FileItem)items.get(5);
                version = item.getString();
                
                item = (FileItem)items.get(3);
                 if (! item.isFormField()){
                                            /*cual sera la ruta al archivo en el servidor*/
                                        inp=item.getInputStream();
                                        extension = item.getName();
                                         size = item.getSize();
                                         
                                       }
                 //Sube Version Juego
                 item = (FileItem)items.get(4);
                 if (! item.isFormField()){
                                            /*cual sera la ruta al archivo en el servidor*/
                                        inpv=item.getInputStream();
                                        extensionv = item.getName();
                                         size = item.getSize();
                                         
                                       }
                Juego j = new Juego();
                
                extension = extension.substring(extension.lastIndexOf("."), extension.length());

//                String archivov = j.getId() + "-" + version + extensionv;
//                String user = "a8680950";
//                String pass = "random123456";//url
//                String ruta= "progapli2013.comule.com/public_html/ejecutables/" + archivov;
//                String rutaHtml= "http://www.progapli2013.comule.com/ejecutables/" + archivov;
                
                
                //Categorias
                int i=6;
                ArrayList categorias = new ArrayList();
                       
                 while(i<items.size()){
                    item = (FileItem)items.get(i);
                    if(item.getFieldName().equals("cats")){ 
                       
                            Categoria c = new Categoria();
                            c.setId(Integer.valueOf(item.getString()));
                            categorias.add(c);
                            i++;
                    
                    }
                 
                 }
                 
                 
                 
                    //creo la conexion ftp
                   // extension = extension.substring(extension.lastIndexOf("."), extension.length());
                    HttpSession s = request.getSession(true);
                    //obtener nick des
                    Desarrollador des = new Desarrollador();
                     if(s.getAttribute("usuario") != null){
                        
                        try {
                            //obtener usuario desarrollador
                            String usuariologueado = s.getAttribute("usuario").toString();
                            //obtener desarrollador
                            des = (Desarrollador)controladores.ControladorUsuarios.getInstancia().find(usuariologueado);
                        } catch (SQLException ex) {
                            Logger.getLogger(AltaJuego.class.getName()).log(Level.SEVERE, null, ex);
                        }
                     }   
                //    String archivo = j.getNombre().trim() + "-" + nroV + extension;
                    extensionv = extensionv.substring(extensionv.lastIndexOf("."), extensionv.length());
                    String archivo = nom + extension;
                    String user = "a8680950";
                    String pass = "random123456";//url
                    String ruta= "progapli2013.comule.com/public_html/imagenes/juegos/" + archivo;
                    //String rutaHtml= extension;
                    URL url = new URL("ftp://" + user + ":" + pass + "@" + ruta + ";type=i");
              
                    URLConnection urlc = url.openConnection();
                    OutputStream os = urlc.getOutputStream();

                    byte bytes[] = new byte[1024];
                    int readCount = 0;


                    //subo el archivo
                    while ((readCount = inp.read(bytes)) > 0) {
                        os.write(bytes, 0, readCount);
                    }

                    os.flush();
                    os.close();
                    inp.close();
                         
                    
                   
//                    Juego j = new Juego();
                    j.setCategorias(categorias);
                    j.setNombre(nom);
                    j.setPrecio(precio);
                    j.setSize(size/1024);
                    j.setDescripcion(desc);
                    j.setPortada(j.getNombre()+extension);
                    j.setDes(des);
                    
                   
            try {
                int id = Controladorjuegos.getInstancia().altaJuego(j, categorias);
                
                Version v = new Version();
                    
                    v.setNro_version(version);
                    v.setExtension(extensionv);
                    v.setEstado("pendiente");
                    v.setFecha_alta(new Date());
                    v.setId_juego(id);
                    v.setJar((FileInputStream)inpv);
                    
                    v.setSize(size/1024);
                    controladores.ControladorVersiones.getInstancia().altaversion(v);
                    response.sendRedirect("verInfoJuego?id="+ id);
            } catch (SQLException ex) {
                Logger.getLogger(UpImgJuego.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("index.jsp?msj='El Juego no se ha dado de alta.'");
            }
            
             
            
        } catch (FileUploadException ex) {
            Logger.getLogger(UpImgJuego.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
