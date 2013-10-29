package servlet;
import dominio.Comentario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "VerComentariosAjax", urlPatterns = {"/VerComentariosAjax"})
public class VerComentariosAjax extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        if (request.getParameter("id_com") != null){
            
            int id_com = Integer.valueOf(request.getParameter("id_com"));
            ArrayList <Comentario> respuestas = controladores.ControladorComentarios.getInstancia().obtenerHijos(id_com);
            out.write("[");
            int i = 0;
            while (i<respuestas.size()){
                Comentario com = respuestas.get(i);
                
                if (i != 0){
                    out.write(", ");
                }
                
                String id = "\""+com.getId()+"\"";
                String texto = "\""+com.getTexto()+"\"";
                
                String json = "{\"id\":"+id+", \"texto\":"+texto+"}";
                System.out.println(json);
                out.write(json);
                i++;
            }
            
            out.write("]");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }
}
