document.addEventListener('DOMContentLoaded', function() {
    // Get the element where we want to display scroll position
    var scrollPositionElement = document.getElementById('scrollPosition');

    // Function to update scroll position
    function updateScrollPosition() {
        var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
        // Divide scroll position by 500
        var dividedScrollPosition = ((scrollPosition / 500)-0.6).toFixed(2);;
                // Check if scroll position is less than 0
        if (dividedScrollPosition < 0.01) {
            dividedScrollPosition = 0; // Set scroll position to 0
        }
        scrollPositionElement.textContent = dividedScrollPosition + ' MILLION YEARS AGO';
    }

    // Update scroll position when the user scrolls
    window.addEventListener('scroll', updateScrollPosition);

    // Initial update
    updateScrollPosition();
});
