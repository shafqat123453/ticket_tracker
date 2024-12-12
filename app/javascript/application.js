// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("DOMContentLoaded", function () {
  const firstLink = document.getElementById("first_link");
  const secondLink = document.getElementById("second_link");

  // When the first link is clicked, hide it and show the second link
  firstLink.addEventListener("click", function (event) {
    event.preventDefault(); // Prevent the default link behavior

    firstLink.style.display = "none"; // Hide the first link
    secondLink.style.display = "inline"; // Show the second link
  });

  // When the second link is clicked, hide it and show the first link
  secondLink.addEventListener("click", function (event) {
    event.preventDefault(); // Prevent the default link behavior

    secondLink.style.display = "none"; // Hide the second link
    firstLink.style.display = "inline"; // Show the first link
  });
});
document.addEventListener("DOMContentLoaded", function () {
  const hoursInput = document.getElementById("hours-input");
  const hoursDisplay = document.getElementById("hours-display");

  hoursInput.addEventListener("input", function () {
    const decimalHours = parseFloat(hoursInput.value);
    if (!isNaN(decimalHours)) {
      const hours = Math.floor(decimalHours);
      const minutes = Math.round((decimalHours - hours) * 60);
      hoursDisplay.textContent = `${hours} hour${
        hours !== 1 ? "s" : ""
      } ${minutes} minute${minutes !== 1 ? "s" : ""}`;
    } else {
      hoursDisplay.textContent = ""; // Clear display if input is invalid
    }
  });
});
