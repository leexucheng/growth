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
    <!--<script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>-->
    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->
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
        }

    </style>
</head>
<body>
<div class="container">
    <div style="position: absolute;top: 2rem;left:3rem">
        <img src="/dbs/jsp/drawable-tvdpi/logo.png" style="width: 15rem;height: 15rem">
    </div>
    <div class="main_content" >
       <div style="width: 7rem;height: 1px;background-color: #eee;opacity:0.3;position: absolute;top:20.2rem;left:-7px; "></div>
        <div style="position: absolute;top:18rem;left: 7rem">
            <p style="margin:2px;color: white;font-size: 1.1rem">先解决问题后收费</p>
            <p style="margin:2px;color: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邀请好友得现金</p>
            <p style="margin:2px;color: white">小伙伴们快快注册吧！</p>
        </div>
        <div style="width: 6rem;height: 1px;background-color: #eee;opacity:0.3;position: absolute;top:20.2rem;left: 16rem"></div>
    </div>
    <div class="user_info" style="position: absolute;top:22rem;left: 3.5rem">
       <div class="item" style="margin-top: 1rem;border-bottom: 1px solid #eee;opacity: .8;letter-spacing: .5rem">
           <label>
               <span><img src="/dbs/jsp/drawable-tvdpi/phone.png" style="height: 1.4rem"></span>
               <input type="text" id="loginName" placeholder="请输入您的手机号" style="background-color:transparent;border: none;color: white;font-size: 1rem" required>
           </label>
       </div>
        <div class="item" style="margin-top: 1rem;border-bottom: 1px solid #eee;opacity: .8;letter-spacing: .5rem">
        <span><img src="/dbs/jsp/drawable-tvdpi/pswd.png" style="height: 1.4rem"></span>
        <input type="text" id="password" placeholder="请输入您的密码" style="background-color:transparent;border: none;color: white;font-size: 1rem" required>
       </div>
        <div class="item" style="margin-top: 1rem;border-bottom: 1px solid #eee;letter-spacing: .5rem">
            <span><img src="/dbs/jsp/drawable-tvdpi/idcode.png" style="height: 1.4rem;opacity: .8;"></span>
            <input id="inputCode" type="text" required placeholder="验证码" style="background-color:transparent;border: none;color: white;font-size: 1rem;opacity: .8;width:6rem; ">
            <button id="getCodeBtn" style="border-radius: 3px;background-color: #fff;border: none;height: 1.4rem;float:right;color: #028ac8"  onclick="sendIdCode()">获取验证码</button>
       </div>
        <!--<div class="item" style="margin-top: 1rem;border-bottom: 1px solid #eee;opacity: .8;letter-spacing: .5rem">-->
        <!--<span><img src="drawable-tvdpi/user.png" style="height: 1.4rem"></span>-->
        <!--<input type="text" id="nickName" placeholder="请输入您的昵称" style="background-color:transparent;border: none;color: white;font-size: 1rem">-->
    <!--</div>-->
    </div>
    <div class="footer" style="position: absolute;top:32rem;left: 2.5rem;text-align: center;">
        <button style="width:16rem;height:2rem;border-radius: 1rem;background-color: #fff;border: none;float:right;font-size:1.2rem;color: #028ac8;margin-bottom: 10px" onclick="doReg()">注册</button>
        <a href='http://www.cpijiang.com/app/cpj.apk' style="color: #ffffff;display: block;text-decoration: none" >下载安卓版手机APP</a>
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
            obj.attr('disabled','false');
            obj.text('重新获取验证码');
            countDown = 60;
            return;
        }else{
            obj.attr('disabled','true');
            obj.text(countDown + '秒后重新获取验证码');
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