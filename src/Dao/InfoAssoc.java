package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Beans.Association;

public class InfoAssoc {

	 public ArrayList<String> getemail() throws ClassNotFoundException {
	        String query = "SELECT email FROM annonces "; 

	        ArrayList <String> list1 = new ArrayList <> ();
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st = connection.createStatement();
	        		
	           ResultSet rs = st.executeQuery(query);
	           
	           while (rs.next())
	           {
	               String email1= rs.getString("EMAIL");

	        	   
	        	   
	        	   list1.add(email1);
	           }
	            st.close();
	       }
	       catch (Exception e)
	       {
	         System.err.println("Got an exception! ");
	         System.err.println(e.getMessage());
	       }
	       	return list1;
	    }
	 public ArrayList<Association> getassociation() throws ClassNotFoundException {
		   ArrayList<String> emails= getemail();
		   ArrayList <Association> list1 = new ArrayList <> ();
		   
		   for(int i=0;i<emails.size();i++) {
			   String email=emails.get(i);
	        String query = "SELECT * FROM assoc where email='"+email+"'"; 

	        
	        

	        Class.forName("com.mysql.jdbc.Driver");

	       try { Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	           Statement st1 = connection.createStatement();
	        		
	           ResultSet rs1 = st1.executeQuery(query);
	           
	           if (rs1.next())
	           {
	               Association association= new Association();
	               association.setId(rs1.getInt("ID"));
	               association.setNom(rs1.getString("nom"));
	               association.setDomaine(rs1.getString("domaine"));
	               association.setEmail(rs1.getString("email"));
	               association.setTelephone(rs1.getString("telephone"));
	               association.setLocalisation(rs1.getString("Localisation"));
	               association.setDate(rs1.getString("dateinscription"));

	        	   
	        	   
	        	   list1.add(association);
	           }
	            st1.close();
	       }
	       catch (Exception e)
	       {
	         System.err.println("Got an exception! ");
	         System.err.println(e.getMessage());
	       }
		   }
	       	return list1;
	    }
	    
	
	
	
}
