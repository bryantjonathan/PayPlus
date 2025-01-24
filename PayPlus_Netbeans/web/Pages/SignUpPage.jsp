<%-- 
    Document   : signupPage
    Created on : Dec 24, 2024, 3:28:30 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - PayPlus</title>
        <link rel="icon" href="Images/logoTab.png" type="image/icon type">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-50 font-sans">
        <div class="flex min-h-screen">
            <div class="hidden lg:flex flex-1 items-center justify-center bg-indigo-100">
                <div class="text-center max-w-md">
                    <h1 class="text-4xl font-bold text-indigo-500 mb-6">Welcome to PayPlus</h1>
                    <p class="text-gray-600 text-lg">Manage your finances effortlessly and achieve your financial goals with ease.</p>
                </div>
            </div>

            <div class="flex flex-col flex-1 items-center justify-center p-8">
                <div class="w-full max-w-md">
                    <div class="text-center mb-6">
                        <a href="../PayPlus">
                            <img src="Images/logo.png" alt="PayPlus Logo" class="mx-auto">
                        </a>
                        <h2 class="text-2xl font-bold text-indigo-600 mt-4">Create Your Account</h2>
                    </div>
                    <form action="User?action=add" method="POST" class="space-y-4">
                        <div>
                            <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                            <input type="text" id="name" name="name" placeholder="Enter your full name" 
                                   class="block w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div>
                            <label for="phone" class="block text-sm font-medium text-gray-700">Phone Number</label>
                            <input type="text" id="phone" name="phone" placeholder="Enter your phone number" 
                                   class="block w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div>
                            <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email" 
                                   class="block w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div>
                            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                            <input type="password" id="password" name="password" placeholder="Create a password" 
                                   class="block w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div>
                            <label for="confirm-password" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                            <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" 
                                   class="block w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div>
                            <label for="balance" class="block text-sm font-medium text-gray-700">Starting Balance</label>
                            <input type="balance" id="balance" name="balance" placeholder="Top Up Your Starting Balance"       
                                   class="block w-full border-gray-300 rounded-lg" required>
                        </div>
                        <button type="submit" class="w-full bg-indigo-500 text-white py-2 px-6 rounded-lg">Register</button>
                    </form>
                    <p class="mt-6 text-center text-gray-600 text-sm">Already have an account? <a href="User?menu=login" class="text-indigo-600 hover:underline">Login</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
