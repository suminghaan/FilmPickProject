const reviewBtn = document.querySelector(".review_btn>button");
const reviewBtnIcon = document.querySelector(".review_btn>button>i");

reviewBtn.addEventListener("mouseenter", function () {
    reviewBtnIcon.className += " fa-bounce";
})

reviewBtn.addEventListener("mouseout", function () {
    reviewBtnIcon.classList.remove("fa-bounce");
})

reviewBtnIcon.addEventListener("mouseenter", function () {
    reviewBtnIcon.className += " fa-bounce";
})

reviewBtnIcon.addEventListener("mouseout", function () {
    reviewBtnIcon.classList.remove("fa-bounce");
})