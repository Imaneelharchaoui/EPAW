package Dao;

import java.sql.*;
import java.util.ArrayList;

import Beans.Animal;

public class AnimalsDAO {

    public ArrayList<Animal> getAnimal() throws ClassNotFoundException {
        String query = "SELECT * FROM annonces WHERE status = 0"; 

        ArrayList <Animal> list = new ArrayList <> ();
        

        Class.forName("com.mysql.jdbc.Driver");

       try { Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

           Statement st = connection.createStatement();
        		
           ResultSet rs = st.executeQuery(query);
           
           while (rs.next())
           {
               Animal animal=new Animal();

        	   animal.setId(rs.getInt("ID")) ;
        	   animal.setEspece(rs.getString("ESPECE"));
        	   animal.setRace(rs.getString("RACE"));
        	   animal.setSexe(rs.getString("SEXE"));
        	   animal.setAge(rs.getString("AGE"));
        	   animal.setHandicap(rs.getString("HANDICAP"));
        	   animal.setVaccin(rs.getString("VACCIN"));
        	   animal.setCs(rs.getString("CS"));
        	   animal.setImage(rs.getString("IMAGE"));
        	   animal.setDesc(rs.getString("Description"));
        	   animal.setDate(rs.getString("dateInscription"));
        	   animal.setEmail(rs.getString("email"));

        	   
        	   list.add(animal);
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