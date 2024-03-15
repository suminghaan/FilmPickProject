$(".ag_empty_btn").each(function (index, el) {
    $(el).click(function () {
        // 누른 버튼 display none으로
        $(el).parent().css("display", "none");
        // 숨겨진 버튼 display block
        $(el).parent().prev().css("display", "block");

        // 빈 좋아요 버튼을 눌러서 좋아요 표시를 하면 싫어요 버튼을 비활성화로
        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_down").find(".ag_disag_btn").each(function (i, e) {
            $(e).addClass("disabled");
            $(e).css("pointer-events", "none")
        })
    })
})

$(".ag_filled_btn").each(function (index, el) {
    console.log($(el));
    $(el).click(function () {
        // 누른 버튼 display none으로
        $(el).parent().css("display", "none");
        // 숨겨진 버튼 display block
        $(el).parent().next().css("display", "block");

        // 꽉찬 좋아요 버튼을 눌러서 좋아요 표시를 제거하면 싫어요 버튼을 활성화로
        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_down").find(".ag_disag_btn").each(function (i, e) {
            $(e).removeClass("disabled");
            $(e).css("pointer-events", "auto")
        })
    })
})

$(".disag_empty_btn").each(function (index, el) {
    $(el).click(function () {
        // 누른 버튼 display none으로
        $(el).parent().css("display", "none");
        // 숨겨진 버튼 display block
        $(el).parent().prev().css("display", "block");

        // 빈 싫어요 버튼을 눌러서 싫어요 표시를 하면 좋아요 버튼을 비활성화로
        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_up").find(".ag_disag_btn").each(function (i, e) {
            $(e).addClass("disabled");
            $(e).css("pointer-events", "none")
        })
    })
})


$(".disag_filled_btn").each(function (index, el) {
    $(el).click(function () {
        // 누른 버튼 display none으로
        $(el).parent().css("display", "none");
        // 숨겨진 버튼 display block
        $(el).parent().next().css("display", "block");

        // 꽉찬 싫어요 버튼을 눌러서 싫어요 표시를 제거하면 좋아요 버튼을 활성화로
        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_up").find(".ag_disag_btn").each(function (i, e) {
            $(e).removeClass("disabled");
            $(e).css("pointer-events", "auto")
        })
    })
})