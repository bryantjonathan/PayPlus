<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Savings</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">
    <header class="bg-white shadow-sm sticky top-0 z-10">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center py-4">
                <div class="flex items-center">
                    <a href="DasboardPage.jsp">
                        <img id="logo" src="logo.png" alt="Logo" class="h-8">
                    </a>
                </div>
                <nav class="hidden sm:flex space-x-4">
                    <a href="DasboardPage.jsp" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Dashboard</a>
                    <a href="IncomePage.jsp" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Incomes</a>
                    <a href="ExpensePage.jsp" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Expenses</a>
                    <a href="#" class="text-gray-600 hover:text-gray-800 transition-colors duration-200">Reports</a>
                </nav>
            </div>
        </div>
    </header>
    
    <main class="container mx-auto px-4 py-8 sm:px-6 lg:px-8">
        <h1 class="text-3xl font-bold mb-8 text-gray-800">Add Savings</h1>
        
        <form method="POST" action="savings?action=add" class="bg-white p-6 rounded-lg shadow-md max-w-lg mx-auto">
            <div class="mb-4">
                <label for="nama" class="block text-sm font-medium text-gray-700">Nama</label>
                <input name="nama" id="nama" type="text" class="mt-1 p-2 w-full border rounded-lg focus:ring-blue-500 focus:border-blue-500" required>
            </div>
            <div class="mb-4">
                <label for="deskripsi" class="block text-sm font-medium text-gray-700">Deskripsi</label>
                <textarea name="deskripsi" id="deskripsi" rows="3" class="mt-1 p-2 w-full border rounded-lg focus:ring-blue-500 focus:border-blue-500" required></textarea>
            </div>
            <div class="mb-4">
                <label for="target" class="block text-sm font-medium text-gray-700">Target (Rp)</label>
                <input name="target" id="target" type="number" step="0.01" class="mt-1 p-2 w-full border rounded-lg focus:ring-blue-500 focus:border-blue-500" required>
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white py-2 px-4 rounded shadow hover:bg-blue-600">
                Tambahkan
            </button>
        </form>
    </main>
</body>

</html>
