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
import Dao.SignalerAssocDAO;
import Beans.Association;

/**
 * @email Ramesh Fadatare
 */

public class SignalerAssocServlet extends HttpServlet {
    private SignalerAssocDAO signalerAssocDao;

    public void init() {
        signalerAssocDao = new SignalerAssocDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String id = request.getParameter("id");
        String motif = request.getParameter("Motif");
        String email = request.getParameter("email");
        String NomAssoc = request.getParameter("NomAssoc");


        
        try {
           signalerAssocDao.signaler(email,id,motif,NomAssoc);
   	        response.sendRedirect("Animals?msg:success");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    

}