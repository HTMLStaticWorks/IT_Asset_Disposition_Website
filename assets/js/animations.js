document.addEventListener('DOMContentLoaded', () => {
    gsap.registerPlugin(ScrollTrigger);

    // Initial fade in for hero sections
    gsap.from(".hero-content > *", {
        y: 30,
        opacity: 0,
        duration: 0.8,
        stagger: 0.2,
        ease: "power2.out",
        delay: 0.1
    });

    // Fade up sections on scroll
    const fadeUpElements = document.querySelectorAll('.fade-up');
    fadeUpElements.forEach((el) => {
        gsap.from(el, {
            scrollTrigger: {
                trigger: el,
                start: "top 85%",
                toggleActions: "play none none none"
            },
            y: 40,
            opacity: 0,
            duration: 0.8,
            ease: "power2.out"
        });
    });

    // Staggered cards
    const cardContainers = document.querySelectorAll('.row'); // Target rows for staggering children
    cardContainers.forEach((container) => {
        const cards = container.querySelectorAll('.card, .stagger-item');
        if (cards.length > 0) {
            gsap.from(cards, {
                scrollTrigger: {
                    trigger: container,
                    start: "top 80%"
                },
                y: 40,
                opacity: 0,
                duration: 0.6,
                stagger: 0.15,
                ease: "power2.out"
            });
        }
    });

    // Stats counter (simple animation)
    const stats = document.querySelectorAll('.stat-number');
    stats.forEach(stat => {
        let value = stat.innerText;
        gsap.from(stat, {
            scrollTrigger: {
                trigger: stat,
                start: "top 90%"
            },
            innerText: 0,
            duration: 2,
            snap: { innerText: 1 },
            ease: "power1.out",
            onUpdate: function() {
                // Formatting back if it had a '%' or '+'
                if(value.includes('+')) {
                    stat.innerText = stat.innerText + '+';
                } else if(value.includes('%')) {
                    stat.innerText = stat.innerText + '%';
                }
            }
        });
    });
});
