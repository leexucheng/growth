<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>

<script type="text/javascript">

	function query(){
		var param = $("#form1").form("getSerialize");
		$("#datagrid").datagrid("options").url="/dbs/web/commisionSum.do?"+param;
		$("#datagrid").datagrid("reload");
	} 
	
	function taskType(v,e,i){
		if(v == "JJ"){
			return "救急";  
		} 
		else if(v == "WD"){
			return "问答";
		}
		else if(v == "ZX")
			return "咨询";
		else
			return "总计";
	}
	
	
	$(function(){
		query(); 
	});
</script>

<title>佣金合计</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,showFooter:true,singleSelect:true,method:'get',fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'infoType'" width="25" formatter="taskType">任务类型</th>
               <th data-options="field:'sumAmount'" width="25">佣金合计</th>
           </tr>
       </thead>
   </table>
</body>
</html>