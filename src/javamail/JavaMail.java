package javamail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class JavaMail {

    public static    void Sendmail(String email,String nomAssoc,String nomPart,String idAnnonce,String idPart,String prenomPart,String telPart,String emailPart) {

        final String username = "epaw.pets@gmail.com";
        final String password = "leanacalderon";

        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("epaw.pets@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("Demande d'adoption concernant l'annonce N° :"+idAnnonce );
            message.setText("Bonjour, "+nomAssoc
                    + "\n\n "+nomPart+" "+prenomPart+ " portant l'identifiant "+idPart+" souhaite adopter l'animal concerné par l'annonce N° :" +idAnnonce
                    +"\n\n INFORMATIONS SUPLEMENTAIRES: \n\t" +" NOM :"+nomPart+"\n\t PRENOM :"+prenomPart+"\n\t N° TELEPHONE : "+telPart+"\n\t EMAIL : "+emailPart);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static    void Sendmail(String email,String nomAssoc) {

        final String username = "epaw.pets@gmail.com";
        final String password = "leanacalderon";

        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("epaw.pets@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("AVERTISSEMENT E-PAW !!" );
            message.setText("Bonjour, "+nomAssoc
                    + "\n\n  Suite au multiples reclamations que l'administration a reçu de la part des utilisateurs de la plateforme E-PAW , nous avons decidés de vous addresser cet avertissement afin que vous puissiez revoir votre comportement.\n\t Si les reclamations à votre encontre s'ensuivent , des mesures plus sévères seront prises telles que le BANNE definitif de votre compte E-PAW , dans de telles circonstances une enquete est ouverte pour plus de transparence.\n\n Merci. ");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}