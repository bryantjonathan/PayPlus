<%@page import="models.User"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TransferPlus</title>
        <link rel="stylesheet" href="Search_Page.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="icon" href="Images\logoTab.png" type="image/icon type">
        <script src="https://unpkg.com/feather-icons"></script>
    </head>

    <body class="bg-gray-50">
        <div class="min-h-screen flex flex-col">
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
                <div class="sm:hidden hidden">
                    <nav class="px-2 pt-2 pb-3 space-y-1">
                        <a href="#"
                           class="block px-3 py-2 text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                        <a href="#"
                           class="block px-3 py-2 text-gray-600 hover:text-gray-800 transition-colors duration-200">Transfer</a>
                        <a href="#"
                           class="block px-3 py-2 text-gray-600 hover:text-gray-800 transition-colors duration-200">Savings</a>
                        <a href="#"
                           class="block px-3 py-2 text-gray-600 hover:text-gray-800 transition-colors duration-200">Income</a>
                        <a href="#"
                           class="block px-3 py-2 text-gray-600 hover:text-gray-800 transition-colors duration-200">Expenses</a>
                        <a href="#"
                           class="block px-3 py-2 text-gray-600 hover:text-gray-800 transition-colors duration-200">Reports</a>
                    </nav>
                </div>
            </header>

            <main class="flex-grow container mx-auto px-4 py-8 sm:px-6 lg:px-8">
                <h1 class="text-3xl font-bold mb-8 text-gray-800">Who do you want to transfer to?</h1>

                <!-- Search Section -->
                <div class="bg-white rounded-lg shadow-xs p-6 mb-8 hover:shadow-md transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-700 mb-4">Search for a Number</h2>
                    <form id="searchForm" class="flex items-center" action="Transfer?action=search" method="POST">
                        <div class="relative flex-grow">
                            <input type="text" id="searchInput" name="searchInput"
                                   class="w-full p-3 bg-gray-100 border border-gray-300 rounded-l-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   placeholder="Enter name or phone number" required>
                        </div>
                        <button type="submit"
                                class="p-3 bg-indigo-600 text-white rounded-r-md hover:bg-indigo-700 focus:outline-none">
                            Search
                        </button>
                    </form>
                    <p style="color: ${warna}"> ${alert}</p> 
                    <h4 style="color: green">${saldo}</h4>
                </div>

                <%
                    if (request.getAttribute("found") != null) {
                %>
                <!-- Transfer Section -->
                <div class="bg-white rounded-lg shadow-xs p-6 mb-8 hover:shadow-md transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-700 mb-4">Transfer</h2>
                    <form id="transferForm" class="space-y-4" action="Transfer?action=send&phone=<%= request.getAttribute("found")%>" method="POST">
                        <div>
                            <label for="amount" class="block text-sm font-medium text-gray-600">Send Amount</label>
                            <input type="number" id="amount" name="amount"
                                   class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   required>
                        </div>
                        <div>
                            <label for="transferType" class="block text-sm font-medium text-gray-600">Transfer Type</label>
                            <select id="transferType" name="transferType"
                                    class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                    required>
                                <option value="normal">Normal</option>
                                <option value="gift">Gift</option>
                            </select>
                        </div>
                        <div id="messageContainer" class="hidden">
                            <label for="message" class="block text-sm font-medium text-gray-600">Message</label>
                            <input type="text" id="message" name="message"
                                   class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        </div>
                        <button type="submit"
                                class="w-full p-3 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                            Send
                        </button>
                    </form>
                </div>
                <% }%>
            </main>
        </div>

        <script>
            // Show/hide the message field based on transfer type
            document.getElementById('transferType').addEventListener('change', function () {
                const messageContainer = document.getElementById('messageContainer');
                if (this.value === 'gift') {
                    messageContainer.classList.remove('hidden');
                } else {
                    messageContainer.classList.add('hidden');
                }
            });

            // Validate amount before submitting
            document.getElementById('transferForm').addEventListener('submit', function (event) {
                const amount = parseFloat(document.getElementById('amount').value);
                if (isNaN(amount) || amount <= 0) {
                    alert('Please enter a valid transfer amount.');
                    event.preventDefault(); // Prevent form submission
                }
            });
        </script>
    </body>

</html>
