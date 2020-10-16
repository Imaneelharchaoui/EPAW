package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UpdateAnnonceDAO;
import Beans.Annonces;

/**
 * @email Ramesh Fadatare
 */

public class ConnAdminServlet extends HttpServlet {

    public void init() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();

        
        String adminMdp = request.getParameter("AdminMdp");
        


      if (adminMdp.equals("EPAW123")) {
          session.setAttribute("AdminMdp", adminMdp);

          response.sendRedirect("HomeAdmin.jsp?msg:loginsuccess");

	}else {
        response.sendRedirect("ConnexionAdmin.jsp?msg:loginfailed");

    }
      }
    }
