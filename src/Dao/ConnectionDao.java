package Dao;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import com.sun.crypto.provider.RSACipher;



public class ConnectionDao{
    public Map<String, String> connection(String email) throws ClassNotFoundException {
    String query = "SELECT * FROM assoc WHERE email ='"+email+"'"; 

    
    Class.forName("com.mysql.jdbc.Driver");
    Map<String, String> login = new HashMap<String, String>();

    try { Connection connection = DriverManager
         .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

        Statement st = connection.createStatement();

       if(  st.executeQuery(query) != null) {
    	   ResultSet rs =st.executeQuery(query);
        while (rs.next())
        {

        login.put("email", rs.getString("email"));
        login.put("motdepasse", rs.getString("motdepasse"));
        login.put("nom", rs.getString("nom"));
        login.put("TYPE","Assoc");
        login.put("Status",rs.getString("Status"));

        }
    }
           

       
    }
		    catch (SQLException e) {
		        // process sql exception
		        printSQLException(e);
		    }

    
    
	return login;

    }
    
    public Map<String, String> connectionparticulier(String email) throws ClassNotFoundException {
        String query = "SELECT * FROM particulier WHERE email ='"+email+"'"; 
        
        Class.forName("com.mysql.jdbc.Driver");
        Map<String, String> login = new HashMap<String, String>();

        try { Connection connection = DriverManager
             .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

            Statement st1 = connection.createStatement();
         		
            ResultSet rs1 = st1.executeQuery(query);
            while (rs1.next())
            {
            login.put("email", rs1.getString("email"));
            login.put("motdepasse", rs1.getString("motdepasse"));
            login.put("nom", rs1.getString("nom"));
            login.put("TYPE","Part");
            login.put("id", rs1.getString("id"));
            login.put("prenom", rs1.getString("PRENOM"));
            login.put("tel", rs1.getString("telephone"));
            login.put("description", rs1.getString("description"));
            login.put("adresse", rs1.getString("adresse"));

            login.put("Status",rs1.getString("Status"));


            }
        }
    		    catch (SQLException e) {
    		        // process sql exception
    		        printSQLException(e);
    		    }

        
        
    	return login;

        }

    public Map<String, String> connectionVeterinaire(String email) throws ClassNotFoundException {
        String query = "SELECT nom,email,motdepasse,status,telephone FROM veterinaire WHERE email ='"+email+"'"; 
        
        Class.forName("com.mysql.jdbc.Driver");
        Map<String, String> login = new HashMap<String, String>();

        try { Connection connection = DriverManager
             .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

            Statement st2 = connection.createStatement();
         		
            ResultSet rs2 = st2.executeQuery(query);
            while (rs2.next())
            {
            login.put("email", rs2.getString("email"));
            login.put("motdepasse", rs2.getString("motdepasse"));
            login.put("nom", rs2.getString("nom"));
            login.put("TYPE","Vet");
            login.put("Status",rs2.getString("Status"));
            login.put("Telephone",rs2.getString("telephone"));



            }
        }
    		    catch (SQLException e) {
    		        // process sql exception
    		        printSQLException(e);
    		    }

        
        
    	return login;

        }

private void printSQLException(SQLException ex) {
    for (Throwable e: ex) {
        if (e instanceof SQLException) {
            e.printStackTrace(System.err);
            System.err.println("SQLState: " + ((SQLException) e).getSQLState());
            System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
            System.err.println("Message: " + e.getMessage());
            Throwable t = ex.getCause();
            while (t != null) {
                System.out.println("Cause: " + t);
                t = t.getCause();
            }
        }
    }
}
}
