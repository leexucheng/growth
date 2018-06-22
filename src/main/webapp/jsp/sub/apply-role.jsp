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
		$("#datagrid").datagrid("options").url="/dbs/web/applies.do?"+param;
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
	
	function trans(v,e,i){
		
		if(!v || v == 0){
			return "否";
		}else if(v == 1){
			return "是";
		}else if(v == 2){
			return "申请中";
		}else{
			return "否";
		}
	}
	
	function pass(career){
		var url = baseUri + "/web/checkrole.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var param = {dbsDuty:type,career:career,userId:row.userId};
                $.post(url,param,function(result){
                    if (result){
                    	foceRefresh();   // reload the user data
                        $.messager.alert('提示','操作成功');
                    }
                },'json');
            }
        });
	}
	
	function showImg(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		var imgs = row.certificateImg;
		if(imgs){
			var imgarr = imgs.split(";");
			var imghtml = "";
			for(var i=0;i<imgarr.length;i++){
				imghtml += "<img width=560 src='"+imgarr[i]+"'/><br><br>";
			}
			$("#dlg").html(imghtml);
		}
		$('#dlg').dialog('open');
	}
	
	$(function(){
		query();
	});
</script>
<title>申请</title>
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
               <th data-options="field:'idCard'" width="80">身份证号</th>
               <th data-options="field:'mobile'" width="70">手机</th>
               <th data-options="field:'industry'" width="70">行业</th>
               <th data-options="field:'isExpert'" width="40" formatter="trans">专家</th>
               <th data-options="field:'isJudger'" width="40" formatter="trans">公审员</th>
               <th data-options="field:'isCorp'" width="40" formatter="trans">公司</th>
               <th data-options="field:'isProfessional'" width="40" formatter="trans">职业人</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   <form id='form1' class='easyui-form'>
   		用户编码 ：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
   		<select id="cbx-check-id" class="easyui-combobox" name="isChecked" style="width:100px;" data-options="panelHeight:'auto'">
		    <option value="2">申请中</option>
		    <option value="1">已通过</option>
		</select>
		<input type="hidden" value='<%=type%>' name='dbsDuty'>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
   	 </form>  
	 <form id='form2' class='easyui-form'>    
  	   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass(1)" id='finished1'>通过审核</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="pass(0)" id='finished0'>不通过</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showImg()">查看证件</a>
   	 </form>
   	 
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="查看证件图片" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:600px;height:470px;padding:10px">
    </div>
</body>
</html>