<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String userCode = request.getParameter("userCode");
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<meta name="viewport" content="width=device-width,height=device-height, user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1,target-densitydpi=device-dpi ">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/common/themes/material/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/common/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/common/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/common/jquery.easyui.min.js"></script>
<script type="text/javascript">

	var baseUrl = "http://192.168.1.7:8080/dbs";
	//var baseUrl = "http://59.110.171.135:8080/dbs";
	var contextPath = "<%=contextPath%>";
	
	var userCode = '<%=userCode%>';
	
	function doReg(){
		var loginName = $.trim($("#loginName").textbox('getValue'));
		
		var password = $.trim($("#password").textbox('getValue'));
		
		if(loginName == '' || password == ''){
			alert("请填写用户名或密码");
			return;
		}
		
		var reg = /^[0-9a-zA-Z]+$/;
		if(!reg.test(loginName)){
			alert("请使用英文或数字作为登录帐号");
			return;
		}
		
		var curUrl = window.location.href;
		var idx = curUrl.indexOf('_rand');
		var rand = '%'+curUrl.substring(idx,idx+19)+'%';
		
		var url = contextPath+"/web/reg2.do";
		var param = {loginName:loginName,password:password,loginId:userCode,url:rand};
		
		$.post(url,param,function(answer){
			if(answer.code == 0){
				alert("注册成功！赶快去应用商店下载APP大家一起分钱吧(或点击下方下载连接按提示操作)");
				
				$("#loginName").textbox("setValue","");
				$("#password").textbox("setValue","");
			}else{
				alert(answer.msg);
			}
		});
		
	}
</script>

<title>分享</title>
</head>
<body style="background:url(/dbs/jsp/images/background.jpg) no-repeat;background-size: cover;padding:0;margin:0;">
	
	<div align=center style="width:100%;font-size: 1rem;">
		
		<div style="width:90%;color: #FFFFFF;margin-top: 20px;">
			一大波赏钱正在接近中
		</div>
		
		<div style="margin-top: 20px; width:40%;height:42%;">
			<img alt="" src="/dbs/jsp/images/envelope.png" width="100%" height="100%">
		</div>
		
		<div style="width:90%;color: #FFFFFF;margin-top: 20px;">
			我在酬裨将回答了一个问题，${requestScope.reward }
		</div>
		<div style="width:90%;color: #FFFFFF;margin-top: 10px;">
			小伙伴们，快来一起分钱吧！
		</div>
		
		<div style="width:70%;border-radius: 10px;border: 1px solid #ffffff;margin-top:20px;padding: 10px 20px;">
			<form name='registry'>
			<div style="margin-bottom:20px;margin-top: 10px;">
	            <input id="loginName" class="easyui-textbox" prompt="登录帐号（英文或数字）" iconWidth="28" style="width:100%;height:34px;padding:10px;">
	        </div>
	        <div style="margin-bottom:20px">
	            <input id="password" class="easyui-passwordbox" prompt="密码" iconWidth="28" style="width:100%;height:34px;padding:10px">
	        </div>
	        <div style="margin:20px 0 10px 0;">
		        <a href="javascript:void(0)" class="easyui-linkbutton c4" style="width:150px" onclick="doReg()">立即注册</a>
		    </div>
		    </form>
		</div>
		
		<div style="width:90%;color: #FFFFFF;margin-top: 10px;">
			<a href='http://www.cpijiang.com/app/cpj.apk' style='font-size: 14px;color: #008800;text-decoration: none;'>下载安卓版 APP</a>
			<br><br>
			<font style='color:#888;font-size: 12px;'>微信用户请点击右上角，在浏览器中打开</font>
		</div>
		<br>
		
	</div>
</body>
</html>