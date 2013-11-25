/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import baseDatos.ManejadorBD;
import controladores.ControladorCompras;
import controladores.ControladorUsuarios;
import controladores.Controladorjuegos;
import dominio.Compra;
import dominio.Juego;
import dominio.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "comprarJuego", urlPatterns = {"/comprarJuego"})
public class comprarJuego extends HttpServlet {
    private ManejadorBD mbd = ManejadorBD.getInstancia();
    private ControladorCompras cc = ControladorCompras.getInstancia();
    private Controladorjuegos cj = Controladorjuegos.getInstancia();
    private ControladorUsuarios cu = ControladorUsuarios.getInstancia();

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
             System.err.println("Excepcion en la conexion: "+ex.getMessage());
        }
         
        try{
            PrintWriter out = response.getWriter();
            HttpSession s = request.getSession(true); //obtengo la sesion y si no existe la creo

            if (s.getAttribute("usuario") != null){
                String user =(String)s.getAttribute("usuario");
                Usuario usuario = cu.find(user); //a usuario de tipo Usuario le digo que busque y asigne el cliente solicitado

                int idj = Integer.parseInt(request.getParameter("id"));//guardo el id en un valor de tipo int

                Date fecha = new Date(); //objeto Date con la fecha altual

                Juego actualJ = cj.buscarJuegoPorID(idj);//busco el juego y lo guardo en actualJ de tipo juego
                Compra comp = new Compra(actualJ,usuario,fecha);//creo una nueva compra
                cc.altaCompra(comp);
                response.sendRedirect("descargaJuego?id="+idj);
                //request.getRequestDispatcher("/Perfil").forward(request, response);
            }
        }
        catch(SQLException ex){
            Logger.getLogger(Perfil.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("Excepcion en la compra: "+ex.getMessage());
        }
    }
}
