package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AnnoncesDAO;
import Beans.Annonces;

/**
 * @email Ramesh Fadatare
 */

public class AnnonceServlet extends HttpServlet {
    private AnnoncesDAO annonceDao;

    public void init() {
        annonceDao = new AnnoncesDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();


        String espece = request.getParameter("espece");
        String race = request.getParameter("race");
        String sexe = request.getParameter("sexe");
        String age = request.getParameter("age");
        String handicap = request.getParameter("handicap");
        String vaccin = request.getParameter("vaccin");
        String cs = request.getParameter("cs");
        String image = request.getParameter("image");
        String description = request.getParameter("Description");

        String email=(String) session.getAttribute("email");

        Annonces annonce = new Annonces();
        annonce.setEspece(espece);
        annonce.setSexe(sexe);
        annonce.setRace(race);
        annonce.setAge(age);
        annonce.setHandicap(handicap);
        annonce.setVaccin(vaccin);
        annonce.setCs(cs);
        annonce.setImage(image);
        annonce.setDesc(description);
        annonce.setEmail(email);


        try {
            annonceDao.ajoutAnnonce(annonce);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("EspaceAssoc.jsp?msg:success");
    }
}