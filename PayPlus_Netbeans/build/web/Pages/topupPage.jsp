<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.User"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Income Overview - PayPlus</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="icon" href="Images/logoTab.png" type="image/icon">
        <link rel="stylesheet" href="IncomePage.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>

    <body class="bg-gray-50">
        <header class="bg-white shadow-sm sticky top-0 z-10">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center py-4">
                    <div class="flex items-center">
                        <a href="Dashboard">
                            <img id="logo" src="Images/logo.png" alt="PayPlus Logo">
                        </a>
                    </div>
                    <nav class="hidden sm:flex space-x-4">
                        <a href="Dashboard" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                        <a href="Transfer" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Transfer</a>
                        <a href="savings" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Savings</a>
                        <a href="bill" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Bills</a>
                        <a href="Expense" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Expenses</a>
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

        <main class="flex items-center justify-center min-h-[calc(100vh-64px)]">
            <div class="bg-white rounded-lg shadow-xs p-6 hover:shadow-md transition-shadow duration-300 max-w-sm w-full">
                <h2 class="text-xl font-semibold text-gray-700 mb-4 text-center">How much do you want to top up?</h2>
                <form id="searchForm" class="flex flex-col items-center" action="User?action=topup" method="POST">
                    <div class="relative w-full mb-4">
                        <input type="text" id="topup" name="topup"
                               class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                               placeholder="Input Amount" required>
                    </div>
                    <button type="submit"
                            class="p-3 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none w-full">
                        Confirm
                    </button>
                </form>
                <h4 class="text-green-500 mt-4 text-center">${saldo}</h4>
            </div>
        </main>
    </body>

</html>

