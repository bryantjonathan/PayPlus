<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Bill"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Upcoming Bills - PayPlus</title>
        <link rel="icon" href="Images\logoTab.png" type="image/icon type">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://unpkg.com/feather-icons"></script>
        <style>
            /* General Reset */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', sans-serif;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            /* Utility Classes */
            .text-right {
                text-align: right;
            }

            /* Button Styles */
            button {
                cursor: pointer;
            }

            /* Custom Shadows */
            .shadow-xs {
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            }

            /* Flexbox Layout for Bill Item */
            .bill-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
                padding: 10px;
                border-bottom: none;
                color: #eb1e1e; /* Red color for trash icon */
                cursor: pointer;
            }

            /* Notification Container */
            .notification-container {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 300px;
                max-height: 80vh;
                overflow-y: auto;
                z-index: 9999;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            /* Notification Card */
            .notification-card {
                display: flex;
                align-items: flex-start;
                gap: 10px;
                background-color: #fff;
                border-left: 5px solid #4f46e5; /* Default border color */
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                padding: 12px 16px;
                animation: slideIn 0.3s ease-out;
                transition: opacity 0.3s ease, transform 0.3s ease;
            }

            /* Success and Overdue Styles */
            .notification-card.reminder {
                border-left-color: #3b82f6; /* Blue for reminders */
            }

            .notification-card.overdue {
                border-left-color: #dc2626; /* Red for overdue */
            }

            /* Text Styles */
            .notification-card .notification-content {
                flex: 1;
            }

            .notification-card h4 {
                font-size: 1rem;
                font-weight: 600;
                margin-bottom: 4px;
                color: #374151;
            }

            .notification-card p {
                font-size: 0.875rem;
                color: #6b7280;
                margin: 0;
            }

            /* Close Button */
            .notification-card button {
                background: none;
                border: none;
                padding: 0;
                color: #9ca3af;
                cursor: pointer;
                font-size: 1.25rem;
                line-height: 1;
                transition: color 0.2s;
            }

            .notification-card button:hover {
                color: #6b7280;
            }

            .bill-item.overdue {
                background-color: #fef2f2;
                border-left: 4px solid #e53e3e; /* Merah untuk overdue */
            }

            /* Slide In Animation */
            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
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
                                <img id="logo" src="Images/logo.png">
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
                                      d="M4 6h16M4 12h16M4 18h16"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </header>

            <main class="flex-grow container mx-auto px-4 py-8 sm:px-6 lg:px-8">
                <h1 class="text-3xl font-bold mb-8 text-gray-800">Upcoming Bills</h1>

                <!-- Daftar Tagihan -->
                <section class="bg-white rounded-lg shadow-xs p-6 mb-8 hover:shadow-md transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-700 mb-4">Upcoming Bills</h2>
                    <ul class="space-y-3">
                        <%
                            ArrayList<Bill> bills = (ArrayList<Bill>) request.getSession().getAttribute("list");
                            if (bills != null && !bills.isEmpty()) {
                                for (Bill bill : bills) {
                                    if (bill != null) {
                                        String categoryIcon = "";
                                        switch (bill.getCategory()) {
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
                                            default:
                                                categoryIcon = "file";
                                                break;
                                        }
                        %>
                        <li class="flex justify-between items-center border-b border-gray-200 py-4 bill-item" data-due="<%= bill.getDueDate()%>">
                            <div class="flex items-center">
                                <i data-feather="<%= categoryIcon%>" class="mr-3 text-gray-500"></i>
                                <span class="text-gray-700"><%= bill.getName()%></span>
                            </div>
                            <div class="flex items-center space-x-6">
                                <div class="flex flex-col items-end">
                                    <p class="amount text-gray-700">Rp <%= (int) bill.getAmount()%></p>
                                    <p class="due-date text-sm" style="color: #4a5568;">Due on <%= bill.getDueDate()%></p>
                                </div>
                                <form method="POST" action="bill?action=del&id=<%= bill.getId()%>"
                                      style="display:inline" onsubmit="return confirm('Yakin hapus?')">
                                    <button type="submit" class="delete-btn">
                                        <i data-feather="trash-2"></i>
                                    </button>
                                </form>
                            </div>
                        </li>
                        <%          }
                            }
                        } else {
                        %>
                        <ul>
                            <p id="noChargesMessage" class="text-gray-500">No Charges</p>
                        </ul>
                        <% }
                        %>
                    </ul>
                </section>

                <!-- Form Tambah Tagihan -->
                <section class="bg-white rounded-lg shadow-xs p-6 mb-8 hover:shadow-md transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-700 mb-4">Add New Bill</h2>
                    <form method="POST" action="bill?action=add">
                        <div class="space-y-4">
                            <div>
                                <label for="billName" class="block text-sm font-medium text-gray-600">Bill Name</label>
                                <input type="text" id="name" name="name" placeholder="Enter bill name"
                                       class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       required>
                            </div>
                            <div>
                                <label for="amount" class="block text-sm font-medium text-gray-600">Amount</label>
                                <input type="number" id="amount" name="amount" placeholder="Enter amount bill"
                                       class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       required>
                            </div>
                            <div>
                                <label for="dueDate" class="block text-sm font-medium text-gray-600">Due Date</label>
                                <input type="String" id="dueDate" name="dueDate" placeholder="yyyy-mm-dd"
                                       class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       required>
                            </div>
                            <div>
                                <label for="category" class="block text-sm font-medium text-gray-600">Category</label>
                                <select id="category" name="category"
                                        class="w-full p-3 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                        required>
                                    <option value="Rent">Rent</option>
                                    <option value="Electricity">Electricity</option>
                                    <option value="Internet">Internet</option>
                                    <option value="Water">Water</option>
                                    <option value="Vehicle">Vehicle</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit"
                                class="mt-4 w-full p-3 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                            Add Bill
                        </button>
                    </form>
                </section>
            </main>
        </div>

        <!-- Notification Container -->
        <div class="notification-container" id="notificationContainer"></div>

        <!-- JavaScript Inline -->
        <script src="${pageContext.request.contextPath}/Pages/extendbill/Bill.js"></script>
    </body>

</html>