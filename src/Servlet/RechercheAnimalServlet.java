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
import Beans.Animal;
import Beans.Annonces;
import Beans.Association;
import Dao.InfoAssoc;
import Dao.InfoAssocRechDAO;

/**
 * Servlet implementation class AnimalServlet
 */
public class RechercheAnimalServlet extends HttpServlet {
	private RechercheAnimalDAO RechercheAnimalDao;
	private InfoAssocRechDAO infoAssocRechDao;

    public void init() {
        RechercheAnimalDao = new RechercheAnimalDAO();
        infoAssocRechDao = new InfoAssocRechDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String espece=request.getParameter("espece");
       

        try {
         ArrayList<Animal> List1 =  RechercheAnimalDao.getAnimal(espece);
         

         ArrayList<Association> List2 =  infoAssocRechDao.getassociation(espece);
         request.setAttribute("animaux",List1);
         request.setAttribute("association",List2);

         request.getRequestDispatcher("listeanimaux1.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}