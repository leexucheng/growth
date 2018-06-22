<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<%
	String type = request.getParameter("type");
%>
<script type="text/javascript">
	var type = '<%=type%>';
	
	//取图片
	function imgSrc(str, div) {
		$("#"+div).empty();
		var arr = str.split(",");
		for(i in arr) {
			var img = "<img src='/dbs/upload/order/" + arr[i] + "' width='400'/> <br /> <br />";
			$("#"+div).append(img);
		}
	}
	
	function query() {
		
		var param = $("#form1").form("getSerialize");
		$("#datagrid").datagrid("options").url = contextPath + "/web/show/orders.do?" + param;
		$("#datagrid").datagrid("reload");

	}
	
	var imgUrl = "";
	
	function uploadImg() {
		imgUrl = "";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row){
			$.messager.alert('提示', '请选择需要修改 的订单');
		}
		if (row) {
			$("#dlg").dialog("open");
		}
	}

	function doUpload(formId) {
		var url = contextPath + '/web/upload/order.do';
		var formData = new FormData($("#" + formId)[0]);
		$.ajax({
			url : url,
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(dispatchImg) {
				alert("上传成功！");
				if(imgUrl.length > 0){
					imgUrl += ",";
				}
				imgUrl += dispatchImg;
			},
			error : function(dispatchImg) {
				alert(dispatchImg);
			}
		});
	}
	
	function updateOrder() {
		$("#dlg").dialog("open");
		var row = $('#datagrid').datagrid('getSelected');
		if(!row) {
			$.messager.alert('提示', '请选择需要修改的订单');
		} 
	}
	
	function submitForm() {
		var row = $('#datagrid').datagrid('getSelected');
		var json = {orderId: row.orderId, dispatchImg: imgUrl};
		
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				var url = contextPath + '/web/update/order.do'
				$.post(url, json, function(result) {
					if (result > 0) {
						$('#datagrid').datagrid('reload'); 
						$.messager.alert('提示', '操作成功');
						$('#dlg').dialog('close');
					}
				}, 'json');
			}
		});
	}
	
	function updateStatus() {
		$("#dlg2").dialog("open");
		var row = $('#datagrid').datagrid('getSelected');
		if(!row) {
			$.messager.alert('提示', '请选择需要修改的订单');
		} 
	}
	
	function updateForm() {

		var row = $('#datagrid').datagrid('getSelected');
		var json = $("#upForm").form("getData");
		
		json.orderId = row.orderId;
		
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				var url = contextPath + '/web/update/order.do'
				$.post(url, json, function(result) {
					if (result > 0) {
						$('#datagrid').datagrid('reload'); 
						$.messager.alert('提示', '操作成功');
						$('#dlg2').dialog('close');
					}
				}, 'json');
			}
		});
	}
	
	function tracing(v,e,i) {
		if(v == 0){
			return "待付款";
		} else if (v == 1) {
			return "待发货";
		} else if (v == 2) {
			return "待签收";
		} else {
			return "已收货";
		}
	}
	
	function status(v,e,i) {
		if(v == 0){
			return "退货";
		} else if (v == 1) {
			return "退款";
		} else if (v == 2) {
			return "退货退款";
		} else {
			return "交易成功";
		}
	}
	
	function timeFmt(v) {
		if(v){
			var time = new Date(v);
			return time.getFullYear() + "-" + (time.getMonth() + 1 ) + "-" + time.getDate();
		}
	}
	
	function showImg() {
		$("#dlg3").dialog("open");
		var row = $('#datagrid').datagrid('getSelected');
		if(!row) {
			$.messager.alert('提示', '请选择需要查看的订单');
		} 
		imgSrc(row.dispatchImg, "showImg");
	}

	$(function() {
		query();
	});
</script>
<title>商品管理</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',title:'订单列表'">
			<table class="easyui-datagrid" id='datagrid'
				data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'orderCode'" width="80">订单号</th>
						<th data-options="field:'createTime'" width="80" formatter="timeFmt">下单日期</th>
						<th data-options="field:'orderDes'" width="80">商品描述</th>
						<th data-options="field:'tracing'" width="80" formatter="tracing">订单追踪</th>
						<th data-options="field:'dispatchImg'" width="80">发货图片（路径）</th>
						<th data-options="field:'status'" width="80" formatter="status">订单状态</th>
						<th data-options="field:'refusalDes'" width="80">拒签/退货原因</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="tb" style="height: auto">
		<form id='form1' class='easyui-form'>
			订单编码 ：<input class="easyui-textbox" id='orderCode-id' name='orderCode' style="width:280px" maxlength="50">
			<select class="easyui-combobox" name="tracing" style="width:80px">
					<option selected="selected" value="">订单追踪</option>
					<option value="0">待付款</option>
					<option value="1">待发货</option>
					<option value="2">待签收</option>
					<option value="3">已收货</option>
			</select>
			<select class="easyui-combobox" name="status" style="width:80px">
					<option selected="selected" value="">订单状态</option>
					<option value="0">退货</option>
					<option value="1">退款</option>
					<option value="2">退货退款</option>
					<option value="3">交易成功</option>
			</select>
        	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="uploadImg()">上传发货图片</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="updateStatus()">更新订单状态</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="showImg()">查看发货图片</a>
		</form>
	</div>

	<div align="center" id="dlg" class="easyui-dialog" title="添加发货图片" data-options="closed:true" style="width: 500px; height: 470px; padding: 10px">
		<div class='easyui-panel' data-options="fit:true">
			<form id="uploadImg1" class="easyui-form">
				<div style="margin-bottom: 20px">
					上传文件： <input type="file" name="file" /> 
					<input type="button" value="上传" onclick="doUpload('uploadImg1')" />
				</div>
			</form>
			<form id="uploadImg2" class="easyui-form">
				<div style="margin-bottom: 20px">
					上传文件： <input type="file" name="file" /> 
					<input type="button" value="上传" onclick="doUpload('uploadImg2')" />
				</div>
			</form>
			<form id="uploadImg3" class="easyui-form">
				<div style="margin-bottom: 20px">
					上传文件： <input type="file" name="file" /> 
					<input type="button" value="上传" onclick="doUpload('uploadImg3')" />
				</div>
			</form>
			<div style="text-align: center; padding: 5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width: 80px">提交</a> 
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#uploadImg').form('clear')" style="width: 80px">清空</a>
			</div>
		</div>
	</div>
	<div align="center" id="dlg2" class="easyui-dialog" title="更新订单状态" data-options="closed:true" style="width: 500px; height: 470px; padding: 10px">
		<div class='easyui-panel' data-options="fit:true">
			<form id="upForm" class="easyui-form">
				<div style="margin-bottom: 20px">
				<select class="easyui-combobox" name="status" label="订单状态" style="width:100%">
					<option value="0">退货</option>
					<option value="1">退款</option>
					<option value="2">退货退款</option>
					<option value="3">交易成功</option>
				</select>	
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="refusalDes" style="width: 100%"
						data-options="label:'退货原因'">
				</div>
			</form>
			<div style="text-align: center; padding: 5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateForm()" style="width: 80px">提交</a> 
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#upForm').form('clear')" style="width: 80px">清空</a>
			</div>
		</div>
	</div>
	<div align="center" id="dlg3" class="easyui-dialog" title="发货图片" data-options="closed:true" style="width: 500px; height: 700px; padding: 10px">
		<div class='easyui-panel' data-options="fit:true" id="showImg"></div>
	</div>
</body>
</html>