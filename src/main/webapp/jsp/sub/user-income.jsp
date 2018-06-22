<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<script type="text/javascript">
	
	function query(){
		var userCode =  $.trim($("#userCode").val());
		$("#datagrid").datagrid("options").url="/dbs/web/cashincome.do?userCode="+userCode;
		$("#datagrid").datagrid("reload");
	}
	
	function timefrt(v,e,i){
		if(v){
			var d = new Date(v);
			return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
		}
	}
	
	$(function(){
		
	});
</script>
<title>申请</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid' url="/dbs/web/cashincome.do"
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="80">用户代码</th>
               <th data-options="field:'amount'" width="80">收入金额</th>
               <th data-options="field:'summary'" width="80">说明</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">收入时间</th>
               <th data-options="field:'taskCode'" width="70" >相关任务编号</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   	           用户代码 ：<input class="easyui-textbox" id='userCode' style="width:110px" maxlength="20">
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="query()">查询</a>
   </div>
   
</body>
</html>