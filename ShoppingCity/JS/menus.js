$(function () {
    $(function () {
        $(".nav>li").mouseover(function () {
            $(this).find("ul").css("display", "block");
        });
        $(".nav>li").mouseout(function () {
            $(this).find("ul").css("display", "none");
        });
    });
});