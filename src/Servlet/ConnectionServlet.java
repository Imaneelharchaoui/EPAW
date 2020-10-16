package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import Dao.ConnectionDao;

/**
 * @email Ramesh Fadatare
 */

public class ConnectionServlet	 extends HttpServlet {
    private ConnectionDao connectionDao;

    public void init() {
        connectionDao = new ConnectionDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Map<String, String> login1 = new HashMap<String, String>();


        HttpSession session = request.getSession();
        
        String motdepasse =generateHash(request.getParameter("motdepasse"));
        String email = request.getParameter("email");	

        
        
        
    
        


        try {
           login1 = connectionDao.connection(email);
           if (login1.get("TYPE").equals("Assoc") && login1.get("email").equals(email ) && login1.get("motdepasse").equals(motdepasse) && login1.get("Status").equals("0")) {
               session.setAttribute("email", login1.get("email"));
               session.setAttribute("nom", login1.get("nom"));
               session.setAttribute("TYPE", login1.get("TYPE"));

              

               response.sendRedirect("EspaceAssoc.jsp?msg:loginsuccess" );

   		}
           else if(login1.get("TYPE").equals("Assoc") && login1.get("email").equals(email ) && login1.get("motdepasse").equals(motdepasse) && login1.get("Status").equals("1")) {
      	        response.sendRedirect("Homeepaw.jsp?msg:youraccountwasbanned");

      		}
              else {
         	        response.sendRedirect("Homeepaw.jsp?msg:loginfailed");

              }
           }
        catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
           try {
               login1 = connectionDao.connectionparticulier(email);
               if (login1.get("TYPE").equals("Part") && login1.get("email").equals(email ) && login1.get("motdepasse").equals(motdepasse) && login1.get("Status").equals("0")) {
                   session.setAttribute("email", login1.get("email"));
                   session.setAttribute("nom", login1.get("nom"));
                   session.setAttribute("id", login1.get("id"));
                   session.setAttribute("tel", login1.get("tel"));
                   session.setAttribute("prenom", login1.get("prenom"));
                   session.setAttribute("adresse", login1.get("adresse"));
                   session.setAttribute("description", login1.get("description"));
                   session.setAttribute("TYPE", login1.get("TYPE"));




                   response.sendRedirect("EspacePart.jsp?msg:loginsuccess" );

       		}
               else if(login1.get("TYPE").equals("Part") && login1.get("email").equals(email ) && login1.get("motdepasse").equals(motdepasse) && login1.get("Status").equals("1")) {
       	        response.sendRedirect("Homeepaw.jsp?msg:youraccountwasbanned");

       		}
               else {
          	        response.sendRedirect("Homeepaw.jsp?msg:loginfailed");

               }
             }
           
         catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
           try {
               login1 = connectionDao.connectionVeterinaire(email);
               if (login1.get("TYPE").equals("Vet") && login1.get("email").equals(email ) && login1.get("motdepasse").equals(motdepasse) && login1.get("Status").equals("0")) {
                   session.setAttribute("email", login1.get("email"));
                   session.setAttribute("nom", login1.get("nom"));
                   session.setAttribute("telephone", login1.get("Telephone"));
                   session.setAttribute("TYPE", login1.get("TYPE"));




                   response.sendRedirect("EspaceVet.jsp?msg:loginsuccess" );

       		}
               else if(login1.get("TYPE").equals("Vet") && login1.get("email").equals(email ) && login1.get("motdepasse").equals(motdepasse) && login1.get("Status").equals("1")) {
       	        response.sendRedirect("Homeepaw.jsp?msg:youraccountwasbanned");

       		}
               else {
          	        response.sendRedirect("Homeepaw.jsp?msg:loginfailed");

               }
             }
           
         catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        

    }
    
    /**
     * Valide les mots de passe saisis.
     */
    private void validationMotsDePasse( String motDePasse, String confirmation ) throws Exception{
        if (motDePasse != null && motDePasse.trim().length() != 0 && confirmation != null && confirmation.trim().length() != 0) {
            if (!motDePasse.equals(confirmation)) {
                throw new Exception("Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
            } else if (motDePasse.trim().length() < 3) {
                throw new Exception("Les mots de passe doivent contenir au moins 3 caractères.");
            }
        } else {
            throw new Exception("Merci de saisir et confirmer votre mot de passe.");
        }
    }
    public static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length;   idx++) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			// handle error here.
		}

		return hash.toString();
	}
    

}