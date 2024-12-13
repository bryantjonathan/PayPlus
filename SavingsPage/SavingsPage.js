document.addEventListener("DOMContentLoaded", () => {
    const savingsForm = document.getElementById("savingsForm");
    const addSavingsButton = document.getElementById("addSavingsButton");
    const savingsContainer = document.getElementById("savingsContainer");
    const totalSavings = document.getElementById("totalSavings");
    const savingsCollected = document.getElementById("savingsCollected");

    let savingsList = [];

    // Toggle form visibility
    addSavingsButton.addEventListener("click", () => {
        savingsForm.classList.toggle("hidden");
    });

    // Add savings
    savingsForm.addEventListener("submit", (e) => {
        e.preventDefault();

        const title = document.getElementById("savingsTitle").value;
        const description = document.getElementById("savingsDescription").value;
        const target = parseFloat(document.getElementById("savingsTarget").value);
        const collected = parseFloat(document.getElementById("savingsCollectedInput").value) || 0;

        if (title && target && !isNaN(target)) {
            const newSaving = { title, description, target, collected };
            savingsList.push(newSaving);

            updateSavingsUI();

            // Reset form
            savingsForm.reset();
            savingsForm.classList.add("hidden");
        }
    });

    function updateSavingsUI() {
        // Clear current savings display
        savingsContainer.innerHTML = "";

        let totalTarget = 0;
        let totalCollected = 0;

        // Render each saving
        savingsList.forEach((saving) => {
            const savingElement = document.createElement("div");
            savingElement.className = "p-4 bg-white rounded-lg shadow mb-4";
            savingElement.innerHTML = `
                <h3 class="text-lg font-bold text-gray-800">${saving.title}</h3>
                <p class="text-gray-600">${saving.description}</p>
                <p class="text-gray-800 font-semibold">Target: Rp ${saving.target.toLocaleString()}</p>
                <p class="text-green-500 font-semibold">Collected: Rp ${saving.collected.toLocaleString()}</p>
            `;
            savingsContainer.appendChild(savingElement);

            totalTarget += saving.target;
            totalCollected += saving.collected;
        });

        // Update summary
        totalSavings.textContent = `Rp ${totalTarget.toLocaleString()}`;
        savingsCollected.textContent = `Rp ${totalCollected.toLocaleString()}`;
    }
});