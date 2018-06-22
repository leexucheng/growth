<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<%
	String goodsId = request.getParameter("goodsId");
	String contextPath = request.getContextPath();
%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,height=device-height, user-scalable=no,initial-scale=1,
        minimum-scale=1, maximum-scale=1">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<title>求助宝</title>
<style>
body {
	background-image: url("/dbs/jsp/drawable-tvdpi/bg.png");
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
	padding: 0;
	margin: 0;
	outline: none;
}

.item {
	padding-left: -60px;
}

.goodsName {
	color: #124891;
}

.price {
	color: #fd0000
}
</style>
</head>
<body>
	<div class="container" id="container" style="text-align: center;">
		<div style="margin-top: 10%; text-align: center;"></div>
		<div style="width: 100%; margin-top: 1%; text-align: center;">
			<img src="/dbs/jsp/drawable-tvdpi/forhead.png" style="width: 22rem; height: 13rem">
		</div>
		<div style="text-align: left; margin-top: -1.5rem">
			<div class="img0"
				style="height: 12rem; line-height: 2rem; background: white; width: 22rem; margin: 2rem auto; border-radius: 24px;">
				<div style="padding: 1rem 2rem;">
					<div style="width: 20rem; padding-top: 1.5rem; padding-left: 0.5rem; float: left">
						<div style="float: left;">
							<span><img src="/dbs/jsp/drawable-tvdpi/tomato.png" style="width: 8rem; height: 8rem" /></span>
						</div>
						<div style="height: 2rem; width: 4rem; float: left; margin-top: 1rem;">
							<div class="goodsName" style="font-size: 1.5rem;">${requestScope.goodsName}</div>
						</div>
						<div class="price" style="margin: 5rem 0rem 0rem 8rem; width: 8rem; height: 2rem; font-size: 1.5rem;">
							售价￥${requestScope.price}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
