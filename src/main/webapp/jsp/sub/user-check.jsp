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
		$("#datagrid").datagrid("options").url="/dbs/web/checkuser.do?"+param;
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
		
		$("#dlg").dialog("open");
		
		var imgs = "";
		if(row.userCode){
			imgs += "<img src='"+baseUri+"/upload/header/"+row.userCode+".jpg' width=500><br><br>";
		}
		if(row.certificateImg){
			imgs += "<img src='"+row.certificateImg+"' width=500><br><br>";
		}
		if(row.corpImg){
			imgs += "<img src='"+row.corpImg+"' width=500><br><br>";
		}
		if(row.cardImg1){
			imgs += "<img src='"+row.cardImg1+"' width=500><br><br>";
		}
		if(row.cardImg2){
			imgs += "<img src='"+row.cardImg2+"' width=500><br><br>";
		}
		
		$("#imgs").html(imgs);
	}
	
	function pass(t){
		var url = baseUri + "/web/checkuserinfo.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		
		var advice = $.trim($("#checkAdvice").textbox('getText'));
    	if(advice == ''){
    		$.messager.alert('提示','请输入审核意见');return;
    	}
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var param = {checkAdvice:advice,isChecked:t,userId:row.userId};
                $.post(url,param,function(result){
                    if (result){
                    	$('#datagrid').datagrid('reload');   // reload 
                        $.messager.alert('提示','操作成功');
                        $("#checkAdvice").textbox('setText','');
                    }else{
                    	$.messager.alert('提示','操作失败：'+result);
                    }
                },'json');
            }
        });
	}
	
	function showContent(index,field,value){
		$("#user-content").empty();
		if(value){
			$("#user-content").text(value);
		}
		$("#dlg2").dialog("open");
	}
	
	$(function(){
		query();
	});
</script>
<title>内容审核</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid' 
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true,onDblClickCell:showContent">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'userCode'" width="80">编码</th>
               <th data-options="field:'nickName'" width="80">昵称</th>
               <th data-options="field:'realName'" width="80">真实姓名</th>
               <th data-options="field:'sex'" width="80">性别</th>
               <th data-options="field:'country'" width="80">国家</th>
               <th data-options="field:'province'" width="80">省</th>
               <th data-options="field:'city'" width="80">城市</th>
               <th data-options="field:'area'" width="80">区县</th>
               <th data-options="field:'industry'" width="80">所在行业</th>
               <th data-options="field:'favorTrade'" width="80">关注行业</th>
               <th data-options="field:'score'" width="80">积分</th>
               <th data-options="field:'introduction'" width="80">简介</th>
               <th data-options="field:'corpName'" width="80">公司</th>
               <th data-options="field:'mobile'" width="80">手机</th>
               <th data-options="field:'email'" width="80">EMAIL</th>
               <th data-options="field:'career'" width="80">职业</th>
               <th data-options="field:'isChecked'" width="80">审核</th>
               <th data-options="field:'checkAdvice'" width="80">审核意见</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   	<form id='form1' class='easyui-form'>
   		用户编码 ：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
   		<select id="cbx-check-id" class="easyui-combobox" name="isChecked" style="width:100px;" data-options="panelHeight:'auto'">
		    <option value="0">未审核</option>
		    <option value="1">已审核</option>
		</select>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
   	 </form>    
   	 <form id='form2' class='easyui-form'>    
   	         审核意见 ：<input class="easyui-textbox" id='checkAdvice' name='checkAdvice' style="width:280px" maxlength="50">
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showDetail()">用户相关图片</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass(1)">通过</a>
       <!-- 
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="pass(0)">屏蔽任务</a>
        -->
   	 </form>
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="查看用户相关图片" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
   		<p id='imgs'></p>
   	</div>
   <div align="center" id="dlg2" class="easyui-dialog" title="查看内容" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:400px;height:270px;padding:10px">
   		<p id='user-content'></p>
   	</div>
</body>
</html>