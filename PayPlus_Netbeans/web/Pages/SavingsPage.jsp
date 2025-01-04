<%@page import="java.util.ArrayList"%>
<%@page import="models.Savings"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Savings Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body class="bg-gray-50">
        <header class="bg-white shadow-sm sticky top-0 z-10">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center py-4">
                    <div class="flex items-center">
                        <a href="DasboardPage.jsp">
                            <img id="logo" src="logo.png">
                        </a>
                    </div>
                    <nav class="hidden sm:flex space-x-4">
                        <a href="DasboardPage.jsp"
                           class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                        <a href="IncomePage.jsp"
                           class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Incomes</a>
                        <a href="ExpensePage.jsp"
                           class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Expenses</a>
                        <a href="#"
                           class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Reports</a>
                    </nav>
                </div>
            </div>
        </header>

        <main class="container mx-auto px-4 py-8 sm:px-6 lg:px-8">
            <h3 class=" font-bold mb-8 text-red-800">${alert}</h3>
            <h1 class="text-3xl font-bold mb-8 text-gray-800">Savings Page</h1>

            <!-- Summary -->
            <%
                // Retrieve the list of savings from session
                ArrayList<Savings> listTabungan = (ArrayList<Savings>) request.getSession().getAttribute("list");
                double totalTarget = 0;
                double totalCollected = 0;

                if (listTabungan != null) {
                    for (Savings saving : listTabungan) {
                        totalTarget += (double) saving.getTarget();
                        totalCollected += (double) saving.getTerkumpul();
                    }
                }
            %>
            <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
                <div class="flex items-center p-4 bg-white rounded-lg shadow">
                    <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M17.211 6.339A8 8 0 1 1 6.339 2.789a4.5 4.5 0 1 0 10.872 3.55Z"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Total Savings Target</p>
                        <p id="totalSavings" class="text-lg font-semibold text-gray-700">
                            Rp <%= String.format("%,.0f", totalTarget)%>
                        </p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow">
                    <div class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M17.211 6.339A8 8 0 1 1 6.339 2.789a4.5 4.5 0 1 0 10.872 3.55Z"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Savings Collected</p>
                        <p id="savingsCollected" class="text-lg font-semibold text-gray-700">
                            Rp <%= String.format("%,.0f", totalCollected)%>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Add Savings Button -->
            <a href="savings?m=add">
                <button id="addSavingsButton" class="mb-4 bg-blue-500 text-white px-4 py-2 rounded shadow hover:bg-blue-600">
                    Add Savings
                </button>
            </a>

            <!-- Savings List -->
            <div id="savingsContainer" class="grid gap-6 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
                <%
                    ArrayList<Savings> saves = (ArrayList<Savings>) request.getSession().getAttribute("list");
                    for (Savings s : saves) {
                %>
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h3 class="text-xl font-semibold text-gray-800 mb-2"><%= s.getNama()%></h3>
                    <p class="text-gray-600 mb-4"><%= s.getDeskripsi()%></p>
                    <div class="mb-2">
                        <p class="text-sm font-medium text-gray-500">Target</p>
                        <p class="text-lg font-semibold text-gray-700">Rp <%= String.format("%,.0f", (double) s.getTarget())%></p>
                    </div>
                    <div class="mb-2">
                        <p class="text-sm font-medium text-gray-500">Amount Collected</p>
                        <p class="text-lg font-semibold text-green-600">Rp <%= s.getTerkumpul()%></p>
                    </div>
                    <% if (s.getTarget() != s.getTerkumpul() && s.getTarget() > s.getTerkumpul()) { %>
                    <a href="savings?m=addtosavings&id=<%= s.getId()%>">
                        <button class="mt-4 bg-green-500 text-white px-4 py-2 rounded shadow hover:bg-green-600">
                            Add to Savings
                        </button>
                    </a>
                    <a href="savings?m=delete&id=<%= s.getId()%>">
                        <button class="mt-4 bg-red-500 text-white px-4 py-2 rounded shadow hover:bg-red-700">
                            Delete
                        </button>
                    </a>
                    <% } else { %>
                    <p class="text-lg font-semibold text-green-600">Target achieved!</p>
                    <a href="savings?m=delete&id=<%= s.getId()%>">
                        <button class="mt-4 bg-red-500 text-white px-4 py-2 rounded shadow hover:bg-red-700">
                            Delete
                        </button>
                    </a>
                    <% } %>
                </div>
                <%
                    }
                %>
            </div>
        </main>
    </body>

</html>
