<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>

<script type="text/javascript">

 	function query(){
		var param = $("#form1").form("getSerialize");
		$("#datagrid").datagrid("options").url="/dbs/web/task/records.do?"+param;
		$("#datagrid").datagrid("reload");
	} 
 	
	function status(v,e,i){
		
		if(v < 10){
			return "新建";
		} else if(v < 20){
			return "进行中";
		} else if(v < 30){
			return "待确认";
		} else if(v < 40){
			return "完成";
		} else if(v < 50){
			return "客服";
		} else 
			return "公审";
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

<title>任务数据</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:false,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'taskCode'" width="10">任务编码</th>
               <th data-options="field:'createTime'" width="10" formatter="timefrt">发布时间</th>
               <th data-options="field:'expireTime'" width="10" formatter="timefrt">过期时间</th>
               <th data-options="field:'handDuration'" width="10">交付周期</th>
               <th data-options="field:'state'" width="10" formatter="status">流程状态</th>
               <th data-options="field:'attendNow'" width="10">已参与人数（接单）</th>
               <th data-options="field:'reward'" width="10">悬赏金额</th>
               <th data-options="field:'hitCount'" width="10">点击次数</th>
               <th data-options="field:'shareCount'" width="10">分享次数</th>
               <th data-options="field:'favorCount'" width="10">收藏次数</th>
               <th data-options="field:'praise'" width="10">被赞数</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   <form id='form1' class='easyui-form'>
   		<!-- 任务编码 ：<input class="easyui-textbox" id='taskCode-id' name='taskCode' style="width:280px" maxlength="50">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a> -->
   </form>
   </div>
</body>
</html>