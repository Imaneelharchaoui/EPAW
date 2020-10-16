package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import Dao.UpdateStatusAnnonceDAO;
import Beans.Association;

/**
 * @email Ramesh Fadatare
 */

public class DeleteAnnonceServlet extends HttpServlet {
    private UpdateStatusAnnonceDAO UpdateAnnonceDao;

    public void init() {
        UpdateAnnonceDao = new UpdateStatusAnnonceDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String email = request.getParameter("email");



        
        try {
            UpdateAnnonceDao.updateAnnonce(id,status,email);

   	        response.sendRedirect("Admin?msg:success");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}