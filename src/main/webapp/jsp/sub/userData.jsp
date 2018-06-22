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
		$("#datagrid").datagrid("options").url="/dbs/web/showAllUsers.do?"+param;
		$("#datagrid").datagrid("reload");
	} 
	
	//统计数据完整度
	function completeIndex(v,e,i){
		var count = 0;
		if(e.realName){
			count++;
		}
		if(e.province){
			count++;
		}
		if(e.mobile){
			count++;
		}
		if(e.industry){
			count++;
		}
		if(e.favorTrade){
			count++;
		}
		if(e.sex){
			count++;
		}
		if(e.corpName){
			count++;
		}
		if(e.email){
			count++;
		}
		return count;
	}
	
	 function zombiFan(v,e,i){
		if(e.dbsCount + e.dbsValidCount == 0)
			return "N/A";
		else
			return "No";
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
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="10">用户编号</th>
               <th data-options="field:'realName'" width="10">真实姓名</th>
               <th data-options="field:'province'" width="10">地区</th>
               <th data-options="field:'mobile'" width="10">手机</th>
               <th data-options="field:'industry'" width="10">所属行业</th>
               <th data-options="field:'favorTrade'" width="10">关注行业</th>
               <th data-options="field:'sex'" width="10">性别</th>
               <th data-options="field:'corpName'" width="10">公司名称</th>
               <th data-options="field:'email'" width="10">邮箱</th>
               <th data-options="field:'balance'" width="10">余额</th>
               <th data-options="field:'inviteCount'" width="10">邀请次数</th>
               <th data-options="field:'career'" width="10">职业职位</th>
               <th data-options="field:'dbsCount'" width="10">求助次数</th>
               <th data-options="field:'dbsValidCount'" width="10">帮人次数</th>
               <th data-options="field:'parentCode'" width="10">推荐人代码</th>
               <th data-options="field:'createTime'" width="10">注册时间</th>
               <th data-options="field:'completeIndex'" width="10" formatter="completeIndex">用户信息完整系数</th>
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