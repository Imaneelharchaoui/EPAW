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

public class AvertissementAssocServlet extends HttpServlet {

   

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String nom= request.getParameter("nom");
        String email=request.getParameter("email");

        
        try {
        	JavaMail.Sendmail(email,nom);
   	        response.sendRedirect("Admin?msg:mailsuccess");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}