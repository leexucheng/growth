<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<script type="text/javascript">
	
	function query(){
		var param = $("#form1").form("getSerialize");
		$("#datagrid").datagrid("options").url="/dbs/web/checktask.do?"+param;
		$("#datagrid").datagrid("reload");
		
		var json = $("#form1").form("getData");
		if(json.isChecked == 1){
			$("#finished1").linkbutton('disable');
			$("#finished0").linkbutton('disable');
		}else{
			$("#finished1").linkbutton('enable');
			$("#finished0").linkbutton('enable');
		}
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
		var url = baseUri + "/web/checktaskcontent.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		
		var extra3 = $.trim($("#extra3").textbox('getText'));
    	if(extra3 == ''){
    		$.messager.alert('提示','请输入操作理由');return;
    	}
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var param = {extra3:extra3,state:t,taskId:row.taskId};
                $.post(url,param,function(result){
                    if (result == 0){
                    	$('#datagrid').datagrid('reload');   // reload 
                        $.messager.alert('提示','操作成功');
                        $("#extra3").textbox('setText','');
                    }else{
                    	$.messager.alert('提示','操作失败：'+result);
                    }
                },'json');
            }
        });
	}
	
	$(function(){
		query();
	});
</script>
<title>内容审核</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'taskCode'" width="70" >任务编号</th>
               <th data-options="field:'userCode'" width="80">用户代码</th>
               <th data-options="field:'reward'" width="80">赏金</th>
               <th data-options="field:'penalty'" width="80">保证金</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">发布时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   		<form id='form1' class='easyui-form'>
	   		任务编号：<input class="easyui-textbox" id='taskCode-id' name='taskCode' style="width:280px" maxlength="50">
	   		<select id="cbx-check-id" class="easyui-combobox" name="isChecked" style="width:100px;" data-options="panelHeight:'auto'">
			    <option value="0">未审核</option>
			    <option value="1">已审核</option>
			</select>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
	   	 </form>
	   	 <form id='form2' class='easyui-form'>    
	   	         审核理由：<input class="easyui-textbox" id='extra3' name='extra3' style="width:280px" maxlength="50">
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showDetail()">查看内容</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass(1)" id='finished1'>通过</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="pass(0)" id='finished0'>屏蔽任务</a>
	   	 </form>
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
</body>
</html>