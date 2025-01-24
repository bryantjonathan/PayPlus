<%-- 
    Document   : DashboardPage
    Created on : Dec 19, 2024, 11:40:35 AM
    Author     : fauss
--%>

<%@page import="models.Bill"%>
<%@page import="models.Savings"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.User, models.ExpenseRecord, java.sql.ResultSet, javax.servlet.http.HttpSession"%>
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
                            <%
                                User user = new User();
                                user = user.find(request.getSession().getAttribute("currPhone").toString());
                            %>
                            <div class="relative">
                                <img id="profilePhoto" src="https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png" alt="Profile"
                                     class="w-10 h-10 rounded-full border-2 border-indigo-500 cursor-pointer">
                                <div
                                    class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 rounded-full border-2 border-white">
                                </div>
                                <div id="profileDropdown"
                                     class="dropdown absolute right-0 mt-2 w-48 bg-white rounded-md overflow-hidden shadow-xl z-10">
                                    <div class="px-4 py-2 border-b">
                                        <p class="text-sm font-medium text-gray-900"><%=user.getName()%></p>
                                        <p class="text-xs text-gray-500">Account #: <%=user.getPhone()%></p>
                                        <p class="text-xs font-medium <%=user.getRole().equals("gold") ? "text-yellow-500"
                                                : user.getRole().equals("silver") ? "text-gray-500"
                                                : user.getRole().equals("bronze") ? "text-orange-500"
                                                : "text-black"%>">
                                            Member <%= user.getRole()%>
                                        </p>

                                    </div>
                                    <a href="Setting" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Account
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
                <h1 class="text-3xl font-bold mb-8 text-gray-800">Welcome back, <%= user.getName()%>!</h1>

                <!-- Balance Card -->
                <div class="balance-card rounded-xl p-6 mb-8 text-white">
                    <div class="flex justify-between items-start mb-4">
                        <div>
                            <p class="text-sm opacity-90">Available Balance</p>
                            <h2 class="text-3xl font-bold mt-1">Rp. <%= String.format("%,.0f", Double.parseDouble(request.getSession().getAttribute("currBalance").toString()))%></h2>
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
                            <span class="text-sm">Income: Rp. <%= income.get(0) == null ? 0 : String.format("%,.0f", income.get(0))%></span>

                        </div>
                        <div class="flex items-center">
                            <i data-feather="arrow-down-left" class="w-4 h-4 mr-1"></i>
                            <span class="text-sm">Expense: Rp. <%= expense.get(0) == null ? 0 : String.format("%,.0f", expense.get(0))%></span>
                        </div>
                    </div>
                </div>

                <%
                    ArrayList<Savings> listTabungan = (ArrayList<Savings>) request.getSession().getAttribute("list");
                    double totalCollected = 0;

                    if (listTabungan != null) {
                        for (Savings saving : listTabungan) {
                            totalCollected += (double) saving.getTerkumpul();
                        }
                    }
                %>

                <%
                    ArrayList<Bill> listBill = (ArrayList<Bill>) request.getSession().getAttribute("listbill");
                    double totalBill = 0;

                    if (listBill != null) {
                        for (Bill bill : listBill) {
                            totalBill += bill.getAmount();
                        }
                    }
                %>
                <div class="grid gap-6 mb-8 md:grid-cols-2">
                    <div
                        class="flex items-center p-4 bg-white rounded-lg shadow-xs hover:shadow-md transition-shadow duration-300">
                        <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full">
                            <i data-feather="dollar-sign"></i>
                        </div>
                        <div>
                            <p class="mb-2 text-sm font-medium text-gray-600">Total Savings</p>
                            <p class="text-lg font-semibold text-gray-700">Rp. <%= String.format("%,.0f", totalCollected)%></p>
                        </div>
                    </div>
                    <div
                        class="flex items-center p-4 bg-white rounded-lg shadow-xs hover:shadow-md transition-shadow duration-300">
                        <div class="p-3 mr-4 text-yellow-500 bg-yellow-100 rounded-full">
                            <i data-feather="credit-card"></i>
                        </div>
                        <div>
                            <p class="mb-2 text-sm font-medium text-gray-600">Pending Bills</p>
                            <p class="text-lg font-semibold text-gray-700">Rp. <%= String.format("%,.0f", totalBill)%></p>
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
                    <a href="bill">
                        <%
                            ArrayList<Bill> bills = (ArrayList<Bill>) request.getSession().getAttribute("listbill");
                        %>
                        <div class="bg-white rounded-lg shadow-xs p-6 hover:shadow-md transition-shadow duration-300">
                            <div class="flex items-center justify-between mb-4">
                                <h2 class="text-xl font-semibold text-gray-700">Upcoming Bills</h2>
                                <i data-feather="chevron-right" class="text-gray-500"></i>
                            </div>
                            <div class="space-y-4">
                                <%
                                    int b = 0;
                                    if (bills != null && !bills.isEmpty()) {
                                        for (Bill bill : bills) {
                                            if (b == 3) {
                                                break;
                                            }
                                            String category = bill.getCategory();
                                            String categoryIcon = "";
                                            switch (category) {
                                                case "Rent":
                                                    categoryIcon = "home";
                                                    break;
                                                case "Electricity":
                                                    categoryIcon = "zap";
                                                    break;
                                                case "Internet":
                                                    categoryIcon = "wifi";
                                                    break;
                                                case "Water":
                                                    categoryIcon = "droplet";
                                                    break;
                                                case "Vehicle":
                                                    categoryIcon = "truck";
                                                    break;
                                                case "Heart":
                                                    categoryIcon = "heart";
                                                    break;
                                                default:
                                                    categoryIcon = "file";
                                                    break;
                                            }
                                %>
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center">
                                        <i data-feather="<%= categoryIcon%>" class="mr-3 text-gray-500"></i>
                                        <span class="text-gray-700"><%= bill.getName()%></span>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-gray-700 font-semibold">Rp <%= String.format("%,.0f", bill.getAmount())%></p>
                                        <p class="text-sm text-gray-500">Due on <%= bill.getDueDate()%></p>
                                    </div>
                                </div>
                                <%
                                        b++;
                                    }
                                } else {
                                %>
                                <div class="flex justify-between mb-1">
                                    <span class="text-gray-700">No upcoming bills.</span>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </a>
                    <a href="savings">
                        <div class="bg-white rounded-lg shadow-xs p-6 hover:shadow-md transition-shadow duration-300">
                            <%
                                ArrayList<Savings> saves = (ArrayList<Savings>) request.getSession().getAttribute("list");

                            %>
                            <div class="flex items-center justify-between mb-4">
                                <h2 class="text-xl font-semibold text-gray-700">Savings Goals</h2>
                                <i data-feather="chevron-right" class="text-gray-500"></i>
                            </div>
                            <div class="space-y-4">
                                <%  int i;
                                    i = 0;
                                    if (saves.size() > 0) {
                                        double progress = (((double) saves.get(i).getTerkumpul() / saves.get(i).getTarget()) * 100);
                                        if (progress > 100) {
                                            progress = 100;
                                        }
                                        for (Savings s : saves) {
                                            if (i == 3) {
                                                break;
                                            }
                                %>
                                <div>
                                    <div class="flex justify-between mb-1">
                                        <span class="text-gray-700"><%= saves.get(i).getNama()%></span>
                                        <span class="text-gray-600">Rp <%= String.format("%,.0f", (double) saves.get(i).getTerkumpul())%> / <%= String.format("%,.0f", (double) saves.get(i).getTarget())%></span>
                                    </div>
                                    <div class="w-full bg-gray-200 rounded-full h-2.5">
                                        <div class="bg-green-600 h-2.5 rounded-full" style="width: <%= progress%>%"></div>
                                    </div>
                                </div>
                                <% i++;
                                    }
                                } else {%>
                                <div class="flex justify-between mb-1">
                                    <span class="text-gray-700">You have no savings.</span>
                                </div>
                                <%}%>
                            </div>
                        </div>
                        <a/>
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
            </main>
        </div>
        <script>
            const profilePhoto = document.getElementById('profilePhoto');
            const profileDropdown = document.getElementById('profileDropdown');

            profilePhoto.addEventListener('click', () => {
                profileDropdown.classList.toggle('show');
            });

            document.addEventListener('click', (event) => {
                if (!profilePhoto.contains(event.target) && !profileDropdown.contains(event.target)) {
                    profileDropdown.classList.remove('show');
                }
            });

            feather.replace();
        </script>
    </body>

</html>
