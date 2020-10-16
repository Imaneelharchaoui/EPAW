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
import Dao.UpdateReclAssocDAO;
import Beans.Association;

/**
 * @email Ramesh Fadatare
 */

public class UpdateReclAssocServlet extends HttpServlet {
    private UpdateReclAssocDAO UpdateReclAssocDao;

    public void init() {
        UpdateReclAssocDao = new UpdateReclAssocDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String id = request.getParameter("id");
        String status = request.getParameter("status");


        
        try {
            UpdateReclAssocDao.updateStatusRecl(id,status);

   	        response.sendRedirect("Reclamation?msg:success");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}