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
		$("#datagrid").datagrid("options").url="/dbs/web/login/records.do?"+param;
		$("#datagrid").datagrid("reload");
	} 
 	
	function status(v,e,i){
		
		if(v == 1){
			return "在线";
		}else
			return "离线";
	}
	
	function timefrt(v){
		if(v){
			var d = new Date(v);
			return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
		} 
		
	}
	
	$(function(){
		query();
	});
</script>

<title>登录数据</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:false,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="10">用户编号 </th>
               <th data-options="field:'loginName'" width="10">登录名 </th>
               <th data-options="field:'weixin'" width="10">微信号 </th>
               <th data-options="field:'qq'" width="10">QQ号 </th>
               <th data-options="field:'lastLoginTime'" width="10" formatter="timefrt">最近一次登录时间 </th>
               <th data-options="field:'online'" width="10" formatter="status">登录状态 </th>
               <th data-options="field:'regTime'" width="10" formatter="timefrt">注册时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   <form id='form1' class='easyui-form'>
   		用户编码 ：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
      	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" onclick="exportToExcel()">导出到Excel</a> -->
   </form>
   </div>
</body>
</html>