package com.rentmanagement.beans;

import com.rentmanagement.common.Constants;
import com.rentmanagement.dao.EmailsDAO;
import com.rentmanagement.model.Emails;
import com.rentmanagement.model.SmtpSetup;
import com.sun.mail.util.MailSSLSocketFactory;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.ejb.EJB;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

import javax.mail.internet.MimeMultipart;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Local
@Stateless
public class EmailsBean implements EmailsBeanI {
    @EJB
    SmtpI smtpBean;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Emails edit(Emails emails) {
        EmailsDAO dao = new EmailsDAO(entityManager);
        return dao.merge(emails);
    }

    @Override
    public Emails find() {
        EmailsDAO dao = new EmailsDAO(entityManager);
        return dao.find();
    }

    @Override
    public boolean sendEmail(String message1, String to, String subject) {
        try {
            SmtpSetup setup = smtpBean.getSmtpSetup();
            if (setup == null) {
                setup = new SmtpSetup();
            }

            Properties props = new Properties();

            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", setup.getSmtpHost());
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.fallback", "true");

            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.socketFactory", sf);//this is for Xi
            //props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");//this is for gmail

            Session mailSession = Session.getDefaultInstance(props);
            mailSession.setProtocolForAddress("rfc822", "smtps");
            // mailSession.setDebug(true);
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject);
            message.setContent(message1, "text/html");

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            Transport transport = mailSession.getTransport();

            try {

                message.setFrom(new InternetAddress(setup.getAuthenticatingEmail()));
                transport.connect(setup.getSmtpHost(), Integer.valueOf(setup.getSmtpPort()), setup.getSmtpUsername(),
                        setup.getSmtpPassword());

                transport.sendMessage(message,
                        message.getRecipients(Message.RecipientType.TO));
                transport.close();
            } catch (MessagingException e) {
                e.printStackTrace();
                return false;

            }

        } catch (GeneralSecurityException ex) {
            return false;

            // Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            return false;

            // Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;


    }

    @Override
    public boolean sendEmail(String message1, String to, String subject, String from, String[] attachFiles) {

        try {
            SmtpSetup setup = smtpBean.getSmtpSetup();
            if (setup == null) {
                setup = new SmtpSetup();
            }

            Properties props = new Properties();

            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", setup.getSmtpHost());
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.fallback", "true");

            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.socketFactory", sf);//this is for Xi
            //props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");//this is for gmail

            Session mailSession = Session.getDefaultInstance(props);
            mailSession.setProtocolForAddress("rfc822", "smtps");
            // mailSession.setDebug(true);
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject);
            message.setContent(message1, "text/html");

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            Transport transport = mailSession.getTransport();

            try {

                message.setFrom(new InternetAddress(from));
                transport.connect(setup.getSmtpHost(), Integer.valueOf(setup.getSmtpPort()), setup.getSmtpUsername(),
                        setup.getSmtpPassword());

                transport.sendMessage(message,
                        message.getRecipients(Message.RecipientType.TO));
                transport.close();
            } catch (MessagingException e) {
                e.printStackTrace();
                return  false;

            }

        } catch (GeneralSecurityException ex) {
            return  false;
            // Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            return  false;

            // Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  true;
    }
       /* // sets SMTP server properties
        SmtpSetup setup = smtpBean.getSmtpSetup();
        if (setup == null) {
            setup = new SmtpSetup();
        }
        Properties properties = new Properties();
        properties.put("mail.smtp.host", setup.getSmtpHost());
        properties.put("mail.smtp.port", setup.getSmtpPort());
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", setup.getSmtpUsername());
        properties.put("mail.password", setup.getSmtpPassword());
        final String userName = setup.getSmtpUsername();
        final String password = setup.getSmtpPassword();


        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message

        try {
            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress(from));
            InternetAddress[] toAddresses = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, toAddresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());

            // creates message part

            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(message1, "text/html");

            // creates multi-part
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            // adds attachments
            if (attachFiles != null && attachFiles.length > 0) {
                for (String filePath : attachFiles) {
                    MimeBodyPart attachPart = new MimeBodyPart();

                    try {
                        attachPart.attachFile(filePath);
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }

                    multipart.addBodyPart(attachPart);
                }
            }


            // sets the multi-part as e-mail's content
            msg.setContent(multipart);

            // sends the e-mail
            Transport.send(msg);
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        return true;

    }*/
}
