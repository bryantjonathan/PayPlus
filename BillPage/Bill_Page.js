document.addEventListener('DOMContentLoaded', () => {
    feather.replace();

    // Profile dropdown functionality
    const profilePhoto = document.getElementById('profilePhoto');
    const profileDropdown = document.getElementById('profileDropdown');

    profilePhoto.addEventListener('click', function (event) {
        event.stopPropagation();
        profileDropdown.classList.toggle('show');
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function (event) {
        if (!profileDropdown.contains(event.target) && event.target !== profilePhoto) {
            profileDropdown.classList.remove('show');
        }
    });

    // Function to format the amount with commas
    function formatAmount(amount) {
        return 'Rp ' + parseFloat(amount).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    }

    // Function to format the due date
    function formatDueDate(dueDate) {
        const options = { month: 'short', day: 'numeric', year: 'numeric' };
        const date = new Date(dueDate);
        return date.toLocaleDateString('en-US', options);
    }

    // Get elements
    const addBillForm = document.getElementById('addBillForm');
    const billList = document.getElementById('billList');

    // Event listener for adding a bill
    addBillForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const billName = document.getElementById('billName').value;
        const amount = document.getElementById('amount').value;
        const dueDate = document.getElementById('dueDate').value;
        const category = document.getElementById('category').value;

        const billItem = document.createElement('li');
        billItem.classList.add('bill-item');

        // Determine the icon based on the category
        let icon;
        if (category === 'rent') {
            icon = `<i data-feather="home" class="mr-3 text-gray-500"></i>`;
        } else if (category === 'electricity') {
            icon = `<i data-feather="zap" class="mr-3 text-gray-500"></i>`;
        } else if (category === 'internet') {
            icon = `<i data-feather="wifi" class="mr-3 text-gray-500"></i>`;
        }

        // Add the content to the bill item
        billItem.innerHTML = `
            <div class="flex items-center">
                ${icon}
                <span class="text-gray-700">${billName}</span>
            </div>
            <div class="bill-info">
                <div class="flex flex-col items-end">
                    <p class="amount text-gray-700">${formatAmount(amount)}</p>
                    <p class="due-date text-sm">Due on ${formatDueDate(dueDate)}</p>
                </div>
                <button class="delete-btn">
                    <i data-feather="trash-2"></i>
                </button>
            </div>
        `;
        
        // Append the bill item to the list
        billList.appendChild(billItem);

        // Replace feather icons after appending
        feather.replace();

        // Clear the form
        addBillForm.reset();
    });

    // Delete Bill Item
    billList.addEventListener('click', function (event) {
        if (event.target.closest('button')) {
            const billItem = event.target.closest('li');
            billItem.remove();
        }
    });
    
    // Create the notification container
    const notificationContainer = document.createElement('div');
    notificationContainer.className = 'notification-container';
    document.body.appendChild(notificationContainer);

    // Function to show styled notifications
    const showNotification = (type, title, message) => {
    const notification = document.createElement('div');
    notification.className = `notification-card ${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <h4>${title}</h4>
            <p>${message}</p>
        </div>
        <button onclick="this.parentElement.remove()">×</button>`;
    notificationContainer.appendChild(notification);

    // Auto-hide notification after 5 seconds
    setTimeout(() => {
        notification.style.opacity = '0';
        notification.style.transform = 'translateY(20px)';
        setTimeout(() => notification.remove(), 300);
    }, 5000);
    };

    // Function to check reminders for bills
    const checkAllReminders = () => {
    const billItems = document.querySelectorAll('.bill-item');
    const now = new Date();

    billItems.forEach((billItem) => {
        const dueDateText = billItem.querySelector('.due-date').textContent.replace('Due on ', '');
        const dueDate = new Date(dueDateText);

        const diffInDays = Math.ceil((dueDate - now) / (1000 * 60 * 60 * 24));

        // Menampilkan notifikasi untuk tagihan yang hampir jatuh tempo atau overdue
        const billName = billItem.querySelector('.text-gray-700').textContent;

        if (diffInDays <= 2 && diffInDays >= 0) {
            // Reminder untuk tagihan yang hampir jatuh tempo
            showNotification('reminder', 'Reminder', `Your bill for "${billName}" is due in ${diffInDays} day(s)!`);
        } else if (diffInDays < 0) {
            // Overdue untuk tagihan yang lewat jatuh tempo
            showNotification('overdue', 'Overdue', `Your bill for "${billName}" was due ${Math.abs(diffInDays)} day(s) ago!`);

            // Menandai tagihan yang overdue dengan kelas 'overdue' dan merubah warna nama bill
            billItem.classList.add('overdue');
        } else {
            // Hapus kelas 'overdue' jika tagihan sudah tidak overdue
            billItem.classList.remove('overdue');
        }
    });
    };

    // Interval to check reminders every minute
    setInterval(checkAllReminders, 60000);

    // Run reminder check once on page load
    checkAllReminders();

});
