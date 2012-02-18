/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
//import javax.mail.*;// จะใช้เอาออกน่ะ
//import javax.mail.internet.*;


/**
 *
 * @author Achilles
 */
public class Email {

    private Properties props;
    private String subject;
    private String toAddress;
    private String fromAddress;

    public Email() {
        this("localhost", "", "");
    }
    public Email(String host,String user,String password){
        props = new Properties();
        props.setProperty("mail.transport.protocol","smtp");
        props.setProperty("mail.host",host);
        props.setProperty("mail.user",user);
        props.setProperty("mail.password",password);
    }
    public void setSubject(String subject){
        this.subject = subject;
    }
    public void setFromAddress(String fromAddress){
        this.fromAddress = fromAddress;
    }
    public void setToAddress(String toAddress){
        this.toAddress = toAddress;
    }
   /* public void send(String textMessage) {// จะใช้เอาออกน่ะ
        try {
            Session mailSession = Session.getInstance(props);
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject, "UTF-8");
            message.setFrom(new InternetAddress(fromAddress));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
            message.setText(textMessage, "UTF-8");
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
    /*public void send(HtmlMessage htmlMessage){// จะใช้เอาออกน่ะ
        try {
            Session mailSession = Session.getInstance(props);
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject, "UTF-8");
            message.setFrom(new InternetAddress(fromAddress));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
            message.setContent(htmlMessage.getMultipart());
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }*/
}
