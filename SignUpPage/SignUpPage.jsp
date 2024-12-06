<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - PayPlus</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-50 font-sans">
    <div class="flex min-h-screen">
        <!-- Left Section -->
        <div class="hidden lg:flex flex-1 items-center justify-center bg-indigo-100">
            <div class="text-center max-w-md">
                <h1 class="text-4xl font-bold text-indigo-500 mb-6">Welcome to PayPlus</h1>
                <p class="text-gray-600 text-lg">Manage your finances effortlessly and achieve your financial goals with ease.</p>
            </div>
        </div>

        <!-- Right Section -->
        <div class="flex flex-col flex-1 items-center justify-center p-8">
            <div class="w-full max-w-md">
                <div class="text-center mb-6">
                    <img src="../logo.png" alt="PayPlus Logo" class="mx-auto">
                    <h2 class="text-2xl font-bold text-indigo-600 mt-4">Create Your Account</h2>
                </div>
                <form action="dashboard.html" method="POST" class="space-y-4">
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter your full name" 
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500" required>
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" 
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500" required>
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <input type="password" id="password" name="password" placeholder="Create a password" 
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500" required>
                    </div>
                    <div>
                        <label for="confirm-password" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                        <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" 
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500" required>
                    </div>
                    <div>
                        <label for="role" class="block text-sm font-medium text-gray-700">Account Role</label>
                        <select id="role" name="role" 
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 bg-white rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                            <option value="bronze">Bronze</option>
                            <option value="silver">Silver</option>
                            <option value="gold">Gold</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-indigo-500 text-white py-2 px-6 rounded-lg shadow hover:bg-indigo-600 transition duration-300">Register</button>
                </form>
                <p class="mt-6 text-center text-gray-600 text-sm">Already have an account? <a href="login.html" class="text-indigo-600 hover:underline">Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>
