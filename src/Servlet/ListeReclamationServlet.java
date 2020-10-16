package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.*;

import Dao.AdminReclamationDAO;


/**
 * Servlet implementation class AnimalServlet
 */
public class ListeReclamationServlet extends HttpServlet {
	private AdminReclamationDAO reclamation;

    public void init() {
        reclamation = new AdminReclamationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

       

        try {
         

         ArrayList<Reclamation> List2 =  reclamation.getReclamation();
         ArrayList<Reclamation> List3 =  reclamation.getReclamationAssoc();

         request.setAttribute("recl",List2);
         request.setAttribute("reclAssoc",List3);



         request.getRequestDispatcher("Reclamations.jsp").forward(request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}