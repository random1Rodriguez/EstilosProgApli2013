package cliente;

public class ClienteWS {

    public static java.util.List<java.lang.Object> listarJuegosPorCliente(int idUsuario) {
        clientes.juegos.ServicioJuegos_Service service = new clientes.juegos.ServicioJuegos_Service();
        clientes.juegos.ServicioJuegos port = service.getServicioJuegosPort();
        return port.listarJuegosPorCliente(idUsuario);
    }

    public static java.util.List<java.lang.Object> listarJuegosPorDesarrollador(int idUsuario) {
        clientes.juegos.ServicioJuegos_Service service = new clientes.juegos.ServicioJuegos_Service();
        clientes.juegos.ServicioJuegos port = service.getServicioJuegosPort();
        return port.listarJuegosPorDesarrollador(idUsuario);
    }

    public static int altaUsuario(java.lang.String nom, java.lang.String ape, java.lang.String nick, java.lang.String email, java.lang.String fnac, java.lang.String pass, java.lang.String img, java.lang.String tipo, java.lang.String sitio) {
        clientes.usuarios.ServicioUsuarios_Service service = new clientes.usuarios.ServicioUsuarios_Service();
        clientes.usuarios.ServicioUsuarios port = service.getServicioUsuariosPort();
        return port.altaUsuario(nom, ape, nick, email, fnac, pass, img, tipo, sitio);
    }

    public static java.util.List<clientes.categorias.Categoria> listarCategorias() {
        clientes.categorias.ServicioCategorias_Service service = new clientes.categorias.ServicioCategorias_Service();
        clientes.categorias.ServicioCategorias port = service.getServicioCategoriasPort();
        return port.listarCategorias();
    }
    
}
