document.addEventListener('DOMContentLoaded', () => {
    const rtlToggleBtn = document.getElementById('rtl-toggle');
    const htmlElement = document.documentElement;

    // Check for saved RTL state
    const savedRTL = localStorage.getItem('rtl') === 'true';
    if (savedRTL) {
        setRTL(true);
    }

    if (rtlToggleBtn) {
        rtlToggleBtn.addEventListener('click', () => {
            const isRTL = htmlElement.getAttribute('dir') === 'rtl';
            setRTL(!isRTL);
        });
    }

    function setRTL(isRTL) {
        if (isRTL) {
            htmlElement.setAttribute('dir', 'rtl');
            htmlElement.setAttribute('lang', 'ar'); // Default to Arabic for RTL testing
            localStorage.setItem('rtl', 'true');
            if (rtlToggleBtn) {
                rtlToggleBtn.innerHTML = '<i class="bi bi-translate"></i> LTR';
            }
        } else {
            htmlElement.setAttribute('dir', 'ltr');
            htmlElement.setAttribute('lang', 'en');
            localStorage.setItem('rtl', 'false');
            if (rtlToggleBtn) {
                rtlToggleBtn.innerHTML = '<i class="bi bi-translate"></i> RTL';
            }
        }
    }
});
