function controlMove(con_id,left_id,right_id,speed){
	var con,leftBtn,rightBtn,list,items,timer,widthAll,direction;
	con = document.getElementById(con_id);
	leftBtn = document.getElementById(left_id);
	rightBtn = document.getElementById(right_id);
	list = getChildNodes(con);
	if(list.length == 1){
		list = list[0];
	}else{
		return false;
	}
	list.innerHTML += list.innerHTML;
	list.innerHTML += list.innerHTML;
	items = getChildNodes(list);
	
	widthAll = 0;
	for(var i=0;i<items.length;i++){
		var numLeft,numRight;
		if (!!window.ActiveXObject){
			items[i].style.styleFloat = "left";
			numLeft = items[i].currentStyle["marginLeft"];
			numRight = items[i].currentStyle["marginRight"];
		}else{
			items[i].style.cssFloat = "left";
			numLeft = document.defaultView.getComputedStyle(items[i],null)["marginLeft"];
			numRight = document.defaultView.getComputedStyle(items[i],null)["marginRight"];
		}
		numLeft = parseInt(numLeft, 10);
		numRight = parseInt(numRight, 10);
		numLeft += numRight;
		if(numLeft>0){
			widthAll += numLeft;
		}
		widthAll += items[i].offsetWidth;
	}
	list.style.width = widthAll + "px";
	function scrollLeft(){
		direction = "left";
		if(timer){
			clearInterval(timer);
			timer = null;
		}
		timer = setInterval(_scrollLeft,speed);
	}
	function _scrollLeft(){
		if((con.scrollLeft+2)<(widthAll/2)){
			con.scrollLeft += 2;
		}else{
			con.scrollLeft = 0;
		}
	}
	function scrollRight(){
		direction = "right";
		if(timer){
			clearInterval(timer);
			timer = null;
		}
		timer = setInterval(_scrollRight,speed);
	}
	function _scrollRight(){
		if((con.scrollLeft-2)>0){
			con.scrollLeft -= 2;
		}else{
			con.scrollLeft = (widthAll/2);
		}
	}
	leftBtn.onclick = function(){
		scrollLeft();
	};
	rightBtn.onclick =function(){
		scrollRight();
	};
	scrollLeft();
	con.onmouseover = function(){
		if(timer){
			clearInterval(timer);
			timer = null;
		}
	};
	con.onmouseout = function(){
		if(timer){
			clearInterval(timer);
			timer = null;
		}
		(direction == "left") ? scrollLeft() : scrollRight();
	};
}

//tools
function getChildNodes(obj){
	if(typeof(obj)=="string"){
		obj = document.getElementById(obj);
	}
	var list_1,list_2;
	list_1 = obj.childNodes;
	list_2 = [];
	for(var i=0;i<list_1.length;i++){
		if(list_1[i].nodeType==1){
			list_2[list_2.length] = list_1[i];
		}
	}
	return list_2;
}