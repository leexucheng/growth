    <%@ page language="java" contentType="text/html; charset=UTF8"
             pageEncoding="UTF8" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>
        <head lang="en">
            <%
	String userCode = request.getParameter("userCode");
	String contextPath = request.getContextPath();
%>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,height=device-height, user-scalable=no,initial-scale=1,
        minimum-scale=1, maximum-scale=1">
        <!--<script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>-->
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
        <title>求助宝 </title>
        <style>
        body {
        background-image: url("/dbs/jsp/drawable-tvdpi/bg.png") ;
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


        span{

        color:#124891


        }


       #denglu{

          display:none;

        }


        #zhuanjia{


        border:2px solid #124891;


        }


        #zaizhi{

        border:2px solid #124891;


        }

        #gongshenyuan{


        border:2px solid #124891;



        }


        #denglu{



        display:none;


        }

        <%--.word{--%>


        <%--font-color:red;--%>


        <%--}--%>


        <%--#phone{--%>

        <%--position:absolute;--%>
        <%--top:1%;--%>
        <%--left:19%;--%>

        <%--}--%>

        <%--#pswd{--%>

        <%--position:absolute;--%>
        <%--top:19%;--%>
        <%--left:19%;--%>

        <%--}--%>

        <%--#idcode1{--%>

        <%--position:absolute;--%>
        <%--top:37%;--%>
        <%--left:18%;--%>


        <%--}--%>

        </style>
        </head>
        <body>


    <p></p>

        <div class="container" id="container" style="text-align:center;">
        <%--添加文字--%>
        <div style="margin-top: 10%;text-align:center;">
        <%--<img src="/dbs/jsp/drawable-tvdpi/qiuzhu.png" style="width: 20rem;height: 3rem">--%>
        </div>
        <%--添加文字结束--%>
        <%--添加红包--%>
        <%--<div style="position: absolute;top: 10rem;left:9rem">--%>
        <div style=" width:100%;margin-top: 1%;text-align: center;" >
        <img src="/dbs/jsp/drawable-tvdpi/question.png" style="width:22rem;height: 13rem">
        </div>

        <div style="text-align:center;margin-top:-1.5rem">


        <%--<div  class="img0" style="margin-top: 1rem;text-align:center;background-color:black;display:flex;>--%>
        <div class="img0" style="height:14rem;line-height:2rem;background:white;width:23rem;margin:2rem auto;border-radius:24px;">

        <div style="padding:2.5rem 1rem;">

        <div style="height:2rem;float:left;">
        <span class="word" style="font-size:1rem;"> 专家：</span>
        </div>

        <div style="float:left">
        <span><img src="/dbs/jsp/drawable-tvdpi/zhuanjiatou.png" style="width: 2rem;height: 2rem;padding-left:1rem;"/></span>
        </div>


        <div class="conform" style="display:flex;float:left">

		<div class="conform" style="display: flex; float: left">
		<c:if test="${requestScope.ret.dbsUser.isProfessional==1}">
			<span id="zaizhi" style="display:inline-block;text-align:center;padding:0  0.2rem;margin-left:0.2rem;">在&nbsp职</span>
		</c:if>

		<c:if test="${requestScope.ret.dbsUser.isExpert==1}">
			<span id="zhuanjia" style="display:inline-block;text-align:center;padding:0  0.2rem;margin-left:0.2rem;">专&nbsp家</span>
		</c:if>

		<c:if test="${requestScope.ret.dbsUser.isJudger==1}">
			<span id="gongshenyuan" style="display:inline-block;text-align:center;padding:0  0.2rem;margin-left:0.2rem;">公审员</span>
		</c:if>

		</div>
		
        </div>

        </div>
        <%--<img src="/dbs/jsp/drawable-tvdpi/expert.png" style="width: 26rem;height: 11rem">--%>


        <div style="padding:0.3rem 1rem">

     </div>

        <div style="padding:0.3rem 1rem">

        <div style="height:2rem;float:left;">
        <span class="qiuzhu" style="font-size:1rem;">求助次数:${requestScope.ret.askCount}次&nbsp&nbsp&nbsp助人次数:${requestScope.ret.prizeCount}次&nbsp&nbsp&nbsp成功率:${requestScope.ret.sucRate}%</span>

        </div>


        </div>

        <div style="height:5rem;line-height:5rem;clear:both;margin:0 auto">

        <img src="/dbs/jsp/drawable-tvdpi/lianxi.png" style="width: 12rem;height: 1.5rem"/>

        </div>


        </div>


        </div>


        <%--<div class="main_content" >--%>
        <%--<div style="width: 7rem;height: 1px;background-color: #eee;opacity:0.3;position: absolute;top:20.2rem;left:-7px; "></div>--%>
        <%--&lt;%&ndash;<div style="position: absolute;top:18rem;left: 7rem">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p style="margin:2px;color: white;font-size: 1.1rem">先解决问题后收费</p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p style="margin:2px;color: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邀请好友得现金</p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p style="margin:2px;color: white">小伙伴们快快注册吧！</p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--<div style="width: 6rem;height: 1px;background-color: #eee;opacity:0.3;position: absolute;top:20.2rem;left: 16rem"></div>--%>
        <%--</div>--%>
        <%--<div class="user_info" style="position: absolute;top:22rem;left: 4.8rem">--%>

        <%--<div class="user_info" style="position: absolute;top:100%;left:1%">--%>
        <%--<div class="item1" style="padding:0;margin:0;margin-top:-2%;">--%>
        <%--<div class="item" style="border-bottom: 1px solid #333333;opacity: .8;letter-spacing: .5rem;margin:0 15%;height:20%;line-height:15%;">--%>
        <%--<label>--%>
        <%--<span id="phone"><img src="/dbs/jsp/drawable-tvdpi/phone.png" style="height: 1.2rem; opacity: .8;"></span>--%>
        <%--<input type="text" id="loginName" placeholder="请输入您的手机号" style="background-color:transparent;border: none;color: white;font-size:0.9rem;opacity: .8; " required>--%>
        <%--</label>--%>
        <%--</div>--%>
        <%--<div class="item" style="border-bottom: 1px solid #333333;opacity: .8;letter-spacing: .5rem;margin:0 15%;height:20%;line-height:15%;">--%>
        <%--<label>--%>
        <%--<span id="pswd"><img src="/dbs/jsp/drawable-tvdpi/pswd.png" style="height: 1.2rem;opacity: .8; "></span>--%>
        <%--<input type="text" id="loginName" placeholder="请输入您的密码" style="background-color:transparent;border: none;color: white;font-size:0.9rem; opacity: .8;" required>--%>
        <%--</label>--%>
        <%--</div>--%>


        <%--<div class="item" style="margin-top: 1rem;border-bottom: 1px solid #333333;opacity: .8;letter-spacing: .5rem;margin:0 6.5rem">--%>
        <%--<span><img src="/dbs/jsp/drawable-tvdpi/pswd.png" style="height: 0.9rem"></span>--%>
        <%--<input type="text" id="password" placeholder="请输入您的密码" style="background-color:transparent;border: none;color: white;font-size: 0.9rem" required>--%>
        <%--</div>--%>
        <%--<div class="item" style="margin-top: 1rem;border-bottom: 1px solid #333333;letter-spacing: .5rem">--%>
        <%--<span><img src="/dbs/jsp/drawable-tvdpi/idcode.png" style="height: 0.9rem;opacity: .8;"></span>--%>
        <%--<input id="inputCode" type="text" required placeholder="请输入您的昵称" style="background-color:transparent;border: none;color: white;font-size: 0.9rem;opacity: .8;width:6rem; ">--%>
        <%--&lt;%&ndash;<button id="getCodeBtn" style="border-radius: 3px;background-color: #fff;border: none;height: 1.4rem;float:right;color: #028ac8"  onclick="sendIdCode()">获取验证码</button>&ndash;%&gt;--%>
        <%--</div>--%>
        <%--<div class="item" style="border-bottom: 1px solid #333333;opacity: .8;letter-spacing: .5rem;margin:0 15%;height:20%;line-height:15%;">--%>
        <%--<span id="idcode1"><img src="/dbs/jsp/drawable-tvdpi/idcode1.png" style="height: 1.2rem;opacity: .8;"></span>--%>
        <%--<input id="inputCode" type="text" required placeholder="请输入验证码" style="background-color:transparent;border: none;color: white;font-size: 0.9rem;opacity: .8;width:6rem; ">--%>
        <%--<button id="getCodeBtn" style="border-radius: 3px;background-color: #fff;border: none;height: 1.2rem;float:right;color: #028ac8"  onclick="sendIdCode()">获取验证码</button>--%>
        <%--</div>--%>
        <!--<div class="item" style="margin-top: 1rem;border-bottom: 1px solid #eee;opacity: .8;letter-spacing:
        .5rem">-->
        <!--<span><img src="drawable-tvdpi/user.png" style="height: 1.4rem"></span>-->
        <!--<input type="text" id="nickName" placeholder="请输入您的昵称" style="background-color:transparent;border:
        none;color: white;font-size: 1rem">-->
        <!--</div>-->
        <%--</div>--%>
        <%--<div class="footer" style="position: absolute;top:35rem;left: 2.5rem;text-align: center;">--%>


        <div id="form" style="padding:0 8%; position:relative;">

        <div class="item" style="border-bottom:1px solid #333333;opacity:
        .8;height:2.4rem;line-height:2.4rem;padding-left:-5rem;position:relative;">

        <div class="item1" style="text-align:left;margin-left:1rem">
        <span> <img src="/dbs/jsp/drawable-tvdpi/phone.png" style="height: 1.5rem;margin-bottom:-0.5rem"> </span> <input
        type="text" id="loginName" placeholder="请输入您的手机号" style="border: none;font-size:1.1rem;opacity:
        .8;background-color:transparent;" />

        </div>


        </div>


        <div class="item" style="border-bottom:1px solid #333333;opacity:
        .8;height:2.4rem;line-height:2.4rem;position:relative;">

        <div class="item1" style="text-align:left;margin-left:1rem">
        <span> <img src="/dbs/jsp/drawable-tvdpi/pswd.png" style="height: 1.5rem;margin-bottom:-0.4rem"> </span> <input
        type="password" id="password" placeholder="请输入您的密码" style="border: none;font-size:1.1rem;opacity:
        .8;background-color:transparent;"/>

        </div>
        </div>

        <div class="item" style="border-bottom:1px solid #333333;opacity:
        .8;height:2.4rem;line-height:2.4rem;position:relative;">
        <div class="item1" style="text-align:left;margin-left:1rem">
        <label>
        <span id="idcode1"> <img src="/dbs/jsp/drawable-tvdpi/idcode1.png" style="height:1.5rem;margin-bottom:-0.5rem;">


        </span>
        <input type="text" id="inputCode" placeholder="请输入验证码" style="border: none;font-size:1.1rem;opacity:
        .8;background-color:transparent;width:120px;" />
        </label>

        </div>

        <button id="getCodeBtn" style="border-radius: 3px;background-color: #fff;border: none;height:
        1.2rem;float:right;color: #028ac8;margin-top:-1.8rem" onclick="sendIdCode()">获取验证码</button>
        </div>

        <div class="footer" style="margin:0 20%;">
        <br />
        <button style="margin:0 20%;width:60%;height:2rem;border-radius: 1rem;background-color: #fff;border: none;font-size:1.2rem;color: #028ac8;display:block;" onclick="doReg()">注册</button>

        </div>

        </div>




        <div>
        <div id="denglu" style="text-align:center;color:#FFFFFF; ">
        您已完成注册，请牢记密码去下载登陆吧！<br/><br/>
        </div>
        <br/>
        <a href='http://www.cpijiang.com/app/cpj.apk' style="color: #ffcc33;display: block;text-decoration:
        none;margin-top:-1%" >安卓版APP</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href='https://itunes.apple.com/cn/app/id1340686091' style="color: #ffcc33;display: block;text-decoration:
        none;margin-top:-1%" >苹果版APP</a>
        </div>
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
        if(!loginName || !loginPassword){
            alert('手机号或密码不能为空');
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
        <%--alert("注册成功！赶快去应用商店下载APP大家一起分钱吧(或点击下方下载连接按提示操作)");--%>

        <%--var denglu=document.getElementById("denglu");--%>
        <%--denglu.style.display="block";--%>
        $("#denglu").css("display","block");

        var form =document.getElementById("form");
        form.style.display="none";


        $("#loginName").val("");
        $("#password").val("");
        }else{
        alert(answer.msg);
        }
        })
        }



        window.onload=function(){
        if(isWeiXin()){
        var p = document.getElementsByTagName('p');
        <%--p[0].innerHTML = window.navigator.userAgent;--%>
        var container=document.getElementById("container");
        container.style.display="none";
     document.body.style.backgroundImage="url('/dbs/jsp/drawable-tvdpi/fenxiang.png' )"

        document.body.style.backgroundImage.height="100%";


     <%--p[0].innerHTML = "<img src='/dbs/jsp/drawable-tvdpi/fenxiang.png'>"--%>
        }
        }
        function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
        }else{
        return false;
        }
        }

        </script>

        </body>
        </html>



