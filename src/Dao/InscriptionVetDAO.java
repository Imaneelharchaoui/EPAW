package Dao;

import java.sql.*;

import Beans.Veterinaire;

public class InscriptionVetDAO {

    public int ajoutveterinaire(Veterinaire veterinaire ) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO VETERINAIRE" +
            "  (EMAIL,NOM,AUTORISATION,ADRESSE,TELEPHONE,DESCRIPTION, MOTDEPASSE,DATEINSCR) VALUES " +
            " (?, ?,?, ?, ?, ?,?,NOW());";

        int result = 0;
        
        
      
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, veterinaire.getEmail());
            preparedStatement.setString(2, veterinaire.getNom());
            preparedStatement.setString(3, veterinaire.getAutorisation());
            preparedStatement.setString(4, veterinaire.getAdresse());
            preparedStatement.setString(5, veterinaire.getTelephone());
            preparedStatement.setString(6, veterinaire.getDescription());
            preparedStatement.setString(7, veterinaire.getMotdepasse());

            

         

            


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
    public boolean findveterinaire(String email) throws ClassNotFoundException {
    	String query1 = "SELECT * FROM particulier,assoc,veterinaire WHERE particulier.email='"+email+"' or assoc.email='"+email+"'  or veterinaire.email='"+email+"'"; 
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
    
