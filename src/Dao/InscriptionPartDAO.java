package Dao;

import java.sql.*;

import Beans.Particulier;

public class InscriptionPartDAO {

    public int ajoutparticulier(Particulier particulier ) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO Particulier " +
            "  ( EMAIL,NOM,PRENOM,ADRESSE,TELEPHONE,DESCRIPTION, MOTDEPASSE,status,DATEINSCR) VALUES " +
            " (?, ?, ?, ?, ?,?,?,0,NOW());";

        int result = 0;
        
        
      
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
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
    public boolean findparticulier(String email) throws ClassNotFoundException {
    	String query1 = "SELECT * FROM particulier,assoc WHERE particulier.email='"+email+"' or assoc.email='"+email+"'"; 
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
    
