<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<script type="text/javascript">
	
	function query(){
		var userCode =  $.trim($("#userCode").val());
		$("#datagrid").datagrid("options").url="/dbs/web/complaints.do?userCode="+userCode;
		$("#datagrid").datagrid("reload");
	}
	
	function timefrt(v,e,i){
		if(v){
			var d = new Date(v);
			return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
		}
	}
	
	function showDetail(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		$("#ff").form("load",row);
		$("#dlg").dialog("open");
	}
	
	function pass(t){
		var url = baseUri + "/web/checkcomplaint.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		
		var result = $.trim($("#result").val());
    	if(result == ''){
    		$.messager.alert('提示','请输入处理方式');return;
    	}
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var param = {result:result,isChecked:t,complaintId:row.complaintId};
                $.post(url,param,function(result){
                    if (result == 1){
                    	$('#datagrid').datagrid('reload');   // reload 
                        $.messager.alert('提示','操作成功');
                        $("#result").val("");
                    }else{
                    	$.messager.alert('提示','操作失败：'+result);
                    }
                },'json');
            }
        });
	}
	
	function typefrt(v,e,i){
		if(v == 'U'){
			return '用户';
		}else if(v == 'T'){
			return '任务';
		}
	}
	
	function showInfo(i,f,v){
		var row = $('#datagrid').datagrid('getSelected');
		if(f == 'passiveCode'){
			if(row.type == 'U'){
				var url = baseUri + "/app/user/"+v+".do";
				var param = {};
                $.post(url,param,function(result){
                    if (result.code == 0){
                    	$("#dlg2").dialog("open");
                    	$("#ff2").form("load",result.model);
                   	}else{
                   		alert('数据不存在');
                   	}
                },'json');
			}else if(row.type == 'T'){
				var url = baseUri + "/app/task/pojo.do";
				var param = {taskCode:v};
                $.post(url,param,function(result){
                    if (result.code == 0){
                    	$("#dlg").dialog("open");
                    	$("#ff").form("load",result.model);
                   	}else{
                   		alert('数据不存在');
                   	}
                },'json');
			}
		}
	}
	
	$(function(){
		
	});
</script>
<title>内容审核</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid' url="/dbs/web/complaints.do"
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true,onDblClickCell:showInfo">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="80">投诉用户代码</th>
               <th data-options="field:'type'" width="70" formatter="typefrt">投诉对象</th>
               <th data-options="field:'passiveCode'" width="80">用户/任务代码(双击查看)</th>
               <th data-options="field:'content'" width="80">原因</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">投诉时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   		
   	           处理方式 ：<input class="easyui-textbox" id='result' style="width:280px" maxlength="50">
   	           <!-- 
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="query()">查询</a>
        -->
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass(1)">标记已审查</a>
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="查看任务内容" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
   		<form id="ff" method="post">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="title" style="width:95%" data-options="label:'标题:'" readonly="readonly">
            </div>
            <div style="margin-bottom:20px">
                <textarea class="easyui-textbox" name="content" style="width:95%;height:160px;" data-options="label:'内容:'" readonly="readonly"></textarea>
            </div>
            <div style="margin-bottom:20px">
                <textarea class="easyui-textbox" name="handStandard" style="width:95%;height:160px;" data-options="label:'标准:'" readonly="readonly"></textarea>
            </div>
        </form>
   	</div>
   <div align="center" id="dlg2" class="easyui-dialog" title="查看任务内容" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
   		<form id="ff2" method="post">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="nickName" style="width:95%" data-options="label:'昵称:'" readonly="readonly">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="realName" style="width:95%" data-options="label:'真实姓名:'" readonly="readonly">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="idCard" style="width:95%" data-options="label:'身份证号:'" readonly="readonly">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="mobile" style="width:95%" data-options="label:'手机:'" readonly="readonly">
            </div>
            <div style="margin-bottom:20px">
                <textarea class="easyui-textbox" name="introduction" style="width:95%;height:50px;" data-options="label:'简介:'" readonly="readonly"></textarea>
            </div>
        </form>
   	</div>
</body>
</html>