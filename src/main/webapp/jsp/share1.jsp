    <%@ page language="java" contentType="text/html; charset=UTF8"
             pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<%
	String userCode = request.getParameter("userCode");
	String contextPath = request.getContextPath();
%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height, user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <title>分享页面</title>
    <style>
        body {
            background-image: url("/dbs/jsp/drawable-tvdpi/bgimg.jpg");
            /*background-color: red;*/
            background-size: cover;
            font-size: 14px;
        }
        .container {
            position: relative;
            width: 100%;
            height: 100%;
        }
        input::-webkit-input-placeholder {
            color: white;
            padding:0;
            margin:0;
            outline:none;
        }


        .item{

        	padding-left:-60px;
        }
    </style>
</head>
<body>
<div class="container" style="text-align:center;"> 
  <div style="margin-top: 10%;text-align:center;"> 
   <img src="/dbs/jsp/drawable-tvdpi/qiuzhu.png" style="width: 10rem;height: 1.5rem" /> 
  </div> 
  <div style=" width:100%; position: absolute;top: 25%;text-align: center;"> 
   <img src="/dbs/jsp/drawable-tvdpi/hongbao.png" style="width: 4.5rem;height: 4.6rem" /> 
  </div> 
  <div style="margin-top: 3.5rem;text-align:center"> 
   <img src="/dbs/jsp/drawable-tvdpi/logo.png" style="width: 21.5rem;height: 22.5rem" /> 
  </div> 
  <div class="form" style="padding:2% 8%; "> 
   <div class="item" style="border-bottom:1px solid #333333;opacity: .8;height:2.4rem;line-height:2.4rem;padding-left:-5rem;position:relative;"> 
    <div class="item1" style="text-align:left;margin-left:1rem"> 
     <span> <img src="/dbs/jsp/drawable-tvdpi/phone.png" style="height: 1.5rem;margin-bottom:-0.5rem" /> </span> 
     <input type="text" id="loginName" placeholder="请输入您的手机号" style="border: none;font-size:1.1rem;opacity: .8;background-color:transparent;" /> 
    </div> 
   </div> 
   <div class="item" style="border-bottom:1px solid #333333;opacity: .8;height:2.4rem;line-height:2.4rem;position:relative;"> 
    <div class="item1" style="text-align:left;margin-left:1rem"> 
     <span> <img src="/dbs/jsp/drawable-tvdpi/pswd.png" style="height: 1.5rem;margin-bottom:-0.4rem" /> </span> 
     <input type="password" id="password" placeholder="请输入您的密码" style="border: none;font-size:1.1rem;opacity: .8;background-color:transparent;" /> 
    </div> 
   </div> 
   <div class="item" style="border-bottom:1px solid #333333;opacity: .8;height:2.6rem;line-height:2.4rem;position:relative;"> 
    <div class="item1" style="text-align:left;margin-left:1rem"> 
     <label> <span id="idcode1"> <img src="/dbs/jsp/drawable-tvdpi/idcode1.png" style="height:1.5rem;margin-bottom:-0.5rem" /> </span> 
     <input type="text" id="inputCode" placeholder="请输入验证码" style="border: none;font-size:1.1rem;opacity: .8;background-color:transparent;width:120px;" /> </label> 
    </div> 
    <button id="getCodeBtn" style="border-radius: 3px;background-color: #fff;border: none;height: 1.5rem;float:right;color: #028ac8;margin-top:-1.8rem" onclick="sendIdCode()">获取验证码</button> 
   </div> 
  </div> 
  <div class="footer" style="padding-top:2%;"> 
   <button style="margin:0 20%;width:60%;height:2rem;border-radius: 1rem;background-color: #fff;border: none;font-size:1.2rem;color: #028ac8;display:block;" onclick="doReg()">注册</button> 
   <br /> 
  </div> 
  <div> 
   <a href="http://www.cpijiang.com/app/cpj.apk" style="color: #ffcc33;display: block;text-decoration: none;margin-top:-2%">下载安卓版手机APP</a> 
  </div> 
 </div> 
<script type="text/javascript">
    var baseURL = "http://192.168.1.13:8080/dbs";
    var contextPath = "<%=contextPath%>";
    var userCode = '<%=userCode%>';
    var countDown = 60;
    function sendIdCode() {
        if(!$('#loginName').val()){
            alert('手机号不能为空');
            return;
        }
        var loginNa = $.trim($('#loginName').val());
        var reg = /^[0-9]{11}$/;
        if(!reg.test(loginNa)){
            alert("请填写11位手机号");
            return;
        }
        $.post(contextPath+"/app/registry/getCode.do",{loginName:$('#loginName').val()},function(answer){
            if(answer.code == 0){
                alert("验证码已发送，请注意查收");
            }else{
                 alert(answer.msg);
            }
        })

        var obj = $('#getCodeBtn');
        setTime(obj);
    }
    function setTime(obj){
        if(countDown == 0){
            obj.attr('disabled',false);
            obj.text('获取验证码');
            countDown = 60;
            return;
        }else{
            obj.attr('disabled',true);
            obj.text(countDown + '秒后重新获取');
            countDown--;
        }
        setTimeout(function(){
            setTime(obj)
        },1000)
    }
    function doReg(){
        var loginName = $('#loginName').val();
        var loginPassword = $('#password').val();
        var inputCode = $('#inputCode').val();
        if(loginName == null || loginPassword== null){
           alert('手机号跟密码不能为空');
            return;
        }
        if(!inputCode){
            alert('请输入验证码');
            return;
        }
        var reg = /^[0-9]+$/;
        if(!reg.test(loginName)){
            alert("请使用英文或数字作为登录帐号");
            return;
        }
        var curUrl = window.location.href;
        var idx = curUrl.indexOf('_rand');
        var rand = '%'+curUrl.substring(idx,idx+19)+'%';

        var url = contextPath+"/app/reg102.do";
        var param = {loginName:loginName,password:loginPassword,loginId:userCode,url:rand,qq:inputCode};
        $.post(url,param,function(answer){
	        if(answer.code == 0){
		        alert("注册成功！赶快去应用商店下载APP大家一起分钱吧(或点击下方下载连接按提示操作)");
		        $("#loginName").val("");
		        $("#password").val("");
	        }else{
	        	alert(answer.msg);
	        }
        })
    }
</script>
</body>
</html>