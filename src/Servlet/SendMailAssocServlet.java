package Servlet;

import java.io.IOException;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AdminAnnoncesDAO;
import Dao.AdminInfoAssoc;
import Dao.AdminInfoPart;
import Dao.AdminOffresVetDAO;
import Dao.AdminVetInfoDAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import javamail.JavaMail;

/**
 * @email Ramesh Fadatare
 */

public class SendMailAssocServlet extends HttpServlet {

   

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String idAnnonce = request.getParameter("idAnnonce");
        String nomAssoc = request.getParameter("nomAssoc");
        String nomPart = request.getParameter("nomPart");
        String prenomPart = request.getParameter("prenomPart");
        String idPart = request.getParameter("idPart");
        String telPart = request.getParameter("telPart");
        String emailPart = request.getParameter("emailPart");

        String email=request.getParameter("email");

        
        try {
        	JavaMail.Sendmail(email,nomAssoc,nomPart,idAnnonce,idPart,prenomPart,telPart,emailPart);
   	        response.sendRedirect("Animals?msg:mailsuccess");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}