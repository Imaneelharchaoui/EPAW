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
import Dao.UpdateStatusReclDAO;
import Beans.Association;

/**
 * @email Ramesh Fadatare
 */

public class DeleteReclServlet extends HttpServlet {
    private UpdateStatusReclDAO UpdateStatusReclDao;

    public void init() {
        UpdateStatusReclDao = new UpdateStatusReclDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String id = request.getParameter("id");
        String status = request.getParameter("status");


        
        try {
            UpdateStatusReclDao.updateStatusRecl(id,status);

   	        response.sendRedirect("Reclamation?msg:success");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}