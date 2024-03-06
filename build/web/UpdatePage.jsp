<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="connexion.DBConnection" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Update Employee</title>
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    </head>
    <body>

        <div class='p-5'>
            <h2>Update Employee</h2>

            <%
                // Retrieve employee ID from the request
                String employeeIdParam = request.getParameter("id");
                int employeeId = Integer.parseInt(employeeIdParam);

                try {
                    Connection connection = DBConnection.getConnection();
                    // Retrieve employee details from the database
                    String selectQuery = "SELECT id, nom, salaire FROM employee WHERE id = ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
                    preparedStatement.setInt(1, employeeId);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    // Display employee details in input fields
                    if (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String nom = resultSet.getString("nom");
                        double salaire = resultSet.getDouble("salaire");
            %>

            <form action='update' method='post' onsubmit="return confirm('Are you sure you want to update this employee?')">
                <div class='form-group'>
                    <label for='employeeId'>ID:</label>
                    <input type='text' class='form-control' id='employeeId' name='employeeId' value='<%= id %>' readonly>
                </div>

                <div class='form-group'>
                    <label for='employeeNom'>Nom:</label>
                    <input type='text' class='form-control' id='employeeNom' name='employeeNom' value='<%= nom %>'>
                </div>

                <div class='form-group'>
                    <label for='employeeSalaire'>Salaire:</label>
                    <input type='text' class='form-control' id='employeeSalaire' name='employeeSalaire' value='<%= salaire %>'>
                </div>

                <button type='submit' class='btn btn-primary'>Update Employee</button>
            </form>
        </div>

        <%
            } else {
                out.println("Employee not found.");
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch ( SQLException e) {
            out.println("Error: " + e.getMessage());
        }
        %>

    </body>
</html>
