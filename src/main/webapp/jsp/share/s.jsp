<%@page import="com.cs.third.SmsUtil"%>
<%@page import="com.cs.common.AppCache"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	Integer code = SmsUtil.genRandCode();
	AppCache.randCodeMap.put("13388888888",code.toString());
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href = "test/12.do">test</a><br>
<a href = "test/rb/212.do">test</a><br>
https://vip2.svnspot.com/sprcen.dbs_client/trunk
<br>
s:<%=code %>
</body>
</html>