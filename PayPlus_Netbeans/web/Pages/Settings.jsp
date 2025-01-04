<%-- 
    Document   : Settings
    Created on : Jan 5, 2025, 12:21:01 AM
    Author     : fauss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <!-- Header -->
        <header class="bg-white shadow-sm sticky top-0 z-10">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center py-4">
                    <div class="flex items-center">
                        <a href="Dashboard">
                            <img id="logo" src="..\Images\logo.png">
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="flex-grow container mx-auto px-4 py-8 sm:px-6 lg:px-8">
            <div class="max-w-2xl mx-auto">
                <div class="flex items-center justify-between mb-8">
                    <h1 class="text-3xl font-bold text-gray-800">Account Settings</h1>
                </div>

                <!-- Settings Form -->
                <div class="bg-white rounded-lg shadow-xs p-6 space-y-8">
                    <form id="settingsForm" class="space-y-6">
                        <!-- Profile Section -->
                        <div class="space-y-6">
                            <div class="flex items-center space-x-6">
                                <div class="relative">
                                    <img src="https://i.pravatar.cc/80?img=68" alt="Profile Picture" class="w-20 h-20 rounded-full">
                                    
                                </div>
                                <div>
                                    <h3 class="text-lg font-medium text-gray-900">Profile Picture</h3>
                                    <p class="text-xs font-medium text-yellow-500">Gold Member</p>
                                </div>
                            </div>

                            <!-- Name -->
                            <div>
                                <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                                <input type="text" id="name" name="name" value="Fausta Akbar"
                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>

                            <!-- Phone Number -->
                            <div>
                                <label for="phone" class="block text-sm font-medium text-gray-700">Phone Number</label>
                                <input type="text" id="phone" name="phone" value="+62 812-3456-7890"
                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                            
                             <!-- Email -->
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                <input type="text" id="email" name="email" value="user@gmai.com"
                                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>

                        <!-- Password Section -->
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
                        </div>

                        <!-- Save Button -->
                        <div class="flex justify-end pt-6">
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

    <!-- Success Message -->
    <div id="successMessage" class="fixed bottom-4 right-4 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg transform translate-y-full opacity-0 transition-all duration-300">
        <div class="flex items-center space-x-2">
            <i data-feather="check-circle" class="w-5 h-5"></i>
            <span>Settings updated successfully!</span>
        </div>
    </div>

    <script>
        // Initialize Feather icons
        feather.replace();

        // Form handling
        const settingsForm = document.getElementById('settingsForm');
        const successMessage = document.getElementById('successMessage');

        settingsForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Basic validation
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword && newPassword !== confirmPassword) {
                alert("New passwords don't match!");
                return;
            }

            // Collect form data
            const formData = new FormData(settingsForm);
            const data = Object.fromEntries(formData);
            console.log('Settings update:', data);

            // Show success message
            successMessage.classList.remove('translate-y-full', 'opacity-0');
            
            // Hide success message after 3 seconds
            setTimeout(() => {
                successMessage.classList.add('translate-y-full', 'opacity-0');
            }, 3000);
        });
    </script>
</body>
</html>

