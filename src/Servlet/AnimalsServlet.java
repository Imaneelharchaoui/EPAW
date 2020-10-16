package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AnimalsDAO;
import Beans.Animal;
import Beans.Annonces;
import Beans.Association;
import Dao.InfoAssoc;

/**
 * Servlet implementation class AnimalServlet
 */
public class AnimalsServlet extends HttpServlet {
	private AnimalsDAO animalsDao;
	private InfoAssoc infoAssoc;

    public void init() {
        animalsDao = new AnimalsDAO();
        infoAssoc = new InfoAssoc();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();

       

        try {
         ArrayList<Animal> List1 =  animalsDao.getAnimal();
         

         ArrayList<Association> List2 =  infoAssoc.getassociation();
         request.setAttribute("animaux",List1);
         request.setAttribute("association",List2);

         request.getRequestDispatcher("listeanimaux1.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}