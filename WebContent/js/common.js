$(function(){
	$("#gnb_menu img").click(function() {
		$("html, body").css("overflow","hidden");
		$("#gnb_menu_open").fadeIn();
	});
	$("#gnb_menu_open_title img").click(function() {
		$("html, body").css("overflow","unset");
		$("#gnb_menu_open").hide();
	});
	$("#gnb_menu_open span").click(function() {
		$("#gnb_menu_open span").removeClass("gnb_menu_on");
		$("#gnb_menu_open span").find("~div").stop().slideUp(300);
		$(this).addClass("gnb_menu_on");
		$(this).find("~div").stop().slideDown(300);
	});
});
function logout(){
	$.ajax({
		type 	: "GET",
		url		: "/ActionLogout",
		success : function(data){
			alert("로그아웃 되었습니다.");
			location.reload();
		} 
	});
}
$(document).on({
    "contextmenu": function(e) {
        console.log("ctx menu button:", e.which); 
        if(e.which == 3){
        	e.preventDefault();
        }
    }
});