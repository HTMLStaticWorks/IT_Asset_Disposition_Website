document.addEventListener('DOMContentLoaded', () => {
    gsap.registerPlugin(ScrollTrigger);

    // Initial fade in for hero sections
    gsap.fromTo(".hero-content > *", 
        { y: 30, opacity: 0 },
        {
            y: 0,
            opacity: 1,
            duration: 0.8,
            stagger: 0.2,
            ease: "power2.out",
            delay: 0.1,
            clearProps: "all"
        }
    );

    // Fade up sections on scroll
    const fadeUpElements = document.querySelectorAll('.fade-up');
    fadeUpElements.forEach((el) => {
        gsap.fromTo(el, 
            { y: 40, opacity: 0 },
            {
                scrollTrigger: {
                    trigger: el,
                    start: "top 85%",
                    toggleActions: "play none none none"
                },
                y: 0,
                opacity: 1,
                duration: 0.8,
                ease: "power2.out",
                clearProps: "opacity,transform"
            }
        );
    });

    // Staggered cards
    const cardContainers = document.querySelectorAll('.row, .stagger-cards'); // Ensure container targets are broad enough
    cardContainers.forEach((container) => {
        const cards = container.querySelectorAll('.card, .stagger-item');
        if (cards.length > 0) {
            gsap.fromTo(cards, 
                { y: 40, opacity: 0 },
                {
                    scrollTrigger: {
                        trigger: container,
                        start: "top 85%"
                    },
                    y: 0,
                    opacity: 1,
                    duration: 0.6,
                    stagger: 0.15,
                    ease: "power2.out",
                    clearProps: "opacity,transform"
                }
            );
        }
    });

    // Stats counter (robust animation handling suffixes)
    const stats = document.querySelectorAll('.stat-number');
    stats.forEach(stat => {
        let valueStr = stat.innerText.trim();
        let targetNum = parseFloat(valueStr.replace(/[^0-9.]/g, '')) || 0;
        let suffix = valueStr.replace(/[0-9.]/g, '');
        
        let counter = { val: 0 };
        gsap.to(counter, {
            scrollTrigger: {
                trigger: stat,
                start: "top 90%"
            },
            val: targetNum,
            duration: 2,
            ease: "power1.out",
            onUpdate: function() {
                stat.innerText = Math.floor(counter.val) + suffix;
            }
        });
    });
});
