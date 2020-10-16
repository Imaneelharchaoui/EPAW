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
public class LogoutServlet extends HttpServlet {
	

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
        	 session.invalidate();
        	 response.sendRedirect("Homeepaw.jsp");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         

    }
}