<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="models.User, java.sql.ResultSet, javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="Images/logoTab.png" type="image/icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>

<body class="bg-gray-50 font-sans">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
            <a href="../PayPlus">    
                <img id = "logo" src="Images\logo.png" class="mx-auto">
            </a>
            <h3 class="text-2xl font-bold text-indigo-600 text-center mb-6">Welcome Back!</h3>
            
            <form method="POST" class="space-y-4" action="User?action=login">
                <div>
                    <label for="phone" class="block text-sm font-medium text-gray-700">Phone Number</label>
                    <input type="text" id="phone" name="phone" placeholder="Enter your phone number"
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                        required>
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <div class="relative">
                        <input type="password" id="password" name="password" placeholder="Enter your password"
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                            required>
                        <button type="button" id="toggle-password"
                            class="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-600">
                        </button>
                    </div>
                </div>
                <div class="flex items-center justify-between">
                    <label class="flex items-center">
                        <input type="checkbox" class="h-4 w-4 text-indigo-600 border-gray-300 rounded">
                        <span class="ml-2 text-sm text-gray-600">Remember me</span>
                    </label>
                </div>
                <button type="submit"
                    class="w-full bg-indigo-500 text-white py-2 px-6 rounded-lg shadow hover:bg-indigo-600 transition duration-300">Login</button>
            </form>
            
            <p style='color:red;'>${error}</p>
            
            
            <p class="mt-6 text-center text-gray-600 text-sm">Don't have an account? <a
                    href="User?menu=signup" class="text-indigo-600 hover:underline">Sign Up</a></p>
        </div>
    </div>
</body>

</html>
