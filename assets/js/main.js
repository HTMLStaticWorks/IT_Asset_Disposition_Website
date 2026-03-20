document.addEventListener('DOMContentLoaded', () => {
    // Mobile navigation toggle
    const menuBtn = document.getElementById('mobile-menu-btn');
    const navWrapper = document.querySelector('.nav-wrapper');
    if (menuBtn && navWrapper) {
        menuBtn.addEventListener('click', () => {
            navWrapper.classList.toggle('show');
            const icon = menuBtn.querySelector('i');
            if (navWrapper.classList.contains('show')) {
                icon.classList.remove('bi-list');
                icon.classList.add('bi-x-lg');
            } else {
                icon.classList.remove('bi-x-lg');
                icon.classList.add('bi-list');
            }
        });
    }

  // Active Menu Highlighting
  const currentPath = window.location.pathname.split('/').pop() || 'index.html';
  const navLinks = document.querySelectorAll('.nav-links a');

  navLinks.forEach(link => {
    const href = link.getAttribute('href');
    if (!href || href === '#') return;

    let isActive = false;
    
    // Exact match
    if (href === currentPath) {
      isActive = true;
    } 
    // Logical matches for sub-pages
    else if (currentPath.startsWith('blog-') && href === 'blog.html') {
      isActive = true;
    }
    else if (currentPath.startsWith('service-') && href === 'services.html') {
      isActive = true;
    }
    else if (currentPath === 'home-2.html' && href === 'index.html') {
      // If we're on Home 2, Home 1 link shouldn't be active if we're on Home 2
      // Actually, both are under the Home dropdown. 
      // If we're on home-2.html, index.html link is NOT active, but the dropdown toggle will be.
      isActive = false; 
    }

    if (isActive) {
      link.classList.add('active');
      
      // If the link is inside a dropdown, highlight the toggle too
      const dropdown = link.closest('.dropdown');
      if (dropdown) {
        const toggle = dropdown.querySelector('.dropdown-toggle');
        if (toggle) toggle.classList.add('active');
      }
    }
  });

  // Mobile Dropdown toggles
  const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
  dropdownToggles.forEach(toggle => {
      toggle.addEventListener('click', (e) => {
          if (window.innerWidth <= 1024) {
              const menu = toggle.nextElementSibling;
              
              // If it's the toggle and we're not just clicking through to a page
              if (toggle.getAttribute('href') === '#') {
                e.preventDefault();
              }
              
              if (menu.style.display === 'block') {
                  menu.style.display = 'none';
                  const icon = toggle.querySelector('i');
                  if (icon) icon.classList.replace('bi-chevron-up', 'bi-chevron-down');
              } else {
                  menu.style.display = 'block';
                  const icon = toggle.querySelector('i');
                  if (icon) icon.classList.replace('bi-chevron-down', 'bi-chevron-up');
              }
          }
      });
  });
});
