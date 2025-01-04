<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="models.Savings" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add to Savings</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">
    <header class="bg-white shadow-sm sticky top-0 z-10">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center py-4">
                <div class="flex items-center">
                    <a href="Dashboard">
                        <img id="logo" src="Images\logo.png" alt="Logo" class="h-8">
                    </a>
                </div>
                <nav class="hidden sm:flex space-x-4">
                    <a href="Dashboard" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                    <a href="Income" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Incomes</a>
                    <a href="Expense" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Expenses</a>
                    <a href="#" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Reports</a>
                </nav>
            </div>
        </div>
    </header>
    
    <main class="container mx-auto px-4 py-8 sm:px-6 lg:px-8">
        <h1 class="text-3xl font-bold mb-8 text-gray-800">Add to Savings</h1>
        
        <%
            int savingId = Integer.parseInt(request.getParameter("id"));
            ArrayList<Savings> listTabungan = (ArrayList<Savings>) request.getSession().getAttribute("list");
            Savings savingToEdit = null;

            if (listTabungan != null) {
                for (Savings saving : listTabungan) {
                    if (saving.getId() == savingId) {
                        savingToEdit = saving;
                        break;
                    }
                }
            }

            if (savingToEdit != null) {
        %>
        <form method="POST" action="savings?action=update&id=<%= savingToEdit.getId() %>&amountnow=<%= savingToEdit.getTerkumpul() %>" class="bg-white p-6 rounded-lg shadow-md max-w-lg mx-auto">
            <div class="mb-4">
                <p class="text-sm font-medium text-gray-700">Name</p>
                <p class="text-lg font-semibold text-gray-800"><%= savingToEdit.getNama() %></p>
            </div>
            <div class="mb-4">
                <p class="text-sm font-medium text-gray-700">Description</p>
                <p class="text-gray-600"><%= savingToEdit.getDeskripsi() %></p>
            </div>
            <div class="mb-4">
                <p class="text-sm font-medium text-gray-600">Target</p>
                <p class="text-lg font-semibold text-gray-700">Rp <%= String.format("%,.0f", (double) savingToEdit.getTarget()) %></p>
            </div>
            <div class="mb-4">
                <p class="text-sm font-medium text-gray-700">Current Amount Collected</p>
                <p class="text-lg font-semibold text-green-600">Rp <%= String.format("%,.0f", (double) savingToEdit.getTerkumpul()) %></p>
            </div>
            <div class="mb-4">
                <label for="amount" class="block text-sm font-medium text-gray-700">Amount to Add (Rp)</label>
                <input name="amount" id="amount" type="number" step="0.01" class="mt-1 p-2 w-full border rounded-lg focus:ring-blue-500 focus:border-blue-500" required>
            </div>
            <button type="submit" class="w-full bg-green-500 text-white py-2 px-4 rounded shadow hover:bg-green-600">
                Add Amount
            </button>
        </form>
        <% 
            } else {
        %>
        <p class="text-center text-red-500">Saving not found.</p>
        <% } %>
    </main>
</body>

</html>
