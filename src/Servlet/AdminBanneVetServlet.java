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
import Dao.UpdateStatusVetDAO;
import Beans.Association;

/**
 * @email Ramesh Fadatare
 */

public class AdminBanneVetServlet extends HttpServlet {
    private UpdateStatusVetDAO updateStatusVetDao;

    public void init() {
        updateStatusVetDao = new UpdateStatusVetDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        
        try {
            updateStatusVetDao.updateStatusVet(id,status);
   	        response.sendRedirect("Admin?msg:success");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}