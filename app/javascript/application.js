// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  const btn = document.querySelector(".checkout-btn");
  const flash = document.getElementById("flash-message");

  if (btn && flash) {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      flash.classList.remove("hidden");
    });
  }
});
