package Dao;

import java.sql.*;

import Beans.Annonces;

public class AnnoncesDAO {

    public int ajoutAnnonce(Annonces annonce) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO annonces" +
            "  ( ESPECE,RACE, SEXE, AGE, HANDICAP, VACCIN, CS,IMAGE,dateInscription,email,Description) VALUES " +
            " (?, ?, ?, ?, ?,?,?,?,NOW(),?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/epaw?useSSL=false", "root", "0000");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, annonce.getEspece());
            preparedStatement.setString(2, annonce.getRace());
            preparedStatement.setString(3, annonce.getSexe());
            preparedStatement.setString(4, annonce.getAge());
            preparedStatement.setString(5, annonce.getHandicap());
            preparedStatement.setString(6, annonce.getVaccin());
            preparedStatement.setString(7, annonce.getCs());
            preparedStatement.setString(8, annonce.getImage());
            preparedStatement.setString(9, annonce.getEmail());
            preparedStatement.setString(10, annonce.getDesc());



            


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