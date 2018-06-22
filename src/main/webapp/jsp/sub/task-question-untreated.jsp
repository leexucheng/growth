<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<script type="text/javascript">
	
	function query(){
		var userCode =  $.trim($("#userCode").val());
		$("#datagrid").datagrid("options").url="/dbs/web/untreated.do?userCode="+userCode;
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
	
	function finished(t){
		var url = baseUri + "/web/untreated.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		
		var extra2 = $.trim($("#extra2").val());
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
                        $("#extra2").val("");
                    }else{
                    	$.messager.alert('提示','操作失败：'+result);
                    }
                },'json');
            }
        });
	}
	
	function answers(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		$("#dlg3").dialog("open");
		
		var url = baseUri + "/app/question/replies.do";
		var param = {orderBy:'t.create_time asc',resultType:'record',taskCode:row.taskCode};
		var trs = "";
		var temp = "<tr><td width='50%' style='color:blue;font-weight:blod;'>用户_USERCODE  回复于：_CREATETIME</td>"+
	   				"<td width='50%'>"+
	   					"打赏比率  (输入整数): <input type='text' style='width:50px' value='0' name='percentage' uid=_UID>%"+
	   				"</td>"+
		   			"</tr>"+
		   			"<tr>"+
		   				"<td colspan='2' width='100%' style='text-indent: 30px;'>_CONTENT</td>"+
		   			"</tr><tr><td colspan='2'> </td></tr>"
        $.post(url,param,function(result){
            if (result.code == 0){
            	$("#replies").empty();
            	var datas = result.datas;
            	for(var i=0;i<datas.length;i++){
            		var time = "";
            		if(datas[i].createTime){
            			var d = new Date(datas[i].createTime);
            			time = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
            		}
            		
            		var tr2 = temp.replace("_USERCODE",datas[i].replyUserCode)
            					  .replace("_CONTENT",datas[i].contentText)
            					  .replace("_UID",datas[i].replyUserCode)
            					  .replace("_CREATETIME",time);
            		$("#replies").append(tr2);
            	}
            }else{
            	$.messager.alert('提示','操作失败：'+result);
            }
        },'json');
	}
	
	function confirmReward(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		var params = {taskCode:row.taskCode};
		var doms = $("input[name='percentage']");
		var total = 0;
		doms.each(function(i,e){
			var percent = $(this).val();
			var uid = $(this).attr("uid")
			if(percent > 0){
				params[uid] = parseInt(percent);
				total += parseInt(percent);
			}
		});
		
		if(total != 100){
			$.messager.alert('提示','所有打赏比率之和必须为100%');return;
		}
		
		$.messager.confirm('提示','确定为发单方分配悬赏吗？',function(r){
            if (r){
            	var url = baseUri + "/app/question/reward.do";
                $.post(url,params,function(result){
                    if(result.code == 0 ){
                    	 $.messager.alert('提示','操作成功');
                    	 $('#datagrid').datagrid('reload');
                    }else{
                    	$.messager.alert('提示','操作失败：'+result.msg);
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
	<table class="easyui-datagrid" id='datagrid' url="/dbs/web/untreated.do"
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'taskCode'"  >任务编号</th>
               <th data-options="field:'title'"  >标题</th>
               <th data-options="field:'userCode'" >用户代码</th>
               <th data-options="field:'content'" >内容</th>
               <th data-options="field:'reward'" >赏金</th>
               <th data-options="field:'createTime'" formatter="timefrt">发布时间</th>
               <th data-options="field:'finishTime'" formatter="timefrt">完成时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   	
   	          用户代码 ：<input class="easyui-textbox" id='userCode' style="width:110px" maxlength="20">
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="query()">查询</a>
       
      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="$('#datagrid').datagrid('reload')">刷新</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showDetail()">查看内容</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="answers()">回答内容</a>
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
   			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="confirmReward()">确定代发单方打赏用户</a>
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