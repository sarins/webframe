// JavaScript Document
$(document).ready(function(){
	$("span.toggle a").live("click",function(){
		$(".widgetContainer,.editePageBtn").toggle();
		$(this).toggleClass("active");
	});

	//page'height
	var height = $(".rightContainer").height();
	$(".leftMenu").css("height",height+"px");
	$(".switch").css("height",height+"px");

	//switch function
	$(".switch img").toggle(
		function(){
			$(".leftMenu").hide();
			$(this).attr("src",globalUrl+"images/switchLeft.jpg");
		},
		function(){
			$(".leftMenu").show();
			$(this).attr("src",globalUrl+"images/switchRight.jpg");
		}
	);
	/*
	$(".middleNav ul li a").unbind().click(function(){
		$(".middleNav ul li a").removeClass("current");
		$(".middleNav ul li").removeClass("active");
		$(this).addClass("current");
		$(this).parent().addClass("active");
		$(".leftMenu").showLoading();
		var menuName = $(this).attr("rel");
		$(".leftMenu").load("leftMenu/"+menuName+".html",function(responseText,textStatus){
			if(textStatus == "success"){
				$(".leftMenu").hideLoading();
			}
		});
	});
	*/

	//menu function
	$('li.button a').click(function (e) {
		 var dropDown = $(this).parent().next();
		 $('.dropdown').not(dropDown).slideUp('slow');
		 dropDown.slideToggle('slow');
		 e.preventDefault();
	})

	//load pages
	/*
	$(".leftMenu ul li.button").unbind().live("click",function(){
		var length =$(this).next(".dropdown").length;
		if(length == 0){
			var relName = $(this).find("a").attr("rel");
			$(".rightContent").showLoading();
			$(".rightContent").load("pages/"+relName+".html",function(responseText,textStatus){
				if(textStatus == "success"){
					$(".rightContent").hideLoading();
				}
			});
			return false;
		}else if(length > 0){
			$("li.dropdown ul li a").unbind().live("click",function(){
				var relName = $(this).attr("rel");
				$(".rightContent").showLoading();
				$(".rightContent").load("pages/"+relName+".html",function(responseText,textStatus){
					if(textStatus == "success"){
						$(".rightContent").hideLoading();
					}
				});
			});
			return false;
		}
	});
	*/
/*
	$(".addBtn").live("click",function(){
		var idName = $(this).attr("id");
		$(".rightContent").showLoading();
		$(".rightContent").load("pages/"+idName+".html",function(responseText,textStatus){
			if(textStatus == "success"){
				$(".rightContent").hideLoading();
			}
		});
	});
	$("a.editLink").live("click",function(){
		var linkName = $(this).attr("rel");
		$(".rightContent").showLoading();
		$(".rightContent").load("pages/"+linkName+".html",function(responseText,textStatus){
			if(textStatus == "success"){
				$(".rightContent").hideLoading();
			}
		});
	});*/

});

function getInitModule(targetUrl,guideTitle){
	getData(targetUrl,'','workspace',null,function(data,flag){
		if(flag==1){
			$('#moduleTitle').html(guideTitle);
		}
		});
}
function getTabPage(targetUrl){
	getData(targetUrl,'','workspace');
}