<%-- 
    Document   : form
    Created on : Feb 26, 2024, 9:01:05 AM
    Author     : SamCro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="p-5">
            <h2 class="text-2xl font-bold mb-4">Add New Employee</h2>

            <form action="insertion" method="post">
                <div class="mb-4">
                    <label for="employeeId" class="block text-sm font-medium text-gray-700">ID:</label>
                    <input type="text" id="employeeId" name="employeeId" class="form-input mt-1 p-2 w-full border rounded-md">
                </div>

                <div class="mb-4">
                    <label for="employeeNom" class="block text-sm font-medium text-gray-700">Nom:</label>
                    <input type="text" id="employeeNom" name="employeeNom" class="form-input mt-1 p-2 w-full border rounded-md">
                </div>

                <div class="mb-4">
                    <label for="employeeSalaire" class="block text-sm font-medium text-gray-700">Salaire:</label>
                    <input type="text" id="employeeSalaire" name="employeeSalaire" class="form-input mt-1 p-2 w-full border rounded-md">
                </div>

                <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600">Add Employee</button>
                <a href="index.jsp" class="bg-yellow-500 text-white py-2 px-4 rounded-md hover:bg-yellow-600 ml-2">Go to Home Page</a>
            </form>
        </div>


    </body>
</html>
