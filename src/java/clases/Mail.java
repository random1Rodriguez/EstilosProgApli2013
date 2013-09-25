package clases;

import java.util.Properties;

public class Mail {
    
    private String user;
    private String pass;
    private String destino;
    private String asunto;
    private String mensaje;
    
    private Properties props;

    public Mail() {
        this.user = "";
        this.asunto = "";
        this.destino = "";
        this.pass = "";
        this.mensaje = "";
        
        this.props = new Properties();
        
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Properties getProps() {
        return props;
    }

    public void setProps(Properties props) {
        this.props = props;
    }
    
    public void setServidor(String opcion){
        switch(opcion){
            case "gmail": cargarGmail();
                break;
            case "hotmail": cargarHotmail();
                break;
        }
    }

    private void cargarGmail() {
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.user", this.user);
        props.setProperty("mail.smtp.auth", "true");
    }

    private void cargarHotmail() {
        //cargar valores para hotmail
    }
}
