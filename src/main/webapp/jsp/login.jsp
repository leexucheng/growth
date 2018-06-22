<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/jsp/header.jsp" %>

<script type="text/javascript">
	function doLogin(){
		
		document.loginForm.submit();
	}
	
	function clearForm(){
        $('#ff').form('clear');
    }
</script>

<title>登录</title>
</head>
<body>
	
	<div align=center style="width:100%;font-size: 1rem;margin:100px auto;">
		
		<div class="easyui-panel" title="登录" style="width:100%;max-width:400px;padding:30px 60px;">
	        <form id="ff" method="post" name='loginForm' action="<%=request.getContextPath() %>/login.action">
	            <div style="margin-bottom:20px">
	                <input id="s_username" name="s_username" class="easyui-textbox" prompt="登录帐号（英文或数字）" iconWidth="28"
	                	data-options="required:true" style="width:100%;height:34px;padding:10px;">
	            </div>
	            <div style="margin-bottom:20px">
	                <input id="s_password" name='s_password' class="easyui-passwordbox" prompt="密码" iconWidth="28"
	                	 style="width:100%;height:34px;padding:10px">
	            </div>
	        </form>
	        <div style="text-align:center;padding:5px 0">
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="doLogin()" style="width:80px">确定</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">重置</a>
	        </div>
	    </div>
		
	</div>
</body>
</html>