<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<script type="text/javascript">
	
	function query(){
		var userCode =  $.trim($("#userCode").val());
		$("#datagrid").datagrid("options").url="/dbs/web/unconfirmed.do?userCode="+userCode;
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
		if(row.evidenceImg){
			var arr = row.evidenceImg.split(";");
			var html = "";
			for(var i=0;i<arr.length;i++){
				html += "<img src='"+arr[i]+"' width=500><br><br>";
			}
			$("#evidence").html(html);
		}else{
			$("#evidence").empty();
		}
		
	}
	
	function forceConfirm(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var url = baseUri + "/web/confirm.do";
            	var param = {taskId:row.taskId};
                $.post(url,param,function(result){
                    if (result == 1){
                    	$('#datagrid').datagrid('reload');   // reload 
                        $.messager.alert('提示','操作成功');
                        $("#extra2").val("");
                    }else{
                    	$.messager.alert('提示','操作失败：'+result);
                    }
                },'json');
            }
        });
	}
	
	$(function(){
		
	});
</script>
<title>超期任务</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid' url="/dbs/web/unconfirmed.do"
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'taskCode'"  width="20">任务编号</th>
               <th data-options="field:'userCode'" width="20">用户代码</th>
               <th data-options="field:'state'" width="20">客服判定</th>
               <th data-options="field:'title'"  width="80">标题</th>
               <th data-options="field:'content'" width="80">内容</th>
               <th data-options="field:'reward'" width="20">赏金</th>
               <th data-options="field:'createTime'" formatter="timefrt" width="40">发布时间</th>
               <th data-options="field:'finishTime'" formatter="timefrt" width="40">完成时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   	
   	          用户代码 ：<input class="easyui-textbox" id='userCode' style="width:110px" maxlength="20">
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="query()">查询</a>
       
      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="$('#datagrid').datagrid('reload')">刷新</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="forceConfirm()">强制确定</a>
      <!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="finished(0)">认定任务未完成</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="$('#dlg2').dialog('open')">判定说明</a> -->
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
            <div style="margin-bottom:20px" id='evidence'>
            </div>
            
        </form>
   	</div>
   <div align="center" id="dlg3" class="easyui-dialog" title="查看回答" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
   		<table width=100% id='replies'>
   			<!-- <tr>
   				<td width='50%' style='color:blue;font-weight:blod;'>用户10001 回复于：2017-03-03</td>
   				<td width='50%'>
   					打赏比率  : <input type="text" style='width:50px' value='0' name='percentage'>%
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2" width='100%' style='text-indent: 30px;'>回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容回答内容</td>
   			</tr>
   			<tr><td colspan='2'> </td></tr> -->
   		</table>
   		<br><br>
   		<div>
   			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="forceConfirm()">确定代发单方打赏用户</a>
   		</div>
   	</div>
   <div align="left" id="dlg2" class="easyui-dialog" title="说明" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:500px;height:370px;padding:10px">
            <div style="margin-bottom:20px">
                	认定任务完成：任务将以正常的流程结束，待发单方确认后，按正常方式分配赏金，倾向接单方
            </div>
            <div style="margin-bottom:20px">
               		认定任务未完成：倾向于发单方，待接单方确认后，全额退款，如涉及保证金，接单方未完成任务将被扣除保证金给发方单
            </div>
   	</div>
</body>
</html>