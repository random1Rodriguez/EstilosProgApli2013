
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import baseDatos.ManejadorBD;
import java.sql.SQLException;

@WebServlet(name = "validarNickEmail", urlPatterns = {"/validarNickEmail"})
public class validarNickEmail extends HttpServlet {
    ManejadorBD mbd = ManejadorBD.getInstancia();
    private boolean conectado = false;
    
    public void conectar() throws SQLException{
        if (! conectado){
            mbd.setHost("localhost");
            mbd.setPuerto("3306");
            mbd.setBd("market");
            mbd.setUsuario("root");
            mbd.setPassword("root");
            
            mbd.conectar();
            conectado = true;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            boolean res = false;
            String query = request.getQueryString();
            if (query.contains("nick")){
                String nick = request.getParameter("nick");
                res = validar("nick", nick);
            }
            
            if (query.contains("email")){
                String email = request.getParameter("email");
                res = validar("email", email);
            }
            
            if (res){
                out.write("Valido");
            }
            else{
                out.write("En uso");
            }
            
        }catch(SQLException ex){
            out.write(ex.toString());
        }
        finally {            
            out.close();
        }
    }
    
    boolean validar(String campo, String valor) throws SQLException{
        this.conectar();
        return !mbd.SELECT("select id_usuario from usuarios where "+campo+" = '"+valor+"'").first();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
