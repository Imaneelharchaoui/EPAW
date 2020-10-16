package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Reclamation;

public class AdminReclamationDAO {

	 
	 public ArrayList<Reclamation> getReclamation() throws ClassNotFoundException {
		   ArrayList <Reclamation> list3 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM RECLAMATION where status=0"; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Reclamation Reclamation= new Reclamation();
	               Reclamation.setId(rs1.getInt("ID"));
	               Reclamation.setObjet(rs1.getString("objet"));
	               Reclamation.setMessage(rs1.getString("corps"));
	               Reclamation.setEmail(rs1.getString("sender"));
	               Reclamation.setStatus(rs1.getString("status"));
	               
	               

	        	   
	        	   
	        	   list3.add(Reclamation);
	           }
	            st1.close();
	       }
	       catch (Exception e)
	       {
	         System.err.println("Got an exception! ");
	         System.err.println(e.getMessage());
	       }
		   
	       	return list3;
	    }
	    
	 public ArrayList<Reclamation> getReclamationAssoc() throws ClassNotFoundException {
		   ArrayList <Reclamation> list3 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM RECLAMATIONASSOC where status=0"; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Reclamation Reclamation= new Reclamation();
	               Reclamation.setId(rs1.getInt("ID"));
	               Reclamation.setObjet(rs1.getString("objet"));
	               Reclamation.setMessage(rs1.getString("corps"));
	               Reclamation.setEmail(rs1.getString("sender"));
	               Reclamation.setStatus(rs1.getString("status"));
	               
	               

	        	   
	        	   
	        	   list3.add(Reclamation);
	           }
	            st1.close();
	       }
	       catch (Exception e)
	       {
	         System.err.println("Got an exception! ");
	         System.err.println(e.getMessage());
	       }
		   
	       	return list3;
	    }
	    
	
	
}
