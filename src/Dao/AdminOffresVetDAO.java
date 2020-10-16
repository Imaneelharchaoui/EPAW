package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Offre;

public class AdminOffresVetDAO {
	 public ArrayList<Offre> getOffres() throws ClassNotFoundException {
	        String query = "SELECT * FROM offresvet";
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
	        	   offre.setEmail(rs.getString("email"));
	        	   offre.setType(rs.getString("Type"));
	        	   offre.setTarification(rs.getString("tarification"));
	        	   offre.setDescription(rs.getString("description"));
	        	   offre.setDate(rs.getString("date"));
	        	   offre.setTelephone(rs.getString("telephone")); 
	        	   offre.setStatus(rs.getString("status"));


	        	   
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
	 public ArrayList<Offre> getOffres(String id) throws ClassNotFoundException {
	        String query = "SELECT * FROM offresvet WHERE id="+id;
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
	        	   offre.setEmail(rs.getString("email"));
	        	   offre.setType(rs.getString("Type"));
	        	   offre.setTarification(rs.getString("tarification"));
	        	   offre.setDescription(rs.getString("description"));
	        	   offre.setDate(rs.getString("date"));
	        	   offre.setTelephone(rs.getString("telephone")); 
	        	   offre.setStatus(rs.getString("status"));


	        	   
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
