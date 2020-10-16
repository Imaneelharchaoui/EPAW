package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.*;


import Dao.*;
;




/**
 * Servlet implementation class AnimalServlet
 */
public class AdminAssocInfoServlet extends HttpServlet {
	private AdminInfoAssoc infoAssoc;
	private AdminInfoPart infoPart;
	private AdminOffresVetDAO offresVet;
	private AdminVetInfoDAO infoVet;
	private AdminAnnoncesDAO adminAnnonces;

    public void init() {
        infoAssoc = new AdminInfoAssoc();
        infoVet = new AdminVetInfoDAO();
        offresVet = new AdminOffresVetDAO();
        infoPart = new AdminInfoPart();
        adminAnnonces = new AdminAnnoncesDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

       

        try {
         ArrayList<Offre> List6 =  offresVet.getOffres();         
         ArrayList<Veterinaire> List5 =  infoVet.getVet();         
         ArrayList<Particulier> List3 =  infoPart.getParticulier();
         ArrayList<Association> List2 =  infoAssoc.getassociation();
         ArrayList<Animal> List4 =  adminAnnonces.getAnimals();
       
         request.setAttribute("association",List2);
         request.setAttribute("Part",List3);
         request.setAttribute("annonces",List4);
         request.setAttribute("veterinaire",List5);
         request.setAttribute("offres",List6);




         request.getRequestDispatcher("Admin.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}