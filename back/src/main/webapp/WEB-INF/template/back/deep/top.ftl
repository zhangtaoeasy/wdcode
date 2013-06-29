<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title><@s.text name="welcome" /><@s.text name="use" /><@s.text name="title" /></title>
<style type="text/css">
body{
	font-family: "微软雅黑","Arial";
}
span{
	cursor: pointer;
}
.div1{
	width: 103%;height: 108px;background-image: url("${base }/back/${themeBack}/img/h4.png");margin: -8px -20px 0px -8px;
}
.div2{
}
.title{
	color: #EEE;font-family: "黑体";font-size: 30px;padding-left: 100px;padding-top: 20px;font-weight: 600;
	text-shadow: 2px 2px 0px #444;
}
.time{
	margin-top: 30px;margin-left: 3%;font-size: 12px;color: white;
}
</style> 
  </head>
  
  <body>
  	<div class="div1">
	    <div class="div2">
	    	<div class="title"><@s.text name="titles" /></div>
	    </div>
	   	<div class="time">
	   		<script type="text/javascript">
				var weekDayLabels = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
				var now = new Date();
				var year=now.getFullYear();
				var month=now.getMonth()+1;
				var day=now.getDate();
				var currentime = "${token.name}，欢迎你！ 今天是"+year+"年"+month+"月"+day+"日 "+weekDayLabels[now.getDay()] 
				+ " <a href='<@s.url action="logout"/>' target='_parent'>| 退出</a>";
				document.write(currentime);
			</script> 
	   	</div>
  	</div>
  </body>
</html> 