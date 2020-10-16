package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Particulier;

public class AdminInfoPart {

	 
	 public ArrayList<Particulier> getParticulier() throws ClassNotFoundException {
		   ArrayList <Particulier> list3 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM particulier"; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Particulier Particulier= new Particulier();
	               Particulier.setId(rs1.getInt("ID"));
	               Particulier.setNom(rs1.getString("nom"));
	               Particulier.setPrenom(rs1.getString("Prenom"));
	               Particulier.setEmail(rs1.getString("email"));
	               Particulier.setTelephone(rs1.getString("telephone"));
	               Particulier.setDescription(rs1.getString("description"));
	               Particulier.setAdresse(rs1.getString("adresse"));
	               Particulier.setStatus(rs1.getString("status"));
	               Particulier.setDate(rs1.getString("dateinscr"));

	        	   
	        	   
	        	   list3.add(Particulier);
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
	    
	 public ArrayList<Particulier> getParticulier(String id) throws ClassNotFoundException {
		   ArrayList <Particulier> list3 = new ArrayList <> ();
		   
		   
	        String query = "SELECT * FROM particulier WHERE id="+id; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           while(rs1.next())
	           {
	               Particulier Particulier= new Particulier();
	               Particulier.setId(rs1.getInt("ID"));
	               Particulier.setNom(rs1.getString("nom"));
	               Particulier.setPrenom(rs1.getString("Prenom"));
	               Particulier.setEmail(rs1.getString("email"));
	               Particulier.setTelephone(rs1.getString("telephone"));
	               Particulier.setDescription(rs1.getString("description"));
	               Particulier.setAdresse(rs1.getString("adresse"));
	               Particulier.setStatus(rs1.getString("status"));
	               Particulier.setDate(rs1.getString("dateinscr"));

	        	   
	        	   
	        	   list3.add(Particulier);
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
