package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AjoutOffreDAO;
import Beans.Offre;

/**
 * @email Ramesh Fadatare
 */

public class AjoutOffreServlet extends HttpServlet {
    private AjoutOffreDAO ajoutOffreDao;

    public void init() {
        ajoutOffreDao = new AjoutOffreDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();


        String type = request.getParameter("type");
        String tarification = request.getParameter("tarification");
        String description = request.getParameter("Description");
        String telephone= request.getParameter("telephone");
        String email=(String) session.getAttribute("email");

        Offre offre = new Offre();
        offre.setType(type);
        offre.setTarification(tarification);
        offre.setDescription(description);
        offre.setEmail(email);
        offre.setTelephone(telephone);


        try {
            ajoutOffreDao.ajoutOffre(offre);
            response.sendRedirect("EspaceVet.jsp?msg:success");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            response.sendRedirect("EspaceVet.jsp?msg:failed");

        }

        
    }
}