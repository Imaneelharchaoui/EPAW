package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Beans.Particulier;

public class UpdateProfilPartDAO {

	 public int updateparticulier(Particulier particulier,String id ) throws ClassNotFoundException {
	        String UPDATE_USERS_SQL = "UPDATE particulier SET email=? , nom=?, prenom=?, adresse=?, telephone=? , description=? , motdepasse=? WHERE ID="+id;

	        int result = 0;
	        
	        
	      
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
	            preparedStatement.setString(1, particulier.getEmail());
	            preparedStatement.setString(2, particulier.getNom());
	            preparedStatement.setString(3, particulier.getPrenom());
	            preparedStatement.setString(4, particulier.getAdresse());
	            preparedStatement.setString(5, particulier.getTelephone());
	            preparedStatement.setString(6, particulier.getDescription());
	            preparedStatement.setString(7, particulier.getMotdepasse());

	            

	         

	            


	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return result;
	    }
	 public int updateparticulier1(Particulier particulier, String id ) throws ClassNotFoundException {
	        String UPDATE_USERS_SQL = "UPDATE particulier SET email=? , nom=?, prenom=? , adresse=? , telephone=? , description=?  WHERE id="+id;

	        int result = 0;
	        
	        
	      
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager
	            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
	            preparedStatement.setString(1, particulier.getEmail());
	            preparedStatement.setString(2, particulier.getNom());
	            preparedStatement.setString(3, particulier.getPrenom());
	            preparedStatement.setString(4, particulier.getAdresse());
	            preparedStatement.setString(5, particulier.getTelephone());
	            preparedStatement.setString(6, particulier.getDescription());

	            

	         

	            


	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
	        return result;
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
	    
	    public boolean findparticulier(String email, String id) throws ClassNotFoundException {
	    	String query1 = "SELECT * FROM particulier,assoc WHERE (particulier.email='"+email+"' AND NOT particulier.id='"+id+"') or assoc.email='"+email+"'"; 
	        Class.forName("com.mysql.jdbc.Driver");
	        int count=0;

	        try { Connection connection = DriverManager
	                .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

	               Statement st = connection.createStatement();
	            		
	               ResultSet rs1 = st.executeQuery(query1);
	               
	               while (rs1.next())
	               {
	                   count++;
	            	   
	               }
	                st.close();
	           }
	           catch (Exception e)
	           {
	             System.err.println("Got an exception! ");
	             System.err.println(e.getMessage());
	           }
	           	if (count==0) {
	           		
					return true;
				}
	           	else {
					return false;
				}
	        }

	
}
