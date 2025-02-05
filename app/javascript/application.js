// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('DOMContentLoaded', function() {
    // Handle sidebar navigation
    document.querySelectorAll('.nav-link').forEach(link => {
      link.addEventListener('click', function(e) {
        e.preventDefault();
        
        // Remove active class from all links and sections
        document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
        document.querySelectorAll('.dashboard-section').forEach(s => s.classList.add('hidden'));
        
        // Add active class to clicked link
        this.classList.add('active');
        
        // Show corresponding section
        const target = this.getAttribute('href');
        document.querySelector(target).classList.remove('hidden');
      });
    });
  });