<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, models.IncomeRecord, models.User"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Income Overview - PayPlus</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="icon" href="Images\logoTab.png" type="image/icon">
        <link rel="stylesheet" href="IncomePage.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .income-card {
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
                        <a href="Dashboard"
                           class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                        <a href="Expense"
                           class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Expenses</a>
                        <a href="#" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Reports</a>
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
                ArrayList<ArrayList<Object>> dataIncome = (ArrayList<ArrayList<Object>>) request.getAttribute("dataIncome");
                ArrayList<Object> p = dataIncome.get(0);
            %>
            <h1 class="text-3xl font-bold mb-8 text-gray-800">Income Overview</h1>

            <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd"
                              d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2-2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                              clip-rule="evenodd"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Total Income</p>
                        <p id="totalIncome" class="text-lg font-semibold text-gray-700">Rp. <%=p.get(0)%></p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path
                            d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z">
                        </path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Total Transactions</p>
                        <p id="totalTransactions" class="text-lg font-semibold text-gray-700"><%=p.get(1)%></p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-purple-500 bg-purple-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Normal Income</p>
                        <p id="normalIncome" class="text-lg font-semibold text-gray-700">Rp. <%=p.get(2)%></p>
                    </div>
                </div>
                <div class="flex items-center p-4 bg-white rounded-lg shadow-xs">
                    <div class="p-3 mr-4 text-pink-500 bg-pink-100 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd"
                              d="M5 5a3 3 0 015-2.236A3 3 0 0114.83 6H16a2 2 0 110 4h-5V9a1 1 0 10-2 0v1H4a2 2 0 110-4h1.17C5.06 5.687 5 5.35 5 5zm4 1V5a1 1 0 10-1 1h1zm3 0a1 1 0 10-1-1v1h1z"
                              clip-rule="evenodd"></path>
                        <path d="M9 11H3v5a2 2 0 002 2h4v-7zM11 18h4a2 2 0 002-2v-5h-6v7z"></path>
                        </svg>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Gift Income</p>
                        <p id="giftIncome" class="text-lg font-semibold text-gray-700">Rp. <%=p.get(3)%></p>
                    </div>
                </div>
            </div>

            <div class="mb-8 bg-white rounded-lg shadow-xs p-4 flex flex-col items-center">
                <h2 class="text-xl font-semibold text-gray-700 mb-4">Income Distribution</h2>
                <div style="width: 300px; height: 150px;">
                    <canvas id="incomeChart"></canvas>
                </div>
            </div>

            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Recent Transactions</h2>
                <div class="space-x-2">
                    <a href="Income" id="allFilter"
                       class="filter-btn <%= request.getParameter("filter") == null ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">All</a>
                    <a href="Income?filter=normal" id="normalFilter"
                       class="filter-btn <%= "normal".equals(request.getParameter("filter")) ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">Normal</a>
                    <a href="Income?filter=gift" id="giftFilter"
                       class="filter-btn <%= "gift".equals(request.getParameter("filter")) ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">Gift</a>
                    <a href="Income?filter=topup" id="topupFilter"
                       class="filter-btn <%= "topup".equals(request.getParameter("filter")) ? "bg-blue-500 text-white" : "bg-gray-200 text-white-700"%> px-4 py-2 rounded-md transition-all duration-300 hover:bg-blue-500 hover:text-white">TopUp</a>
                </div>

            </div>
            <div id="incomeCards" class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                <%
                    ArrayList<IncomeRecord> incomes = (ArrayList<IncomeRecord>) request.getAttribute("IncomeList");
                    if (incomes != null && !incomes.isEmpty()) {
                        User user = new User();
                        for (IncomeRecord income : incomes) {
                            user = user.find(income.getSenderPhone().toString());
                %>
                <div class="bg-white shadow rounded-lg overflow-hidden transition-all duration-300 hover:shadow-lg income-card">
                    <div class="p-6">
                        <div class="flex justify-between items-center mb-4">
                            <span class="text-2xl font-bold text-gray-800">Rp. <%= income.getAmount()%></span>
                            <span class="text-sm font-medium text-gray-500"><%= income.getDate()%></span>
                        </div>
                        <div class="space-y-2">
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-600">Sender:</span>
                                <span class="font-medium text-gray-800"><%= user.getName() %></span>
                            </div>
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-600">Type:</span>
                                <span class="font-medium <%= income.getType().equals("gift") ? "text-purple-600" : "text-blue-600"%>">
                                    <%= income.getType().substring(0, 1).toUpperCase() + income.getType().substring(1)%>
                                </span>
                            </div>
                            <% if ("gift".equals(income.getType()) && income.getMessage() != null) {%>
                            <div class="mt-4">
                                <span class="text-sm text-gray-600">Message:</span>
                                <p class="mt-1 text-sm text-gray-800"><%= income.getMessage()%></p>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <a href="IncomePage.jsp"></a>
                </div>
                <% }
    } else { %>
                <p>No income records found.</p>
                <% } %>
            </div>

        </main>
    </body>
    <%
        // Data untuk grafik
        int normalIncome = 0;
        int giftIncome = 0;

        if (incomes != null) {
            for (IncomeRecord income : incomes) {
                if ("normal".equalsIgnoreCase(income.getType())) {
                    normalIncome += income.getAmount();
                } else if ("gift".equalsIgnoreCase(income.getType())) {
                    giftIncome += income.getAmount();
                }
            }
        }
    %>
    <script>
        function updateIncomeChart(normalIncome, giftIncome) {
            const ctx = document.getElementById('incomeChart').getContext('2d');

            if (window.incomeChart instanceof Chart) {
                window.incomeChart.destroy();
            }

            window.incomeChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Normal Income', 'Gift Income'],
                    datasets: [{
                            data: [normalIncome, giftIncome],
                            backgroundColor: ['#3B82F6', '#8B5CF6'],
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

        // Panggil fungsi updateIncomeChart dengan nilai dari backend
     updateIncomeChart(<%= normalIncome%>, <%= giftIncome%>);
    </script>
</html>
