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
		
		$("#datagrid").datagrid("options").url = contextPath + "/web/selectAllBanners.do";
		$("#datagrid").datagrid("reload");
		
	}
	
	function addBanner(){
		imgUrl="";
		$("#dlg").dialog("open");
		
	}
	function submitForm() {
		
		var json = $("#addForm").form("getData")
		var url = baseUri + "/web/addBanners.do";
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
                $.post(url,json,function(result){
                    if (result){
                    	$('#datagrid').datagrid('reload');   // reload the user data
                        $.messager.alert('提示','操作成功');
                        $("#addForm").form("clear")
                        $("#dlg").dialog("close")
                    }
                },'json');
            }
        });
	} 
	
	var imgUrl = "";
	
	function doUpload() {
		var url = contextPath + '/web/upBanners.do';
		var formData = new FormData($("#uploadImg")[0]);
		$.ajax({
			url: url,
			type: 'POST',
			data: formData,
			async: false,
			cache: false,
			contentType: false,
			processData: false,
			success: function(fileName) {
				alert("上传成功！");
				$("#img").val(fileName);
			},
			error: function(fileName) {
				alert(fileName);
			}
		});
	}

	function deleteBanner(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row){$.messager.alert('提示','请选择需要删除的数据');return;}
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var url = contextPath + '/web/deleteBanners.do'
            	var param = {id:row.id};
                $.post(url,param,function(result){
                    if (result>0){
                    	$('#datagrid').datagrid('reload');   // reload the user data
                        $.messager.alert('提示','操作成功');
                    }
                },'json');
            }
        });
	}
	
	
	$(function(){
		query();
	});
</script>
<title>Banner设置</title>
</head>
<body>
	<table class="easyui-datagrid" id='datagrid'
                       data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
       <thead>
           <tr>
           	   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'img'" width="50">图片路径</th>
               <th data-options="field:'action'" width="30">跳转动作</th>
               <th data-options="field:'type'" width="80">类型</th>
               <th data-options="field:'param'" width="80">参数</th>
               <th data-options="field:'remark'" width="80">备注</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
	   	 <form id='form2' class='easyui-form'>    
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="addBanner()">添加</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="deleteBanner()">删除</a>
	   	 </form>
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="添加Banner" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:500px;height:470px;padding:10px">
   		<div class='easyui-panel' data-options="fit:true">
   			<form id="uploadImg" class="easyui-form">
   				<div style="margin-bottom:20px">
	                	上传文件： <input type="file" name="file"/>  
     			 	<input type="button" value="上传" onclick="doUpload()" />  
	            </div>
   			</form>
           	<form id="addForm" class="easyui-form">
           		<input type="hidden" name="img" id="img">
	            <div style="margin-bottom:20px">
	                <input class="easyui-textbox" name="action" style="width:100%" data-options="label:'跳转动作',required:true">
	            </div>
	            <div style="margin-bottom:20px">
	                <input class="easyui-textbox" name="type" style="width:100%" data-options="label:'类型：',required:true">
	            </div>
	            <div style="margin-bottom:20px">
	                <input class="easyui-textbox" name="param" style="width:100%;" data-options="label:'参数:',required:true">
	            </div>
	            <div style="margin-bottom:20px">
	                <input class="easyui-textbox" name="remark" style="width:100%;" data-options="label:'备注：',required:true">
	            </div>
			</form>
          <div style="text-align:center;padding:5px 0">
               <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
               <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#addForm').form('clear')" style="width:80px">清空</a>
          </div>
   		</div>
   	</div>
</body>
</html>