<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<style type="text/css">
	#content-table tr th {
		text-align: left;height:25px;
	}
	#content-table tr:nth-child(odd) {
		background-color: #f5f5f5;
	}
	#conversation-table tr {
		text-align: left;height:35px;
	}
	#conversation-table tr:nth-child(odd) {
		background-color: #f5f5f5;
	}
</style>
<script type="text/javascript">
	
	function query(){
		var param = $("#form1").form("getSerialize");
		$("#datagrid").datagrid("options").url=contextPath + "/web/taskinservice.do?"+param;
		$("#datagrid").datagrid("reload");
		
		var json = $("#form1").form("getData");
		if(json.asserted == 1){
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
		
		var ab = $("#content-table").find("td");
		ab.each(function(i,e){
			var n = $(this).attr("name");
			if(row[n]){
				if(n.indexOf("Time") > 0){
					var v = timefrt(row[n]);
					$(this).text(v);
				}else{
					$(this).text(row[n]);
				}
			}
		});
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
		
		if(row.imgs){
			var arr = row.imgs.split(";");
			var html = "";
			for(var i=0;i<arr.length;i++){
				html += "<img src='"+arr[i]+"' width=500><br><br>";
			}
			$("#imgs").html(html);
		}else{
			$("#imgs").empty();
		}
		return;
		
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
	
	function finished(t){
		var url = baseUri + "/web/taskjudge.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		
		var extra2 = $.trim($("#extra3").textbox("getValue"));
    	if(extra2 == ''){
    		$.messager.alert('提示','请输入判定理由');return;
    	}
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var param = {extra2:extra2,state:t,taskId:row.taskId};
                $.post(url,param,function(result){
                    if (result == 1){
                    	$('#datagrid').datagrid('reload');   // reload 
                        $.messager.alert('提示','操作成功');
                        $("#extra3").textbox("setValue","");
                    }else{
                    	$.messager.alert('提示','操作失败：'+result);
                    }
                },'json');
            }
        });
	}
	
	function showConversation(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		if(row.userCode && row.handlerUserCode){
			$("#dlg3").dialog("open");
			var sessionTag = row.userCode +"-"+ row.handlerUserCode;
			var url = baseUri + "/app/task/dialog.do";
			var param = {sessionTag:sessionTag,taskCode:row.taskCode};
            $.post(url,param,function(result){
            	var _temp = "<tr><th width='110'>_USER</th><td align='_ALIGN'>_CONTENTTEXT (_TIME)</td><th align='right' width='110'>_HANDLER</th></tr>";
            	$("#conversation-table").empty();
            	
            	for(var i=0;i<result.datas.length;i++){
            		var item = result.datas[i];
            		var tr = _temp;
            		var replyImgURL = contextPath + "/upload/reply/"+item.contentImage;
            		var baseVoiceURL = contextPath + "/upload/voice/"+item.contentVoice;
            		if("T" == item.replayType){
            			tr = _temp.replace('_CONTENTTEXT',item.contentText);
            		}else if("I" == item.replayType){
            			tr = _temp.replace('_CONTENTTEXT','<img src="'+replyImgURL+'" width=280><BR>');
            		}else if("V" == item.replayType){
            			tr = _temp.replace('_CONTENTTEXT','<audio src="'+baseVoiceURL+'" controls style="width:220px;"></audio><BR>');
            		}
            		
            		if(item.createTime){
            			var stime = timefrt(item.createTime);
            			tr = tr.replace("_TIME",stime);
            		}
            		if(item.replayUserCode == row.userCode){
            			tr = tr.replace("_USER","发单人("+item.replayUserCode+")").replace("_HANDLER","").replace("_ALIGN","left");
            		}else{
            			tr = tr.replace("_USER","").replace("_HANDLER","接单人("+item.replayUserCode+")").replace("_ALIGN","right");
            		}
            		
            		$("#conversation-table").append(tr);
            	}
            },'json');
            
            
		}
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
               <th data-options="field:'fixedCost'" width="80">固定成本</th>
               <th data-options="field:'reward'" width="80">赏金/服务费</th>
               <th data-options="field:'penalty'" width="80">保证金</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">发布时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   		<form id='form1' class='easyui-form'>
	   		任务编号：<input class="easyui-textbox" id='taskCode-id' name='taskCode' style="width:280px" maxlength="50">
	   		<select id="cbx-check-id" class="easyui-combobox" name="asserted" style="width:100px;" data-options="panelHeight:'auto'">
			    <option value="0">未完成</option>
			    <option value="1">已完成</option>
			</select>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
   	   </form>
       
       <form id='form2' class='easyui-form'>    
	   	         审核理由：<input class="easyui-textbox" id='extra3' name='extra3' style="width:280px" maxlength="50">
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showDetail()">查看内容及证据图片</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showConversation()">查看交流记录</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="finished(1)" id='finished1'>认定任务完成</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="finished(0)" id='finished0'>认定任务未完成</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="$('#dlg2').dialog('open')">判定说明</a>
   	   </form>
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="查看任务内容" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
        <table style='width:100%;border-collapse: collapse;' border="0" id='content-table'>
        	<tr><th width='100'>标题</th><td name='title'></td></tr>
        	<tr><th>需求</th><td name='content'></td></tr>
        	<tr><th>标准</th><td name='handStandard'></td></tr>
        	<tr><th>发布时间</th><td name='createTime'></td></tr>
        	<tr><th>最大参与</th><td name='maxLimit'></td></tr>
        	<tr><th>期限</th><td name='handDuration'></td></tr>
        	<tr><th>求助类型</th><td name='infoType'></td></tr>
        	<tr><th>行业</th><td name='industry'></td></tr>
        	<tr><th>赏金</th><td name='reward'></td></tr>
        	<tr><th>保证金</th><td name='penalty'></td></tr>
        	<tr><th>地区</th><td name='cityName'></td></tr>
        	<tr><th>过期时间</th><td name='expireTime'></td></tr>
        	<tr><th>发布者</th><td name='userCode'></td></tr>
        	<tr><th>接单人</th><td name='handlerUserCode'></td></tr>
        	<tr><th>接单者完成时间</th><td name='finishTime'></td></tr>
        	<tr><th>证据提交时间</th><td name='evidenceTime'></td></tr>
        	<tr><th>接单人理由</th><td name='extra1'></td></tr>
        	<tr><th>是否审核</th><td name='isChecked'></td></tr>
        	<tr><th>交通工具</th><td name='transport'></td></tr>
        	<tr><th>快递</th><td name='expressType'></td></tr>
        	<tr><th>固定成本</th><td name='fixedCost'></td></tr>
        	<tr><th>客服判定</th><td name='asserted'></td></tr>
        	<tr><th>客服判定意见</th><td name='extra2'></td></tr>
        	<tr><th>客服判定时间</th><td name='assertTime'></td></tr> 
        	<tr><th>图片</th><td id='imgs'></td></tr> 
        	<tr><th>证据图片</th><td id='evidence'></td></tr> 
        </table>
   	</div>
   	
   	<div align="center" id="dlg3" class="easyui-dialog" title="任务交流记录" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:520px;height:470px;padding:10px">
   		<table style='width:100%;border-collapse:collapse;' cellpadding="4" border="0" id='conversation-table'></table>
   		
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