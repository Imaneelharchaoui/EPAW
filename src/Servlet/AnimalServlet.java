package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AnimalDAO;
import Beans.Animal;

/**
 * Servlet implementation class AnimalServlet
 */
public class AnimalServlet extends HttpServlet {
	private AnimalDAO animalDao;

    public void init() {
        animalDao = new AnimalDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        try {
         ArrayList<Animal> List1 =  animalDao.getAnimal(email);
         
         
         request.setAttribute("animaux",List1);
         request.getRequestDispatcher("listeanimaux.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}