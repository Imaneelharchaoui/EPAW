package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ToutOffresVetDAO;
import Beans.Offre;

/**
 * Servlet implementation class AnimalServlet
 */
public class ToutOffresVetServlet extends HttpServlet {
	private ToutOffresVetDAO offreDao;

    public void init() {
        offreDao = new ToutOffresVetDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

       

        try {
         ArrayList<Offre> List1 =  offreDao.getToutOffres();
         
         
         request.setAttribute("offres",List1);
         request.getRequestDispatcher("OffresVet.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}