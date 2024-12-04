// Mock data
const mockData = {
    totalSavings: 15000,
    incomeData: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        data: [3000, 3500, 3200, 3800, 3600, 4000]
    },
    expenseData: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        data: [2000, 2200, 1800, 2500, 2300, 2100]
    },
    bills: [
        { name: 'Rent', amount: 1200, dueDate: '2023-07-01' },
        { name: 'Electricity', amount: 80, dueDate: '2023-07-15' },
        { name: 'Internet', amount: 50, dueDate: '2023-07-20' }
    ],
    savingsGoals: [
        { name: 'Emergency Fund', current: 5000, target: 10000 },
        { name: 'Vacation', current: 2000, target: 5000 }
    ],
    transfers: [
        { date: '2023-06-28', from: 'Checking', to: 'Savings', amount: 500 },
        { date: '2023-06-25', from: 'Savings', to: 'Investment', amount: 1000 },
        { date: '2023-06-20', from: 'Checking', to: 'Bills', amount: 300 }
    ]
};

// Function to format currency
function formatCurrency(amount) {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(amount);
}

// Function to create a chart
function createChart(ctx, label, labels, data) {
    return new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: label,
                data: data,
                borderColor: label === 'Income' ? 'rgb(75, 192, 192)' : 'rgb(255, 99, 132)',
                tension: 0.1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

// Function to create a progress bar
function createProgressBar(current, target) {
    const percentage = (current / target) * 100;
    return `
        <div class="w-full bg-gray-200 rounded-full h-2.5 mb-4 dark:bg-gray-700">
            <div class="bg-blue-600 h-2.5 rounded-full" style="width: ${percentage}%"></div>
        </div>
    `;
}

// Initialize dashboard
// Keep all existing mock data and functions at the top

// Single DOMContentLoaded event handler
document.addEventListener('DOMContentLoaded', function() {
    // Set total savings
    document.getElementById('totalSavings').textContent = formatCurrency(mockData.totalSavings);

    // Create charts
    createChart(document.getElementById('incomeChart').getContext('2d'), 'Income', mockData.incomeData.labels, mockData.incomeData.data);
    createChart(document.getElementById('expenseChart').getContext('2d'), 'Expenses', mockData.expenseData.labels, mockData.expenseData.data);

    // Populate bill reminders
    const billList = document.getElementById('billList');
    mockData.bills.forEach(bill => {
        const li = document.createElement('li');
        li.className = 'flex justify-between items-center';
        li.innerHTML = `
            <span>${bill.name}</span>
            <span>${formatCurrency(bill.amount)} due on ${bill.dueDate}</span>
        `;
        billList.appendChild(li);
    });

    // Populate savings goals
    const savingsGoals = document.getElementById('savingsGoals');
    mockData.savingsGoals.forEach(goal => {
        const div = document.createElement('div');
        div.className = 'mb-4';
        div.innerHTML = `
            <div class="flex justify-between mb-1">
                <span>${goal.name}</span>
                <span>${formatCurrency(goal.current)} / ${formatCurrency(goal.target)}</span>
            </div>
            ${createProgressBar(goal.current, goal.target)}
        `;
        savingsGoals.appendChild(div);
    });

    // Populate transfers
    const transferList = document.getElementById('transferList');
    mockData.transfers.forEach(transfer => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td class="px-6 py-4 whitespace-nowrap">${transfer.date}</td>
            <td class="px-6 py-4 whitespace-nowrap">${transfer.from}</td>
            <td class="px-6 py-4 whitespace-nowrap">${transfer.to}</td>
            <td class="px-6 py-4 whitespace-nowrap">${formatCurrency(transfer.amount)}</td>
        `;
        transferList.appendChild(tr);
    });
    // Initialize Feather icons first
    feather.replace();
    
    const profilePhoto = document.getElementById('profilePhoto');
    const profileDropdown = document.getElementById('profileDropdown');

    if (profilePhoto && profileDropdown) {
        profilePhoto.addEventListener('click', function(event) {
            event.stopPropagation();
            profileDropdown.classList.toggle('show');
        });

        document.addEventListener('click', function(event) {
            if (!profileDropdown.contains(event.target) && event.target !== profilePhoto) {
                profileDropdown.classList.remove('show');
            }
        });
    }
});


