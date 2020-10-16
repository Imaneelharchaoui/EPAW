package Dao;

import java.sql.*;

import Beans.Offre;

public class AjoutOffreDAO {

    public int ajoutOffre(Offre offre) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO offresvet" +
            "  ( TYPE,TARIFICATION,DESCRIPTION,date,email,telephone) VALUES " +
            " (?, ?, ?,NOW(),?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, offre.getType());
            preparedStatement.setString(2, offre.getTarification());
            preparedStatement.setString(3, offre.getDescription());
            preparedStatement.setString(4, offre.getEmail());
            preparedStatement.setString(5, offre.getTelephone());
           


            


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
}