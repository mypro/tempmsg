<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="navbar-buttons navbar-header pull-right" role="navigation">
	<ul class="nav ace-nav">
		<li class="light-blue"> <span class="user-info"> 欢迎 </li>
		<li class="grey"><a href="logout.do"> <i
				class="ace-icon fa fa-power-off"></i> 登出
		</a></li>
	</ul>
</div>
<script src="http://ajax.useso.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	//$(window).bind('beforeunload', function() {
	//alert();
	//             if (typeof evt == 'undefined') {  
	//                 evt = window.event;  
	//             }  
	//             if (evt) {  
	//                 var n = window.event.screenX - window.screenLeft;   
	//                 var b = n > document.documentElement.scrollWidth-20;  

	//                 if(b && window.event.clientY < 0 || window.event.altKey){  
	//                     // 这个可以排除刷新 关闭的时候触发  
	//                 }   
	//             }  
	//});

	// 	$(window).bind('beforeunload', function(evt) {
	// 		if (typeof evt == 'undefined') {
	// 			evt = window.event;
	// 			return '1111111111';
	// 		}
	// 		if (evt) {
	// 			var n = window.event.screenX - window.screenLeft;
	// 			var b = n > document.documentElement.scrollWidth - 20;

	// 			if (b && window.event.clientY < 0 || window.event.altKey) {
	// 				// 这个可以排除刷新 关闭的时候触发  
	// 				return '333333333333333';
	// 			}
	// 			return '22222222';
	// 		}

	// 	});
</script>
