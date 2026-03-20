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

    // Mobile Dropdown toggles
    const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
    dropdownToggles.forEach(toggle => {
        toggle.addEventListener('click', (e) => {
            if (window.innerWidth <= 1024) {
                e.preventDefault();
                const menu = toggle.nextElementSibling;
                if (menu.style.display === 'block') {
                    menu.style.display = 'none';
                    toggle.querySelector('i').classList.replace('bi-chevron-up', 'bi-chevron-down');
                } else {
                    menu.style.display = 'block';
                    toggle.querySelector('i').classList.replace('bi-chevron-down', 'bi-chevron-up');
                }
            }
        });
    });
});
