<%-- 
    Document   : Settings
    Created on : Jan 5, 2025, 12:21:01 AM
    Author     : fauss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.User, java.sql.ResultSet, javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="Images/logoTab.png" type="image/icon">
    <title>Account Settings - PayPlus</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .dropdown {
            display: none;
        }
        .dropdown.show {
            display: block;
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
                </div>
            </div>
        </header>

        <main class="flex-grow container mx-auto px-4 py-8 sm:px-6 lg:px-8">
            <div class="max-w-2xl mx-auto">
                <div class="flex items-center justify-between mb-8">
                    <h1 class="text-3xl font-bold text-gray-800">Account Settings</h1>
                </div>

                <div class="bg-white rounded-lg shadow-xs p-6 mb-8 hover:shadow-md transition-shadow duration-300">
                     <%
                            User user = new User();
                            user = user.find(request.getSession().getAttribute("currPhone").toString());
                     %>
                    <form id="transferForm" class="space-y-4" action="Setting" method="POST">
                        <div class="space-y-6">
                            <div class="flex items-center space-x-6">
                                <div class="relative">
                                    <img src="https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png" alt="Profile Picture" class="w-20 h-20 rounded-full">
                                </div>
                                <div>
                                    <h3 class="text-lg font-medium text-gray-900">Profile Picture</h3>
                                    <p class="text-xs font-medium <%= 
                                        user.getRole().equalsIgnoreCase("gold") ? "text-yellow-500" :
                                        user.getRole().equalsIgnoreCase("silver") ? "text-gray-500" :
                                        user.getRole().equalsIgnoreCase("bronze") ? "text-orange-500" :
                                        "text-black" %>">
                                        Member <%= user.getRole() %>
                                    </p>

                                </div>
                            </div>

                            <div>
                                <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                                <input type="text" id="name" name="name" value="<%=user.getName()%>"
                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                <input type="text" id="email" name="email" value="<%=user.getEmail()%>"
                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>

                        <div class="pt-6 border-t border-gray-200">
                            <h3 class="text-lg font-medium text-gray-900 mb-4">Change Password</h3>
                            <div class="space-y-4">
                                <div>
                                    <label for="currentPassword" class="block text-sm font-medium text-gray-700">Current Password</label>
                                    <input type="password" id="currentPassword" name="currentPassword"
                                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                </div>
                                <div>
                                    <label for="newPassword" class="block text-sm font-medium text-gray-700">New Password</label>
                                    <input type="password" id="newPassword" name="newPassword"
                                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                </div>
                                <div>
                                    <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm New Password</label>
                                    <input type="password" id="confirmPassword" name="confirmPassword"
                                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                </div>
                            </div>
                            <p style="color: <%=request.getAttribute("warna") != null ? request.getAttribute("warna") : "black"%>">
                                <%=request.getAttribute("alert") != null ? request.getAttribute("alert") : ""%>
                            </p>

                        </div>
                        
                        <div class="flex justify-end pt-6">
                            <a href="Dashboard"
                                class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                                Cancel
                            </a>
                            <button type="submit"
                                class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Save Changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <div id="successMessage" class="fixed bottom-4 right-4 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg transform translate-y-full opacity-0 transition-all duration-300">
        <div class="flex items-center space-x-2">
            <i data-feather="check-circle" class="w-5 h-5"></i>
            <span>Settings updated successfully!</span>
        </div>
    </div>

    <script>
        feather.replace();

        const settingsForm = document.getElementById('settingsForm');
        const successMessage = document.getElementById('successMessage');

        settingsForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword && newPassword !== confirmPassword) {
                alert("New passwords don't match!");
                return;
            }

            const formData = new FormData(settingsForm);
            const data = Object.fromEntries(formData);
            console.log('Settings update:', data);

            successMessage.classList.remove('translate-y-full', 'opacity-0');
            
            setTimeout(() => {
                successMessage.classList.add('translate-y-full', 'opacity-0');
            }, 3000);
        });
    </script>
</body>
</html>

