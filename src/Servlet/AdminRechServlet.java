package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.RechercheAnimalDAO;
import Beans.*;
import Dao.AdminAnnoncesDAO;
import Dao.AdminInfoAssoc;
import Dao.AdminInfoPart;
import Dao.AdminOffresVetDAO;
import Dao.AdminVetInfoDAO;
import Dao.InfoAssoc;
import Dao.InfoAssocRechDAO;

/**
 * Servlet implementation class AnimalServlet
 */
public class AdminRechServlet extends HttpServlet {
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session1 = request.getSession();
        String id=request.getParameter("id");
        String type=request.getParameter("type");

       

        try {
        	if(type.equals("Part")) {
                ArrayList<Particulier> List3 =  infoPart.getParticulier(id);
                request.setAttribute("Part",List3);
                session1.setAttribute("Table", "Part");
                request.getRequestDispatcher("AdminRech.jsp").forward(request,response);
                System.out.println(type);

        	}else if(type.equals("Assoc")){
                ArrayList<Association> List2 =  infoAssoc.getassociation(id);
                ArrayList<Animal> List4 =  adminAnnonces.getAnimals();

                request.setAttribute("association",List2);
                request.setAttribute("annonces",List4);
                session1.setAttribute("Table", "Assoc");
                request.getRequestDispatcher("AdminRech.jsp?msg=AssocFound").forward(request,response);
                System.out.println(type);

        	}else if(type.equals("Vet")) {
                ArrayList<Offre> List6 =  offresVet.getOffres();         
                ArrayList<Veterinaire> List5 =  infoVet.getVet(id);         
                request.setAttribute("veterinaire",List5);
                request.setAttribute("offres",List6);
                session1.setAttribute("Table", "Vet");
                request.getRequestDispatcher("AdminRech.jsp").forward(request,response);
                System.out.println(type);

        		
        	} 
        		response.sendRedirect("HomeAdmin.jsp?msg:IDintrouvable");
        	
        	
        	

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}