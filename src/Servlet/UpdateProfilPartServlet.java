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
import Dao.UpdateProfilPartDAO;
import Beans.Particulier;

/**
 * @email Ramesh Fadatare
 */

public class UpdateProfilPartServlet	 extends HttpServlet {
    private UpdateProfilPartDAO particulierDao;

    public void init() {
        particulierDao = new UpdateProfilPartDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Map<String, String> erreurs = new HashMap<String, String>();
        String email = request.getParameter("email");
        String id = request.getParameter("idPart");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");
        String description = request.getParameter("description");
        String  checked ;
        String motdepasse = request.getParameter("motdepasse");
        String motdepasse1 = request.getParameter("motdepasse1");
        
        
      if ( (request.getParameter("checked")) != null) {
		
	  
        try {
            validationMotsDePasse( motdepasse, motdepasse1 );
        } catch (Exception e) {
            erreurs.put( motdepasse, e.getMessage() );
        }
        boolean bool = false;
        try {
           bool = particulierDao.findparticulier(email,id);
            
        } catch (Exception e) {
            erreurs.put( email, e.getMessage() );
        }
        
        
    if (erreurs.isEmpty() && bool==true) {
		
	  
    	
         motdepasse = generateHash(request.getParameter("motdepasse"));

        Particulier particulier = new Particulier();
        particulier.setEmail(email);
        particulier.setNom(nom);
        particulier.setPrenom(prenom);
        particulier.setTelephone(telephone);
        particulier.setAdresse(adresse);
        particulier.setDescription(description);
        particulier.setMotdepasse(motdepasse);

        


        try {
            int result = 0;

            result = particulierDao.updateparticulier(particulier,id);
           if (result !=0) {
           	response.sendRedirect("Homeepaw.jsp?msg=subsuccess");
   		}
           else {
              	response.sendRedirect("Homeepaw.jsp?msg=subfailed");

		}
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    }
      else  {
          boolean bool = false;

    	  try {
              bool = particulierDao.findparticulier(email, id);
              System.out.println(bool);
               
           } catch (Exception e) {
               erreurs.put( email, e.getMessage() );
           }
    	  if (erreurs.isEmpty() && bool==true) {
    	  Particulier particulier = new Particulier();
          particulier.setEmail(email);
          particulier.setNom(nom);
          particulier.setPrenom(prenom);
          particulier.setTelephone(telephone);
          particulier.setAdresse(adresse);
          particulier.setDescription(description);

          try {
              int result = 0;

              result = particulierDao.updateparticulier1(particulier,id);
             if (result !=0) {
             	response.sendRedirect("EspacePart.jsp?msg=updatesuccess");
     		}
             else {
                	response.sendRedirect("EspacePart.jsp?msg=updatefailed");

  		}
          } catch (Exception e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }
	}
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