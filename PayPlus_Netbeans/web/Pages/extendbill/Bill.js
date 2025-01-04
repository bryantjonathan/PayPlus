document.addEventListener('DOMContentLoaded', () => {
    feather.replace();

    function formatAmount(amount) {
        console.log(`Formatting amount: ${amount}`);
        return 'Rp ' + parseFloat(amount).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,' );
    }

    // Function to format the due date in 'YYYY-MM-DD'
    function formatDueDate(dueDate) {
        const date = new Date(dueDate);
        const formattedDate = date.toISOString().split('T')[0];
        console.log(`Formatted due date: ${formattedDate}`);
        return formattedDate; // Format to 'YYYY-MM-DD'
    }

    // Function to show styled notifications
    const showNotification = (type, title, message) => {
        console.log(`Showing notification - Type: ${type}, Title: ${title}, Message: ${message}`);
        
        const notificationContainer = document.querySelector('.notification-container') || document.createElement('div');
        if (!document.querySelector('.notification-container')) {
            notificationContainer.className = 'notification-container';
            document.body.appendChild(notificationContainer);
            console.log("Notification container created and added to body.");
        }

        const notification = document.createElement('div');
        notification.className = `notification-card ${type}`;
        notification.innerHTML = `
            <div class="notification-content">
                <h4>${title}</h4>
                <p>${message}</p>
            </div>
            <button onclick="this.parentElement.remove()">×</button>`;
        notificationContainer.appendChild(notification);
        console.log(`Notification for "${title}" added to container.`);

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
        console.log(`Checking reminders at: ${now}`);

        billItems.forEach((billItem) => {
            const dueDateText = billItem.querySelector('.due-date').textContent.replace('Due on ', '').trim();
            const dueDate = new Date(dueDateText);
            const diffInDays = Math.floor((dueDate - now) / (1000 * 60 * 60 * 24));

            const billName = billItem.querySelector('.text-gray-700').textContent;

            console.log(`Bill: ${billName}, Due Date: ${dueDateText}, Diff in Days: ${diffInDays}`);

            if (diffInDays <= 2 && diffInDays >= 0) {
                // Reminder untuk tagihan yang hampir jatuh tempo
                showNotification('reminder', 'Reminder', `Your bill for "${billName}" is due in ${diffInDays} day(s)!`);
            } else if (diffInDays < 0) {
                // Overdue untuk tagihan yang lewat jatuh tempo
                showNotification('overdue', 'Overdue', `Your bill for "${billName}" was due ${Math.abs(diffInDays)} day(s) ago!`);

                // Menandai tagihan yang overdue dengan kelas 'overdue'
                billItem.classList.add('overdue');
                console.log(`Bill "${billName}" marked as overdue.`);
            } else {
                // Hapus kelas 'overdue' jika tagihan sudah tidak overdue
                billItem.classList.remove('overdue');
                console.log(`Bill "${billName}" is not overdue anymore.`);
            }
        });
    };

    // Interval to check reminders every minute
    setInterval(() => {
        console.log("Checking reminders...");
        checkAllReminders();
    }, 60000);

    // Run reminder check once on page load
    console.log("Running reminder check on page load");
    checkAllReminders();
});