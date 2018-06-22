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
	var type = '<%=type%>';
	
	
	function query(){
		
		var param = $("#form1").form("getSerialize");
		var userCode =  $.trim($("#userCode").val());
		$("#datagrid").datagrid("options").url="/dbs/web/showAllUsers.do?"+param;
		$("#datagrid").datagrid("reload");
		
	}
	
	function resetPwd(){
		var url = baseUri + "/web/resetPwd.do";
		var row = $('#datagrid').datagrid('getSelected');
		var json = {password:'123456', userCode:row.userCode}
		if(!row)return;
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
                $.post(url,json,function(result){
                    if (result){
                    	$('#datagrid').datagrid('reload');   // reload the user data
                        $.messager.alert('提示','操作成功');
                        $("#form1").form("clear")
                    }
                },'json');
            }
        });
	}
	
	function sendMsg(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row){$.messager.alert('提示','请选择需要推送消息的用户');return;}
		$("#dlg").dialog("open");
	}
	
	function submitForm() {
		
		var json = $("#addForm").form("getData")
		var row = $('#datagrid').datagrid('getSelected');
		var url = baseUri + "/web/chat/system.do";
		var param = {contentType:"T", fromUser:"system01", toUser:row.userCode, read:'0', content:json.message}
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
                $.post(url,param,function(result){
                    if (result){
                    	$('#datagrid').datagrid('reload');   // reload the user data
                        $.messager.alert('提示','操作成功');
                        $("#addForm").form("clear")
                        $("#dlg").dialog("close")
                    }
                },'json');
            }
        });
	} 
	
	$(function(){
		query();
	});
</script>

<title>用户管理</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="25">用户编号</th>
               <th data-options="field:'realName'" width="80">真实姓名</th>
               <th data-options="field:'nickName'" width="80">昵称</th>
               <th data-options="field:'mobile'" width="70">手机</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   <form id='form1' class='easyui-form'>
   		用户编码 ：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="resetPwd()">重置密码</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sendMsg()">推送消息</a>
   </form>
   </div>
   <div align="center" id="dlg" class="easyui-dialog" title="推送消息" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:500px;height:470px;padding:10px">
   		<div class='easyui-panel' data-options="fit:true">
           	<form id="addForm" class="easyui-form">
	            <div style="margin:30px 0;">
	                <input class="easyui-textbox" name="message" style="width:100%;height:120px" data-options="label:'请输入消息',multiline:true">
	            </div>
			</form>
          <div style="text-align:center;padding:5px 0">
               <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">发送</a>
               <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#addForm').form('clear')" style="width:80px">清空</a>
          </div>
   		</div>
   	</div>
</body>
</html>