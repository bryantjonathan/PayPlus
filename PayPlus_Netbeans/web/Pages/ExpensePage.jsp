<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, models.ExpenseRecord, models.User"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Expense Overview - PayPlus</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="icon" href="Images\logoTab.png" type="image/icon">
        <link rel="stylesheet" href="ExpensePage.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .expense-card {
                opacity: 0;
                transform: translateY(20px);
                animation: fadeInUp 0.3s ease forwards;
            }

            @keyframes fadeInUp {
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .filter-btn {
                transition: background-color 0.3s, color 0.3s;
            }
        </style>
    </head>

    <body class="bg-gray-50">
        <header class="bg-white shadow-sm sticky top-0 z-10">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center py-4">
                    <div class="flex items-center">
                        <a href="Dashboard">
                            <img id="logo" src="Images\logo.png">
                        </a>
                    </div>
                    <nav class="hidden sm:flex space-x-4">
                        <a href="Dashboard" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                        <a href="Transfer" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Transfer</a>
                        <a href="savings" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Savings</a>
                        <a href="bill" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Bills</a>
                        
                        <a href="Income" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Income</a>
                    </nav>
                    <div class="sm:hidden">
                        <button id="menuToggle" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">
                            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4 6h16M4 12h16M4 18h16" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </header>

        <main class="container mx-auto px-4 py-8 sm:px-6 lg:px-8">
            <%
                ArrayList<ArrayList<Object>> dataExpense = (ArrayList<ArrayList<Object>>) request.getAttribute("dataExpense");
                ArrayList<Object> p = dataExpense.get(0);
            %>
            <h1 class="text-3xl font-bold mb-8 text-gray-800">Expense Overview</h1>

            <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-red-500 bg-red-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="1 1 22 22">
                        <path fill-rule="evenodd" d="M7 6a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2h-2v-4a3 3 0 0 0-3-3H7V6Z" clip-rule="evenodd"/>
                        <path fill-rule="evenodd" d="M2 11a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-7Zm7.5 1a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5Z" clip-rule="evenodd"/>
                        <path d="M10.5 14.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"/>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Total Expense</p>
                        <p id="totalExpense" class="text-lg font-semibold text-gray-700">Rp. <%= p.get(0) == null ? 0 : String.format("%,.0f",p.get(0)) %></p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-purple-500 bg-purple-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path
                            d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z">
                        </path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Total Transactions</p>
                        <p id="totalTransactions" class="text-lg font-semibold text-gray-700"><%= p.get(1)%></p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 23">
                        <path d="M5.617 2.076a1 1 0 0 1 1.09.217L8 3.586l1.293-1.293a1 1 0 0 1 1.414 0L12 
                              3.586l1.293-1.293a1 1 0 0 1 1.414 0L16 3.586l1.293-1.293A1 1 0 0 1 19 3v18a1 1 0 0 
                              1-1.707.707L16 20.414l-1.293 1.293a1 1 0 0 1-1.414 0L12 20.414l-1.293 1.293a1 1 0 0 
                              1-1.414 0L8 20.414l-1.293 1.293A1 1 0 0 1 5 21V3a1 1 0 0 1 .617-.924ZM9 7a1 1 0 0 0 0 
                              2h6a1 1 0 1 0 0-2H9Zm0 4a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H9Zm0 4a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H9Z"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Normal Expense</p>
                        <p id="normalExpense" class="text-lg font-semibold text-gray-700">Rp. <%= p.get(2) == null ? 0 : String.format("%,.0f",p.get(2)) %></p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd"
                              d="M5 5a3 3 0 015-2.236A3 3 0 0114.83 6H16a2 2 0 110 4h-5V9a1 1 0 10-2 0v1H4a2 2 0 110-4h1.17C5.06 5.687 5 5.35 5 5zm4 1V5a1 1 0 10-1 1h1zm3 0a1 1 0 10-1-1v1h1z"
                              clip-rule="evenodd"></path>
                        <path d="M9 11H3v5a2 2 0 002 2h4v-7zM11 18h4a2 2 0 002-2v-5h-6v7z"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Gift Expense</p>
                        <p id="giftExpense" class="text-lg font-semibold text-gray-700">Rp. <%= p.get(3) == null ? 0 : String.format("%,.0f",p.get(3)) %></p>
                    </div>
                </div>
            </div>

            <div class="mb-8 bg-white rounded-lg shadow-xs p-4 flex flex-col items-center">
                <h2 class="text-xl font-semibold text-gray-700 mb-4">Expense Distribution</h2>
                <div style="width: 300px; height: 150px;">
                    <canvas id="expenseChart"></canvas>
                </div>
            </div>

            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Recent Transactions</h2>
                <div class="space-x-2">
                    <a href="Expense" id="allFilter"
                       class="filter-btn <%= request.getParameter("filter") == null ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">All</a>
                    <a href="Expense?filter=normal" id="normalFilter"
                       class="filter-btn <%= "normal".equals(request.getParameter("filter")) ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">Normal</a>
                    <a href="Expense?filter=gift" id="giftFilter"
                       class="filter-btn <%= "gift".equals(request.getParameter("filter")) ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">Gift</a>
                </div>
            </div>

            <div id="expenseCards" class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                <%
                    ArrayList<ExpenseRecord> expenses = (ArrayList<ExpenseRecord>) request.getAttribute("expenseList");
                    if (expenses != null && !expenses.isEmpty()) {
                        User user = new User();
                        for (ExpenseRecord expense : expenses) {
                            user = user.find(expense.getReceiverPhone().toString());
                %>
                <div class="bg-white shadow rounded-lg overflow-hidden transition-all duration-300 hover:shadow-lg income-card">
                    <div class="p-6">
                        <div class="flex justify-between items-center mb-4">
                            <span class="text-2xl font-bold text-gray-800">Rp. <%= String.format("%,.0f", (double) expense.getAmount())%></span>
                            <span class="text-sm font-medium text-gray-500"><%= expense.getDate()%></span>
                        </div>
                        <div class="space-y-2">
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-600">Receiver:</span>
                                <span class="font-medium text-gray-800"><%= user.getName() %></span>
                            </div>
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-600">Type:</span>
                                <span class="font-medium <%= expense.getType().equals("gift") ? "text-green-600" : "text-blue-600"%>">
                                    <%= expense.getType().substring(0, 1).toUpperCase() + expense.getType().substring(1)%>
                                </span>
                            </div>
                            <% if ("gift".equals(expense.getType()) && expense.getMessage() != null) {%>
                            <div class="mt-4">
                                <span class="text-sm text-gray-600">Message:</span>
                                <p class="mt-1 text-sm text-gray-800"><%= expense.getMessage()%></p>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
                <% }
            } else { %>
                <p>No expense records found.</p>
                <% } %>
            </div>
        </main>
    </body>
    <%
        int normalExpense = 0;
        int giftExpense = 0;

        if (expenses != null) {
            for (ExpenseRecord expense : expenses) {
                if ("normal".equalsIgnoreCase(expense.getType())) {
                    normalExpense += expense.getAmount();
                } else if ("gift".equalsIgnoreCase(expense.getType())) {
                    giftExpense += expense.getAmount();
                }
            }
        }
    %>
    <script>
        function updateExpenseChart(normalExpense, giftExpense) {
            const ctx = document.getElementById('expenseChart').getContext('2d');

            if (window.expenseChart instanceof Chart) {
                window.expenseChart.destroy();
            }

            window.expenseChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Normal Expense', 'Gift Expense'],
                    datasets: [{
                            data: [normalExpense, giftExpense],
                            backgroundColor: ['#3B82F6', '#2ECC71'],
                            hoverOffset: 4
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                boxWidth: 12,
                                padding: 10
                            }
                        }
                    }
                }
            });
        }

        updateExpenseChart(<%= normalExpense%>, <%= giftExpense%>);
    </script>
</html>
