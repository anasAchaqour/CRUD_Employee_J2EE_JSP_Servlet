<%@ page import="java.sql.*" %>
<%@ page import="connexion.DBConnection" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee List</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="p-5">
        <div class="container mx-auto">
            <h1 class="text-2xl font-bold mb-4">Employee List</h1>

            <a href='add.jsp' class="text-blue-600 hover:text-blue-800">Add New Employee</a>

            <table class="min-w-full bg-white border border-gray-300 rounded-md mt-6">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="py-2 px-4 border-b">ID</th>
                        <th class="py-2 px-4 border-b">Name</th>
                        <th class="py-2 px-4 border-b">Salary</th>
                        <th class="py-2 px-4 border-b">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-center">

                    <%
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        Connection connection = DBConnection.getConnection();

        String sqlQuery = "SELECT id, nom, salaire FROM employee";
        preparedStatement = connection.prepareStatement(sqlQuery);
        resultSet = preparedStatement.executeQuery();

        // Displaying results
        while (resultSet.next()) {
                    %>
                    <tr class="border-b">
                        <td class="py-2 px-4"><%= resultSet.getInt("id") %></td>
                        <td class="py-2 px-4"><%= resultSet.getString("nom") %></td>
                        <td class="py-2 px-4"><%= resultSet.getDouble("salaire") %></td>
                        <td class="py-2 px-4">
                            <a href='delete?id=<%= resultSet.getInt("id") %>' class="text-red-600 hover:text-red-800" onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>
                            <a href='UpdatePage.jsp?id=<%= resultSet.getInt("id") %>' class="ml-2 text-blue-600 hover:text-blue-800">Edit</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources in a finally block
                            try {
                                if (resultSet != null) resultSet.close();
                                if (preparedStatement != null) preparedStatement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
