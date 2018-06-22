<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<script type="text/javascript">
	
	function timefrt(v,e,i){
		if(v){
			var d = new Date(v);
			return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
		}else {
			return "";
		}
	}
	function statefrt(v,e,i){
		if(v == '50'){
			return "<font style='color:red'>公审中</font>"
		}
		if(v == '52'){
			return "<font style='color:green'>公审完成</font>"
		}
	}
	
	function showDetail(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		$("#ff").form("load",row);
		$("#dlg2").dialog("open");
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
	
	function showVote(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		var url = baseUri + "/web/showjudge.do";
		
		var param = {taskCode:row.taskCode};
        $.post(url,param,function(result){
            if (result.code == 0){
            	
            	var ftime = timefrt(result.attr.finishTime);
            	
            	$("#base").html("投票上限："+result.attr.limitCount+"   |  公审费："+result.attr.amount + 
            							"  |  结果："+result.attr.result+"  |  结束时间："+ftime);
            	
            	$('#pg').propertygrid('loadData',[]);
            	for(var i = 0;i<result.datas.length;i++){
            		
            		var row = {
            			  name:'公审员'+result.datas[i].userCode,
           				  value:result.datas[i].vote == 1?"赞成":"反对"
            		};
            		$('#pg').propertygrid('appendRow',row);
            	}
            	$("#dlg").dialog("open");
            }else{
            	$.messager.alert('提示',result.code+'：'+result.msg);
            }
        },'json');
	}
	
	$(function(){
		
	});
</script>
<title>内容审核</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid' url="/dbs/web/taskinjudge.do"
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'taskCode'" width="70" >任务编号</th>
               <th data-options="field:'userCode'" width="80">发单用户代码</th>
               <th data-options="field:'fixedCost'" width="80">固定成本</th>
               <th data-options="field:'reward'" width="80">赏金</th>
               <th data-options="field:'penalty'" width="80">保证金</th>
               <th data-options="field:'state'" width="70" formatter="statefrt">状态</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">发布时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   		
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showDetail()">查看内容及证据图片</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showVote()">查看公审情况</a>
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="查看公审情况" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
            <div style="margin-bottom:20px;font-weight: bold;" id='base'></div>
            
            <div style="margin-bottom:20px">
                <table id="pg" class="easyui-propertygrid" style="width:500px" data-options="showHeader:false"></table>
            </div>
   	</div>
   	
   	<div align="center" id="dlg2" class="easyui-dialog" title="查看任务内容" 
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
</body>
</html>