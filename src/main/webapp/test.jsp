<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/jsp/header.jsp" %>

<script type="text/javascript">

	var f = 1;
	function doLogin(k){
		f = 1;
		$.ajax({
			url:"/dbs/app/msg_rolling.do",  
	        type:"get",  
	        data:{key:k},
	        dataType:'json',
	        timeout:10000,
	        success:function(data){  
	           console.log(JSON.stringify(data) + "----success:function--");   
	           if(f)doLogin(k);
	           	
	        },
	        error:function(request,statusText,err){
	        	console.log(JSON.stringify(err) + "----error:function-err-");   
	        	console.log(statusText + "----error:function-statusText-");   
	        	if(f)doLogin(k);
	        }
		});
	}
	
	function clearForm(k){
        $.post('/dbs/app/msg_set.do',{key:k},function(data){});
    }
	function restRoll(k){
		f=0;
        $.post('/dbs/app/end_rolling.do',{key:k},function(data){});
    }
	
	function setState(k){
        $.post('/dbs/app/set_state.do',{key:k},function(data){});
    }
	
	function getState(k){
			$.ajax({
				url:"/dbs/app/state.do",  
		        type:"get",  
		        data:{key:k},
		        dataType:'json',
		        timeout:15000,
		        success:function(data){  
		           console.log(JSON.stringify(data) + "----success:function--");   
		           getState(k);
		           	
		        },
		        error:function(request,statusText,err){
		        	console.log(JSON.stringify(err) + "----error:function-err-");   
		        	console.log(statusText + "----error:function-statusText-");   
		        	getState(k);
		        }
			});
	}
</script>

<title>登录</title>
</head>
<body>
	
	<div align=center style="width:100%;font-size: 1rem;margin:100px auto;">
		
		<div class="easyui-panel" title="登录" style="width:100%;max-width:600px;padding:30px 60px;">
	        <div style="text-align:center;padding:5px 0">
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="doLogin('34@23')" style="width:80px">34@23</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm('34@23')" style="width:80px">重置</a>
	            
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="doLogin('35@25')" style="width:80px">35@25</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm('35@25')" style="width:80px">重置</a>
	            <br>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="restRoll('34@23')" style="width:80px">重置34@23</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="restRoll('35@25')" style="width:80px">重置35@25</a>
	            <br>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="getState('34@23')" style="width:80px">状态</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="setState('34@23')" style="width:80px">设置状态</a>
	        </div>
	    </div>
		<div>
			<img alt="" src="http://qr.liantu.com/api.php?text=http://www.cpijiang.cn:8080/dbs/web/share.do?userCode=72&taskCode='/>">
		</div>
	</div>
</body>
</html>