<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>

<script type="text/javascript">

	function query(){
		var param = $("#form1").form("getSerialize");
		var userCode =  $.trim($("#userCode").val());
		$("#datagrid").datagrid("options").url="/dbs/web/commission.do?"+param;
		$("#datagrid").datagrid("reload");
	} 
	
	function sysName(v,e,i){
		return "求助宝";
	}
	
	$(function(){
		query(); 
	});
</script>

<title>佣金明细</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:false,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="10" formatter="sysName">用户（系统）</th>
               <th data-options="field:'amount'" width="10">金额</th>
               <th data-options="field:'summary'" width="10">任务摘要</th>
               <th data-options="field:'withWho'" width="10">关联用户ID</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   <form id='form1' class='easyui-form'>
   		用户编码 ：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
   </form>
   </div>
</body>
</html>