<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<%
	String type = request.getParameter("type");
%>
<script type="text/javascript">
	
	function query(){
		
		var param = $("#form1").form("getSerialize");
		$("#datagrid").datagrid("options").url = contextPath + "/web/withdraw-record.do?"+param;
		$("#datagrid").datagrid("reload");
		
	}
	
	
	function showDetail(){
		
	}
	
	function timefrt(v,e,i){
		if(v){
			var d = new Date(v);
			return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
		}
	}
	
	$(function(){
		query();
	});
</script>
<title>提现记录</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
           	   <th data-options="field:'withdrawId'" width="30">申请编号</th>
               <th data-options="field:'userCode'" width="30">用户代码</th>
               <th data-options="field:'amount'" width="80">提现金额</th>
               <th data-options="field:'alipay'" width="80">支付宝收款帐号</th>
               <th data-options="field:'weixin'" width="80">微信收款帐号</th>
               <th data-options="field:'remark'" width="80">用户备注</th>
               <th data-options="field:'summary'" width="80">说明</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">申请时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
      <form id='form1' class='easyui-form'>
   		用户编码：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
   		<select id="cbx-check-id" class="easyui-combobox" name="state" style="width:100px;" data-options="panelHeight:'auto'">
		    <option value="1">已通过</option>
		    <option value="0">未通过</option>
		</select>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
   	 </form>
   </div>
   
</body>
</html>