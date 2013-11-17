package servlet;

import cliente.ClienteWS;
import controladores.ControladorUsuarios;
import dominio.Desarrollador;
import dominio.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Registro", urlPatterns = {"/registro"})
public class Registro extends HttpServlet {

    private ControladorUsuarios cu = ControladorUsuarios.getInstancia();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try {
            String nick = request.getParameter("nick");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String nombre = request.getParameter("nom");
            String apellido = request.getParameter("ape");
            String tipo = request.getParameter("tipo");
            String fnac = request.getParameter("fnac");
            String sitio = request.getParameter("sitio");

            boolean correcto = false;

            if (!nick.equals("") && !email.equals("") && !pass.equals("")) {
                if (tipo.equals("c") || tipo.equals("d")) {
                    correcto = true;
                    Usuario u = new Usuario();

                    if (!fnac.equals("")) {
                        Calendar c = new GregorianCalendar();
                        String[] datos = fnac.split("-");
                        int year = Integer.valueOf(datos[0]);
                        int mes = Integer.valueOf(datos[1]);
                        int dia = Integer.valueOf(datos[2]);
                        c.set(year, mes - 1, dia);
                        Date f = c.getTime();
                        u.setFecha_nac(f);
                    }

                    if (tipo.equals("d")) {
                        Desarrollador d = new Desarrollador();
                        d.setWeb(sitio);
                        u = d;
                    }

                    u.setNombre(nombre);
                    u.setApellido(apellido);
                    u.setEmail(email);
                    u.setNick(nick);
                    u.setPass(pass);
                    u.setTipo(tipo);

                    cu.altaUsuario(u);
                    System.out.println("Registro exitoso");
                    response.sendRedirect("index.jsp");
                }

            }
            
            if (!correcto){
                request.setAttribute("error", "La informacion no es valida");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("registro.jsp");
        }
    }
}