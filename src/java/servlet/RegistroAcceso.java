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
        String ip = request.getRemoteAddr();
        String url = request.getParameter("url");
        String nav = request.getParameter("nav");
        
        
        //obtener sistema operativo
        String sisOp = request.getParameter("so").toLowerCase();
        
        if (sisOp.indexOf("win") != -1){
            so = "Windows";
        }
        
        if (sisOp.indexOf("mac") != -1){
            so = "Macintosh";
        }
        
        if (sisOp.indexOf("x11") != -1){
            so = "Unix";
        }
        if (sisOp.indexOf("linux") != -1){
            so = "Linux";
        }
        
        Date f = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fecha = sdf.format(f);
        
        try {
            String sql = "insert into registro_acceso (navegador, so, ip, url, fecha) "
                    + "values('"+nav+"', '"+so+"', '"+ip+"', '"+url+"', '"+fecha+"')";
            System.out.println(sql);
            ManejadorBD.getInstancia().INSERT(sql);
        } catch (SQLException ex) {
            Logger.getLogger(RegistroAcceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
