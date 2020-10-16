package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Veterinaire;

public class AdminVetInfoDAO {

	 public ArrayList<Veterinaire> getVet() throws ClassNotFoundException {
		   ArrayList <Veterinaire> list1 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM veterinaire"; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Veterinaire veterinaire= new Veterinaire();
	               veterinaire.setId(rs1.getInt("ID"));
	               veterinaire.setEmail(rs1.getString("email"));
	               veterinaire.setAutorisation(rs1.getString("autorisation"));
	               veterinaire.setAdresse(rs1.getString("adresse"));
	               veterinaire.setTelephone(rs1.getString("telephone"));
	               veterinaire.setDescription(rs1.getString("description"));
	               veterinaire.setDate(rs1.getString("dateinscr"));
	               veterinaire.setStatus(rs1.getString("status"));
	               veterinaire.setNom(rs1.getString("nom"));


	        	   
	        	   
	        	   list1.add(veterinaire);
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
	    
	 public ArrayList<Veterinaire> getVet(String id) throws ClassNotFoundException {
		   ArrayList <Veterinaire> list1 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM veterinaire WHERE id="+id; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Veterinaire veterinaire= new Veterinaire();
	               veterinaire.setId(rs1.getInt("ID"));
	               veterinaire.setEmail(rs1.getString("email"));
	               veterinaire.setAutorisation(rs1.getString("autorisation"));
	               veterinaire.setAdresse(rs1.getString("adresse"));
	               veterinaire.setTelephone(rs1.getString("telephone"));
	               veterinaire.setDescription(rs1.getString("description"));
	               veterinaire.setDate(rs1.getString("dateinscr"));
	               veterinaire.setStatus(rs1.getString("status"));
	               veterinaire.setNom(rs1.getString("nom"));


	        	   
	        	   
	        	   list1.add(veterinaire);
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
