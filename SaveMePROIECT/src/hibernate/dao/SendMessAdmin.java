package hibernate.dao;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import hibernate.model.Nevoie;
import hibernate.model.User2;

public class SendMessAdmin {

//send email to the user email
public boolean sendEmail(Nevoie nevoie) {
    boolean test = false;
    
    HibernateDao userDao = new HibernateDao();
   
    User2 exUser2=userDao.selectUserProfil2(nevoie.getId_UserNev());
    String toEmail = exUser2.getEmail();
   
    
    String fromEmail = "foryoumanagement00@gmail.com";
    String password = "Campionii9";

    try {

        // your host email smtp server details
        Properties pr = new Properties();
        pr.setProperty("mail.smtp.host", "smtp.gmail.com");
        pr.setProperty("mail.smtp.port", "587");
        pr.setProperty("mail.smtp.auth", "true");
        pr.setProperty("mail.smtp.starttls.enable", "true");
        pr.put("mail.smtp.socketFactory.port", "587");
        pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        //get session to authenticate the host email address and password
        Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        //set email message details
        Message mess = new MimeMessage(session);

		//set from email address
        mess.setFrom(new InternetAddress(fromEmail));
		//set to email address or destination email address
        mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		
		//set email subject
        mess.setSubject("Admin");
        
		//set message text
        mess.setText(nevoie.getMesajAdmin());
        //send the message
        Transport.send(mess);
        
        test=true;
        
    } catch (Exception e) {
        e.printStackTrace();
    }

    return test;
}
}
