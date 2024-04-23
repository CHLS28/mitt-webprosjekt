function toggleImageSize(image) {
    if (image.classList.contains('enlarge')) {
        image.classList.remove('enlarge');
    } else {
        image.classList.add('enlarge');
    }
}

document.addEventListener("DOMContentLoaded", function() {
    const images = document.querySelectorAll(".galleri img");

    images.forEach(img => {
        img.addEventListener("click", function() {
            if (this.classList.contains("enlarge")) {
                this.classList.remove("enlarge");
            } else {
                this.classList.add("enlarge");
            }
        });
    });
});