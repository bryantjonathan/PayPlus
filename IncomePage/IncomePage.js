// Mock income data
const mockIncomeData = [
    {
        id: '1',
        amount: 1000,
        date: '2023-05-01',
        sender: 'Fausta Akbar',
        type: 'normal',
       
    },
    {
        id: '2',
        amount: 500,
        date: '2023-05-05',
        sender: 'Akbar Wijaya',
        type: 'gift',
        message: 'Buat bayar hutang kemaren',
       
    },
    {
        id: '3',
        amount: 250,
        date: '2023-05-10',
        sender: 'Malin Kundang',
        type: 'normal',
        
    },
    {
        id: '4',
        amount: 250,
        date: '2023-09-10',
        sender: 'Putri Andini',
        type: 'gift',
        message: 'Happy birthday kamuuu!',
        
    },
    ,
    {
        id: '5',
        amount: 2500,
        date: '2024-09-10',
        sender: 'Syahra Amelia',
        type: 'gift',
        message: 'Happy birthday!',
        
    }
];

// Function to create an income card
function createIncomeCard(income) {
    const card = document.createElement('div');
    card.className = 'bg-white shadow rounded-lg overflow-hidden transition-all duration-300 hover:shadow-lg income-card';
    card.innerHTML = `
        <div class="p-6">
            <div class="flex justify-between items-center mb-4">
                <span class="text-2xl font-bold text-gray-800">Rp. ${income.amount}</span>
                <span class="text-sm font-medium text-gray-500">${income.date}</span>
            </div>
            <div class="space-y-2">
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">Sender:</span>
                    <span class="font-medium text-gray-800">${income.sender}</span>
                </div>
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">Type:</span>
                    <span class="font-medium ${income.type === 'gift' ? 'text-purple-600' : 'text-blue-600'}">
                        ${income.type.charAt(0).toUpperCase() + income.type.slice(1)}
                    </span>
                </div>
                ${income.type === 'gift' && income.message ? `
                    <div class="mt-4">
                        <span class="text-sm text-gray-600">Message:</span>
                        <p class="mt-1 text-sm text-gray-800">${income.message}</p>
                    </div>
                ` : ''}
            </div>
        </div>
    `;
    return card;
}

// Function to calculate and display income statistics
function displayIncomeStatistics() {
    const totalIncome = mockIncomeData.reduce((sum, transaction) => sum + transaction.amount, 0);
    const normalIncome = mockIncomeData.filter(t => t.type === 'normal').reduce((sum, t) => sum + t.amount, 0);
    const giftIncome = mockIncomeData.filter(t => t.type === 'gift').reduce((sum, t) => sum + t.amount, 0);

    document.getElementById('totalIncome').textContent = `Rp ${totalIncome}`;
    document.getElementById('totalTransactions').textContent = mockIncomeData.length;
    document.getElementById('normalIncome').textContent = `Rp ${normalIncome}`;
    document.getElementById('giftIncome').textContent = `Rp ${giftIncome}`;

    // Update the chart
    updateIncomeChart(normalIncome, giftIncome);
}

// Function to apply dynamic animation delays
function applyDynamicAnimationDelays() {
    const incomeCards = document.querySelectorAll('.income-card');
    const delayIncrement = 0.1;
    const maxDelay = 0.5;

    incomeCards.forEach((card, index) => {
        const delay = Math.min(delayIncrement * (index + 1), maxDelay);
        card.style.animationDelay = `${delay}s`;
    });
}

// Function to display income cards
function displayIncomeCards(data) {
    const incomeCardsContainer = document.getElementById('incomeCards');
    incomeCardsContainer.innerHTML = ''; // Clear existing cards
    data.forEach(income => {
        const card = createIncomeCard(income);
        incomeCardsContainer.appendChild(card);
    });
    
    // Apply dynamic animation delays after cards are added
    applyDynamicAnimationDelays();
}

// Function to filter and display income data
function filterAndDisplayIncome(filter) {
    let filteredData;
    if (filter === 'all') {
        filteredData = mockIncomeData;
    } else {
        filteredData = mockIncomeData.filter(income => income.type === filter);
    }
    displayIncomeCards(filteredData);
    updateActiveFilter(filter);
    // Call displayIncomeStatistics without parameters to always use all data
    displayIncomeStatistics();
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

// Function to update the income distribution chart
function updateIncomeChart(normalIncome, giftIncome) {
    const ctx = document.getElementById('incomeChart').getContext('2d');
    
    if (window.incomeChart instanceof Chart) {
        window.incomeChart.destroy();
    }

    window.incomeChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Normal Income', 'Gift Income'],
            datasets: [{
                data: [normalIncome, giftIncome],
                backgroundColor: ['#3B82F6', '#8B5CF6'],
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
    displayIncomeStatistics();
    filterAndDisplayIncome('all');

    // Add event listeners to filter buttons
    document.getElementById('allFilter').addEventListener('click', () => filterAndDisplayIncome('all'));
    document.getElementById('normalFilter').addEventListener('click', () => filterAndDisplayIncome('normal'));
    document.getElementById('giftFilter').addEventListener('click', () => filterAndDisplayIncome('gift'));
});

