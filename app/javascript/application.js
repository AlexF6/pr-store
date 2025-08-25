// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector(".checkout-btn");
  const flash = document.getElementById("flash-message");

  if (btn && flash) {
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      // mostrar mensaje
      flash.classList.remove("hidden");

      // ocultar después de 3 segundos
      setTimeout(() => {
        flash.classList.add("hidden");
      }, 3000);
    });
  }
});