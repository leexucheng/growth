<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>

<script type="text/javascript">

	function query(){
		$("#datagrid").datagrid("options").url="/dbs/web/analysis/orders.do";
		$("#datagrid").datagrid("reload");
	} 
	
	function rate(v) {
		var rate = v + "%";
		return rate;
	}
	
	$(function(){
		query();
	});
</script>

<title>用户数据</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid' 
	data-options="rownumbers:true,singleSelect:false,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
               <th data-options="field:'orderCount'" width="10">订单数量</th>
               <th data-options="field:'fulfilledCount'" width="10">成功订单数量</th>
               <th data-options="field:'fulfilledRate'" width="10" formatter="rate">成功率</th>
           </tr>
       </thead>
   </table>
</body>
</html>