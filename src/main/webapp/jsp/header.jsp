<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%
	response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/common/themes/material/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/common/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/common/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/common/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/common/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/common/assistant.js"></script>
<script type="text/javascript">
	var baseUri = "<%=request.getContextPath() %>";
	var contextPath = '<%=request.getContextPath() %>';
</script>
