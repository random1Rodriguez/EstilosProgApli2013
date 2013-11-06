/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baseDatos.ManejadorBD;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RegistroAcceso", urlPatterns = {"/RegistroAcceso"})
public class RegistroAcceso extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String so = "";
        String nav = "";
        String ip = request.getRemoteAddr();
        String url = "";
        
        
        //obtener sistema operativo
        if (request.getParameter("SOyNAV").indexOf("Win") != -1){
            so = "windows";
        }
        
        if (request.getParameter("SOyNAV").indexOf("Mac") != -1){
            so = "macintosh";
        }
        
        if (request.getParameter("SOyNAV").indexOf("X11") != -1){
            so = "unix";
        }
        if (request.getParameter("SOyNAV").indexOf("Linux") != -1){
            so = "linux";
        }
        
        System.out.println(request.getParameter("url"));
        
        Date f = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fecha = sdf.format(f);
        
        String sql = "insert into registro_acceso (navegador, so, ip, url, fecha) "
                    + "values('"+nav+"', '"+so+"', '"+ip+"', '"+url+"', '"+fecha+"')";
//        try {
//            ManejadorBD.getInstancia().INSERT(sql);
//        } catch (SQLException ex) {
//            Logger.getLogger(RegistroAcceso.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

}
