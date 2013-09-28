package clases;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnvioEmail {
    private Properties props;
    
    public EnvioEmail(){
        props = new Properties();
    }
    
    public void elegirServidor(String servidor){

       props.setProperty("mail.smtp.user", "progaplimarket@gmail.com");

       props.setProperty("mail.smtp.user", "progaplimarket@gmail.com");

        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        switch(servidor){
            case "gmail": 
                props.setProperty("mail.smtp.host", "smtp.gmail.com");
                props.setProperty("mail.smtp.port","587");
                break;
            case "hotmail":
                props.setProperty("mail.smtp.host", "smtp.live.com");
                props.setProperty("mail.smtp.port","25");
                break;
        }
    }
    
    public void enviarEmail(String des, String asunto, String msj) throws MessagingException{
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        MimeMessage mensaje = new MimeMessage(session);
        InternetAddress destino = new InternetAddress(des);
        mensaje.addRecipient(Message.RecipientType.TO, destino);
        mensaje.setSubject(asunto);
        mensaje.setText(msj);
        Transport t = session.getTransport("smtp");
        t.connect("progaplimarket@gmail.com", "random123456");
        t.sendMessage(mensaje, mensaje.getAllRecipients());
        t.close();
    }
}
