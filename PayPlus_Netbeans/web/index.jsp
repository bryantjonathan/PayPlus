<%-- 
    Document   : index
    Created on : Dec 19, 2024, 10:38:43 AM
    Author     : fauss
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayPlus - Simplify Your Financial Life</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="<%= request.getContextPath() %>/logoTab.png" type="image/icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .animate-float {
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {

            0%,
            100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-20px);
            }
        }

        .gradient-text {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            background-image: linear-gradient(45deg, #4F46E5, #7C3AED);
        }
    </style>
</head>

<body class="bg-white text-gray-800">
    <header class="fixed w-full bg-white bg-opacity-90 backdrop-filter backdrop-blur-sm z-50">
        <nav class="container mx-auto px-6 py-4">
            <div class="flex justify-between items-center">
                <div class="logo">
                    <img id="logo" src="Images\logo.png" alt="PayPlus Logo">
                </div>
                
                <div class="hidden md:block">
                    <a href="User?menu=login" class="bg-indigo-500 text-white px-6 py-2 rounded-full hover:bg-indigo-600 transition duration-300">Log in</a>
                </div>
                <div class="md:hidden">
                    <button id="menu-toggle" class="text-gray-500 hover:text-gray-600 focus:outline-none focus:text-gray-600">
                        <svg class="h-6 w-6 fill-current" viewBox="0 0 24 24">
                            <path d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2z" />
                        </svg>
                    </button>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="hero pt-32 pb-20 px-6">
            <div class="container mx-auto flex flex-col md:flex-row items-center">
                <div class="md:w-1/2 mb-16 md:mb-0">
                    <h1 class="text-4xl md:text-5xl font-bold leading-tight mb-6">
                        Simplify Your <span class="gradient-text">Financial Life</span>
                    </h1>
                    <p class="text-xl mb-8 text-gray-600 leading-relaxed">
                        PayPlus helps you manage money, track expenses, and achieve your financial goals with ease and precision.
                    </p>
                    <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
                        <a href="User?menu=signup" class="bg-indigo-500 text-white font-semibold px-8 py-3 rounded-full hover:bg-indigo-600 transition duration-300 text-center">
                            Get Started
                        </a>
                        
                    </div>
                    <div class="mt-8 flex items-center space-x-4">
                        <div class="flex -space-x-2">
                            <img class="w-10 h-10 rounded-full border-2 border-white" src="https://i.pravatar.cc/40?img=1" alt="User">
                            <img class="w-10 h-10 rounded-full border-2 border-white" src="https://i.pravatar.cc/40?img=8" alt="User">
                            <img class="w-10 h-10 rounded-full border-2 border-white" src="https://i.pravatar.cc/40?img=13" alt="User">
                        </div>
                        <p class="text-sm text-gray-600">Joined by 10,000+ users</p>
                    </div>
                </div>
                <div class="md:w-1/2 relative">
                    <img src="Images\ImageDasboard.png" alt="Finance Dashboard" class="rounded-lg shadow-2xl animate-float">
                </div>
            </div>
        </section>

        <!-- Additional sections remain the same, with image and link paths updated using JSP -->
        <section class="py-20 bg-gray-50">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center mb-12">Why Choose PayPlus?</h2>
                <div class="grid md:grid-cols-3 gap-12">
                    <div class="text-center">
                        <div
                            class="bg-white rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4 shadow-md">
                            <svg class="w-8 h-8 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z">
                                </path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Smart Budgeting</h3>
                        <p class="text-gray-600">Set and track budgets with list of budgets and very intuitif.</p>
                    </div>
                    <div class="text-center">
                        <div
                            class="bg-white rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4 shadow-md">
                            <svg class="w-8 h-8 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01">
                                </path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Expense Tracking</h3>
                        <p class="text-gray-600">Automatically categorize and analyze your spending habits.</p>
                    </div>
                    <div class="text-center">
                        <div
                            class="bg-white rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4 shadow-md">
                            <svg class="w-8 h-8 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Goal Setting</h3>
                        <p class="text-gray-600">Set financial goals and track your progress over time.</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-20 bg-white">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-semibold text-center text-gray-800 mb-16">What Our Users Say</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
                    <div class="bg-white p-8 rounded-lg shadow-sm">
                        <p class="text-gray-600 mb-4">"PayPlus mengubah cara aku ngatur keuangan. Gampang
                            banget dipakai, fiturnya keren, dan yang bikin seru, ngatur budget jadi lebih asyik "</p>
                        <div class="flex items-center">
                            <img src="https://i.pravatar.cc/60?img=8" alt="User" class="w-12 h-12 rounded-full mr-4">
                            <div>
                                <h4 class="text-lg font-semibold text-gray-800">Andy Sanjaya</h4>
                                <p class="text-gray-600">Gold Member User</p>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-8 rounded-lg shadow-sm">
                        <p class="text-gray-600 mb-4">"Pakai PayPlus, ngatur uang jadi jauh lebih simpel. Fiturnya
                            lengkap, gampang dipahami, dan bikin budgeting terasa ringan dan menyenangkan. Top deh pokko
                            nyaaa 😊"</p>
                        <div class="flex items-center">
                            <img src="https://i.pravatar.cc/60?img=1" alt="User" class="w-12 h-12 rounded-full mr-4">
                            <div>
                                <h4 class="text-lg font-semibold text-gray-800">Putri Andini</h4>
                                <p class="text-gray-600">Silver Member User</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    </main>
    <footer class="bg-gray-800 text-white py-8">
        <div class="container mx-auto px-6 flex flex-wrap justify-between items-center">
            <div class="w-full md:w-auto text-center md:text-left mb-4 md:mb-0">
                <span class="text-2xl font-semibold">PayPlus</span>
                <p class="mt-2 text-sm text-gray-400">&copy; 2024 PayPlus. All rights reserved.</p>
            </div>
            
        </div>
    </footer>
    <script>
        // Mobile menu toggle
        const menuToggle = document.getElementById('menu-toggle');
        const mobileMenu = document.querySelector('.md\:flex');

        menuToggle.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // CTA button animation
        const ctaButton = document.getElementById('cta-button');

        ctaButton.addEventListener('mouseover', () => {
            ctaButton.classList.add('scale-105');
        });

        ctaButton.addEventListener('mouseout', () => {
            ctaButton.classList.remove('scale-105');
        });

        // Scroll animation for header
        window.addEventListener('scroll', () => {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.classList.add('shadow-md');
            } else {
                header.classList.remove('shadow-md');
            }
        });
    </script>
</body>

</html>
