package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import Dao.ReclamationAssocDAO;
import Beans.Reclamation;

/**
 * @email Ramesh Fadatare
 */

public class ReclamationAssocServlet	 extends HttpServlet {
    private ReclamationAssocDAO reclamationDao;

    public void init() {
        reclamationDao = new ReclamationAssocDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Map<String, String> erreurs = new HashMap<String, String>();

        String objet = request.getParameter("objet");
        String message= request.getParameter("message");
        String email = request.getParameter("email");
      
        
        
       
        
        
    
		
	  
    	

        Reclamation reclamation = new Reclamation();
        reclamation.setEmail(email);
        reclamation.setObjet(objet);
        reclamation.setMessage(message);
        

        


        try {
            int result = 0;

            result = reclamationDao.ajoutreclamation(reclamation);
           if (result !=0) {
           	response.sendRedirect("EspaceAssoc.jsp?msg=success");
   		}
           else {
              	response.sendRedirect("EspaceAssoct.jsp?msg=failed");

		}
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        

    }
    
}