package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.OffresVetDAO;
import Beans.Offre;

/**
 * Servlet implementation class AnimalServlet
 */
public class OffresVetServlet extends HttpServlet {
	private OffresVetDAO offreDao;

    public void init() {
        offreDao = new OffresVetDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        try {
         ArrayList<Offre> List1 =  offreDao.getOffres(email);
         
         
         request.setAttribute("offres",List1);
         request.getRequestDispatcher("OffresVet.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}