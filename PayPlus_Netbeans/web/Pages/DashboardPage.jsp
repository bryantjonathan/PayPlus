<%-- 
    Document   : DashboardPage
    Created on : Dec 19, 2024, 11:40:35 AM
    Author     : fauss
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PayPlus</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="icon" href="Images/logoTab.png" type="image/icon">
        <script src="https://unpkg.com/feather-icons"></script>
        <link rel="stylesheet" href="DasboardPage.css">
        <style>
            /* Custom styles for dropdown */
            .dropdown {
                display: none;
                position: absolute;
                right: 0;
                top: 100%;
                z-index: 10;
            }

            .dropdown.show {
                display: block;
            }
            body {
                font-family: 'Inter', sans-serif;
            }
            .balance-card {
                background: linear-gradient(135deg, #4F46E5 0%, #7C3AED 100%);
            }
        </style>
    </head>

    <body class="bg-gray-50">
        <div class="min-h-screen flex flex-col">
            <header class="bg-white shadow-sm sticky top-0 z-10">
                <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                    <div class="flex justify-between items-center py-4">
                        <div class="flex items-center">
                            <a href="Dashboard">
                                <img id="logo" src="Images\logo.png">
                            </a>
                        </div>
                        <div class="flex items-center space-x-4">
                            <div class="relative">
                                <img id="profilePhoto" src="https://i.pravatar.cc/40?img=68" alt="Profile"
                                     class="w-10 h-10 rounded-full border-2 border-indigo-500 cursor-pointer">
                                <div
                                    class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 rounded-full border-2 border-white">
                                </div>
                                <div id="profileDropdown"
                                     class="dropdown absolute right-0 mt-2 w-48 bg-white rounded-md overflow-hidden shadow-xl z-10">
                                    <div class="px-4 py-2 border-b">
                                        <p class="text-sm font-medium text-gray-900">Fausta Akbar</p>
                                        <p class="text-xs text-gray-500">Account #: 1234567890</p>
                                        <p class="text-xs font-medium text-yellow-500">Gold Member</p>
                                    </div>
                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Account
                                        Settings</a>
                                    <a href="User?menu=logout"
                                       class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <main class="flex-grow container mx-auto px-4 py-8 sm:px-6 lg:px-8">
                <%
                    ArrayList<ArrayList<Object>> dataExpense = (ArrayList<ArrayList<Object>>) request.getAttribute("dataExpense");
                    ArrayList<Object> expense = dataExpense.get(0);

                    ArrayList<ArrayList<Object>> dataIncome = (ArrayList<ArrayList<Object>>) request.getAttribute("dataIncome");
                    ArrayList<Object> income = dataIncome.get(0);

                %>
                <h1 class="text-3xl font-bold mb-8 text-gray-800">Welcome back, <%= request.getSession().getAttribute("currName")%>!</h1>

                <!-- Balance Card -->
                <div class="balance-card rounded-xl p-6 mb-8 text-white">
                    <div class="flex justify-between items-start mb-4">
                        <div>
                            <p class="text-sm opacity-90">Available Balance</p>
                            <h2 class="text-3xl font-bold mt-1">Rp. <%= request.getSession().getAttribute("currBalance")%></h2>
                        </div>
                        <a href="User?menu=topup">
                            <button id="topupButton" class="bg-white text-indigo-600 px-4 py-2 rounded-lg font-medium hover:bg-opacity-90 transition-colors">
                                Top Up
                            </button>
                        </a>
                    </div>
                    <div class="flex items-center space-x-4">
                        <div class="flex items-center">
                            <i data-feather="arrow-up-right" class="w-4 h-4 mr-1"></i>
                            <span class="text-sm">Income: Rp <%= income.get(0)%></span>
                        </div>
                        <div class="flex items-center">
                            <i data-feather="arrow-down-left" class="w-4 h-4 mr-1"></i>
                            <span class="text-sm">Expense: Rp <%= expense.get(0)%></span>
                        </div>
                    </div>
                </div>


                <div class="grid gap-6 mb-8 md:grid-cols-2">
                <div
                    class="flex items-center p-4 bg-white rounded-lg shadow-xs hover:shadow-md transition-shadow duration-300">
                    <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full">
                        <i data-feather="dollar-sign"></i>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Total Savings</p>
                        <p class="text-lg font-semibold text-gray-700">Rp 15,000.00</p>
                    </div>
                </div>
                <div
                    class="flex items-center p-4 bg-white rounded-lg shadow-xs hover:shadow-md transition-shadow duration-300">
                    <div class="p-3 mr-4 text-yellow-500 bg-yellow-100 rounded-full">
                        <i data-feather="credit-card"></i>
                    </div>
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-600">Pending Bills</p>
                        <p class="text-lg font-semibold text-gray-700">Rp 1,330.00</p>
                    </div>
                </div>
            </div>

                <div class="grid gap-6 mb-8 md:grid-cols-2">
                    <a href="Income"
                       class="block p-6 bg-white rounded-lg shadow-xs hover:shadow-md transition-shadow duration-300">
                        <div class="flex items-center justify-between mb-4">
                            <h2 class="text-xl font-semibold text-gray-700">Income Records</h2>
                            <i data-feather="chevron-right" class="text-gray-500"></i>
                        </div>
                        <p class="text-gray-600">View detailed income history and analytics</p>
                    </a>
                    <a href="Expense"
                       class="block p-6 bg-white rounded-lg shadow-xs hover:shadow-md transition-shadow duration-300">
                        <div class="flex items-center justify-between mb-4">
                            <h2 class="text-xl font-semibold text-gray-700">Expense Records</h2>
                            <i data-feather="chevron-right" class="text-gray-500"></i>
                        </div>
                        <p class="text-gray-600">Track your spending patterns and categories</p>
                    </a>
                </div>

                <div class="grid gap-6 mb-8 md:grid-cols-2">

                    <div class="bg-white rounded-lg shadow-xs p-6 hover:shadow-md transition-shadow duration-300">
                        <h2 class="text-xl font-semibold text-gray-700 mb-4">Upcoming Bills</h2>
                        <ul class="space-y-3">
                            <li class="flex justify-between items-center">
                                <div class="flex items-center">
                                    <i data-feather="home" class="mr-3 text-gray-500"></i>
                                    <span class="text-gray-700">Rent</span>
                                </div>
                                <div class="text-right">
                                    <p class="text-gray-700 font-semibold">Rp 1,200.00</p>
                                    <p class="text-sm text-gray-500">Due on Jul 1, 2023</p>
                                </div>
                            </li>
                            <li class="flex justify-between items-center">
                                <div class="flex items-center">
                                    <i data-feather="zap" class="mr-3 text-gray-500"></i>
                                    <span class="text-gray-700">Electricity</span>
                                </div>
                                <div class="text-right">
                                    <p class="text-gray-700 font-semibold">Rp 80.00</p>
                                    <p class="text-sm text-gray-500">Due on Jul 15, 2023</p>
                                </div>
                            </li>
                            <li class="flex justify-between items-center">
                                <div class="flex items-center">
                                    <i data-feather="wifi" class="mr-3 text-gray-500"></i>
                                    <span class="text-gray-700">Internet</span>
                                </div>
                                <div class="text-right">
                                    <p class="text-gray-700 font-semibold">Rp 50.00</p>
                                    <p class="text-sm text-gray-500">Due on Jul 20, 2023</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bg-white rounded-lg shadow-xs p-6 hover:shadow-md transition-shadow duration-300">
                        <h2 class="text-xl font-semibold text-gray-700 mb-4">Savings Goals</h2>
                        <div class="space-y-4">
                            <div>
                                <div class="flex justify-between mb-1">
                                    <span class="text-gray-700">Emergency Fund</span>
                                    <span class="text-gray-600">Rp 5,000 / Rp 10,000</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-2.5">
                                    <div class="bg-green-600 h-2.5 rounded-full" style="width: 50%"></div>
                                </div>
                            </div>
                            <div>
                                <div class="flex justify-between mb-1">
                                    <span class="text-gray-700">Vacation</span>
                                    <span class="text-gray-600">Rp 2,000 / Rp 5,000</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-2.5">
                                    <div class="bg-blue-600 h-2.5 rounded-full" style="width: 40%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-8">
                    <div class="bg-white rounded-lg shadow-xs p-6 hover:shadow-md transition-shadow duration-300">
                        <h2 class="text-xl font-semibold text-gray-700 mb-4">Quick Transfer</h2>
                        <p class="text-gray-600 mb-4">Need to move money? Initiate a quick transfer now.</p>
                        <a href="Transfer"
                           class="inline-flex items-center justify-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            <i data-feather="send" class="w-4 h-4 mr-2"></i>
                            Start New Transfer
                        </a>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-xs p-6 mb-8 hover:shadow-md transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-700 mb-4">Recent Transfers</h2>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        Date</th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        From</th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        To</th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        Amount</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-28</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">Checking</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">Savings</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-green-600">Rp 500.00
                                    </td>
                                </tr>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-25</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">Savings</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">Investment</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-green-600">Rp 1,000.00
                                    </td>
                                </tr>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023-06-20</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">Checking</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">Bills</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-red-600">Rp 300.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4 text-right">
                        <a href="#" class="text-sm font-medium text-indigo-600 hover:text-indigo-500">View All Transfers</a>
                    </div>
                </div>
            </main>
        </div>
        <script>
            // Dropdown toggle
            const profilePhoto = document.getElementById('profilePhoto');
            const profileDropdown = document.getElementById('profileDropdown');

            profilePhoto.addEventListener('click', () => {
                profileDropdown.classList.toggle('show');
            });

            // Close dropdown when clicking outside
            document.addEventListener('click', (event) => {
                if (!profilePhoto.contains(event.target) && !profileDropdown.contains(event.target)) {
                    profileDropdown.classList.remove('show');
                }
            });

            // Load Feather Icons
            feather.replace();
        </script>
    </body>

</html>
