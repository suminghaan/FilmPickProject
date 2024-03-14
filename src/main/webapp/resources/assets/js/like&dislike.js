if(!($(".like_btn").is("disabled"))) {
    $(".like_filled").click(function () {
    $(".like_filled").css('display', "none")
    $(".like_filled").css('z-index', "0")
    $(".dislike_btn").removeClass("disabled");
})
$(".like_empty").click(function () {
    if ($(".dislike_filled").css("display") == "none") {
        $(".like_filled").css('display', "block")
        $(".like_filled").css('z-index', "10")
        $(".dislike_btn").addClass("disabled");
    }
})
}

if(!($(".dislike_btn").is("disabled"))) {
    $(".dislike_filled").click(function () {
    $(".dislike_filled").css('display', "none")
    $(".dislike_filled").css('z-index', "0")
    $(".like_btn").removeClass("disabled");
})
$(".dislike_empty").click(function () {
    if ($(".like_filled").css("display") == "none") {
        $(".dislike_filled").css('display', "block")
        $(".dislike_filled").css('z-index', "10")
        $(".like_btn").addClass("disabled");
    }
})
}