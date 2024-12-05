// Mock expense data
const mockExpenseData = [
    { id: '1', amount: 800, date: '2023-05-01', recipient: 'Supermarket', type: 'shopping' },
    { id: '2', amount: 300, date: '2023-05-05', recipient: 'Electricity Bill', type: 'bill' },
    { id: '3', amount: 500, date: '2023-05-10', recipient: 'Donation Center', type: 'donation' },
    { id: '4', amount: 150, date: '2023-09-10', recipient: 'Coffee Shop', type: 'shopping', message: 'Hangout sama teman' },
    { id: '5', amount: 2000, date: '2024-09-10', recipient: 'Vacation Booking', type: 'shopping', message: 'Liburan akhir tahun' },
    { id: '6', amount: 1000, date: '2024-10-01', recipient: 'Charity Event', type: 'donation', message: 'Donasi untuk kegiatan sosial' },
];

// Function to create an expense card
function createExpenseCard(expense) {
    const card = document.createElement('div');
    card.className = 'bg-white shadow rounded-lg overflow-hidden transition-all duration-300 hover:shadow-lg expense-card';
    card.innerHTML = `
        <div class="p-6">
            <div class="flex justify-between items-center mb-4">
                <span class="text-2xl font-bold text-gray-800">Rp. ${expense.amount}</span>
                <span class="text-sm font-medium text-gray-500">${expense.date}</span>
            </div>
            <div class="space-y-2">
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">Recipient:</span>
                    <span class="font-medium text-gray-800">${expense.recipient}</span>
                </div>
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">Type:</span>
                    <span class="font-medium ${
                        expense.type === 'shopping'
                            ? 'text-purple-600'
                            : expense.type === 'bill'
                            ? 'text-green-600'
                            : 'text-blue-600'
                    }">
                        ${expense.type.charAt(0).toUpperCase() + expense.type.slice(1)}
                    </span>
                </div>
                ${expense.message ? `
                    <div class="mt-4">
                        <span class="text-sm text-gray-600">Message:</span>
                        <p class="mt-1 text-sm text-gray-800">${expense.message}</p>
                    </div>
                ` : ''}
            </div>
        </div>
    `;
    return card;
}

// Function to calculate and display expense statistics
function displayExpenseStatistics() {
    const totalExpense = mockExpenseData.reduce((sum, transaction) => sum + transaction.amount, 0);
    const shoppingExpense = mockExpenseData.filter(t => t.type === 'shopping').reduce((sum, t) => sum + t.amount, 0);
    const billExpense = mockExpenseData.filter(t => t.type === 'bill').reduce((sum, t) => sum + t.amount, 0);
    const donationExpense = mockExpenseData.filter(t => t.type === 'donation').reduce((sum, t) => sum + t.amount, 0);

    document.getElementById('totalExpense').textContent = `Rp ${totalExpense}`;
    document.getElementById('shoppingExpense').textContent = `Rp ${shoppingExpense}`;
    document.getElementById('billExpense').textContent = `Rp ${billExpense}`;
    document.getElementById('donationExpense').textContent = `Rp ${donationExpense}`;

    // Update the chart
    updateExpenseChart(shoppingExpense, billExpense, donationExpense);
}

// Function to apply dynamic animation delays
function applyDynamicAnimationDelays() {
    const expenseCards = document.querySelectorAll('.expense-card');
    const delayIncrement = 0.1;
    const maxDelay = 0.5;

    expenseCards.forEach((card, index) => {
        const delay = Math.min(delayIncrement * (index + 1), maxDelay);
        card.style.animationDelay = `${delay}s`;
    });
}

// Function to display expense cards
function displayExpenseCards(data) {
    const expenseCardsContainer = document.getElementById('expenseCards');
    expenseCardsContainer.innerHTML = ''; // Clear existing cards
    data.forEach(expense => {
        const card = createExpenseCard(expense);
        expenseCardsContainer.appendChild(card);
    });

    // Apply dynamic animation delays after cards are added
    applyDynamicAnimationDelays();
}

// Function to filter and display expense data
function filterAndDisplayExpense(filter) {
    let filteredData;
    if (filter === 'all') {
        filteredData = mockExpenseData;
    } else {
        filteredData = mockExpenseData.filter(expense => expense.type === filter);
    }
    displayExpenseCards(filteredData);
    updateActiveFilter(filter);
    displayExpenseStatistics();
}

// Function to update active filter button
function updateActiveFilter(filter) {
    const buttons = document.querySelectorAll('.filter-btn');
    buttons.forEach(button => {
        if (button.id === `${filter}Filter`) {
            button.classList.remove('bg-gray-200', 'text-gray-700');
            button.classList.add('bg-blue-500', 'text-white');
        } else {
            button.classList.remove('bg-blue-500', 'text-white');
            button.classList.add('bg-gray-200', 'text-gray-700');
        }
    });
}

    // Function to update the expense distribution chart
    function updateExpenseChart(shoppingExpense, billExpense, donationExpense) {
        const ctx = document.getElementById('expenseChart').getContext('2d');

        if (window.expenseChart instanceof Chart) {
            window.expenseChart.destroy();
        }

        window.expenseChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Shopping Expense', 'Bill Expense', 'Donation Expense'],
                datasets: [{
                    data: [shoppingExpense, billExpense, donationExpense],
                    backgroundColor: ['#A855F7', '#10B981', '#3B82F6'],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            boxWidth: 12,
                            padding: 10
                        }
                    }
                }
            }
        });
    }

// Mobile menu toggle
document.getElementById('menuToggle').addEventListener('click', function() {
    const mobileMenu = document.getElementById('mobileMenu');
    mobileMenu.classList.toggle('hidden');
});

// Initialize the page
document.addEventListener('DOMContentLoaded', function() {
    displayExpenseStatistics();
    filterAndDisplayExpense('all');

    // Add event listeners to filter buttons
    document.getElementById('allFilter').addEventListener('click', () => filterAndDisplayExpense('all'));
    document.getElementById('shoppingFilter').addEventListener('click', () => filterAndDisplayExpense('shopping'));
    document.getElementById('billFilter').addEventListener('click', () => filterAndDisplayExpense('bill'));
    document.getElementById('donationFilter').addEventListener('click', () => filterAndDisplayExpense('donation'));
});