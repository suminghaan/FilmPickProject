// $(".review_btn>button").each(function(idx, el) {
//     $(el).mouseenter(function() {
//         $(el).children().addClass("fa-bounce");
//     })
//     $(el).mouseout(function() {
//         $(el).children().removeClass("fa-bounce");
//     })
// })

$(".review_btn>button>i").each(function(idx, el) {
    $(el).mouseenter(function() {
        $(el).addClass("fa-bounce");
    })
    $(el).mouseout(function() {
        $(el).removeClass("fa-bounce");
    })
})