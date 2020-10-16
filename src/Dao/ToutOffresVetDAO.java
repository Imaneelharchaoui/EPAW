package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Offre;

public class ToutOffresVetDAO {
	
	public ArrayList<Offre> getToutOffres() throws ClassNotFoundException {
        String query = "SELECT * FROM Offresvet WHERE status=0"; 

        ArrayList <Offre> list = new ArrayList <> ();
        

        Class.forName("com.mysql.jdbc.Driver");

       try { Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

           Statement st = connection.createStatement();
        		
           ResultSet rs = st.executeQuery(query);
           
           while (rs.next())
           {
               Offre offre=new Offre();

        	   offre.setId(rs.getInt("ID")) ;
        	   offre.setType(rs.getString("TYPE"));
        	   offre.setDescription(rs.getString("DESCRIPTION"));
        	   offre.setTarification(rs.getString("TARIFICATION"));
        	   offre.setStatus(rs.getString("Status"));
        	   offre.setDate(rs.getString("DATE"));
        	   offre.setEmail(rs.getString("EMAIL"));
        	   offre.setTelephone(rs.getString("telephone"));

        	  


        	   
        	   list.add(offre);
           }
            st.close();
       }
       catch (Exception e)
       {
         System.err.println("Got an exception! ");
         System.err.println(e.getMessage());
       }
       	return list;
    }
    

}
