package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import Dao.UpdateStatusOffreDAO;
import Beans.Association;

/**
 * @email Ramesh Fadatare
 */

public class DeleteOffresServlet extends HttpServlet {
    private UpdateStatusOffreDAO updateOffreDao;

    public void init() {
        updateOffreDao = new UpdateStatusOffreDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        HttpSession session =  request.getSession();



        
        try {
            updateOffreDao.updateOffre(id,status,email);
           if(session.getAttribute("TYPE") != null && session.getAttribute("TYPE").equals("Vet")) {
   	        response.sendRedirect("MesOffres?msg:success");
           }else {
      	        response.sendRedirect("Admin?msg:success");

           }
           
           
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}