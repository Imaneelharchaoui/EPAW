package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Association;

public class AdminInfoAssoc {

	 
	 public ArrayList<Association> getassociation() throws ClassNotFoundException {
		   ArrayList <Association> list1 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM assoc"; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Association association= new Association();
	               association.setId(rs1.getInt("ID"));
	               association.setNom(rs1.getString("nom"));
	               association.setDomaine(rs1.getString("domaine"));
	               association.setEmail(rs1.getString("email"));
	               association.setTelephone(rs1.getString("telephone"));
	               association.setLocalisation(rs1.getString("Localisation"));
	               association.setDate(rs1.getString("dateinscription"));
	               association.setStatus(rs1.getString("status"));

	        	   
	        	   
	        	   list1.add(association);
	           }
	            st1.close();
	       }
	       catch (Exception e)
	       {
	         System.err.println("Got an exception! ");
	         System.err.println(e.getMessage());
	       }
		   
	       	return list1;
	    }
	 public ArrayList<Association> getassociation(String id) throws ClassNotFoundException {
		   ArrayList <Association> list1 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM assoc  WHERE id="+id; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Association association= new Association();
	               association.setId(rs1.getInt("ID"));
	               association.setNom(rs1.getString("nom"));
	               association.setDomaine(rs1.getString("domaine"));
	               association.setEmail(rs1.getString("email"));
	               association.setTelephone(rs1.getString("telephone"));
	               association.setLocalisation(rs1.getString("Localisation"));
	               association.setDate(rs1.getString("dateinscription"));
	               association.setStatus(rs1.getString("status"));

	        	   
	        	   
	        	   list1.add(association);
	           }
	            st1.close();
	       }
	       catch (Exception e)
	       {
	         System.err.println("Got an exception! ");
	         System.err.println(e.getMessage());
	       }
		   
	       	return list1;
	    }
	    
	
	
	
}
