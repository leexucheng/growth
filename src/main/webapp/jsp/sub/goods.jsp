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
	function query() {

		$("#datagrid").datagrid("options").url = contextPath + "/web/show/allGoods.do";
		$("#datagrid").datagrid("reload");

	}
	
	function addGoods() {
		imgUrl = "";
		$("#dlg").dialog("open");
	}
	
	function submitForm() {

		var json = $("#addForm").form("getData")
		var url = baseUri + "/web/add/goods.do";
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				$.post(url, json, function(result) {
					if (result) {
						$('#datagrid').datagrid('reload'); // reload the user data
						$.messager.alert('提示', '操作成功');
						$("#addForm").form("clear")
						$("#dlg").dialog("close")
					}
				}, 'json');
			}
		});
	}

	var imgUrl = "";

	function doUpload() {
		var url = contextPath + '/web/upload/goodsImg.do';
		var formData = new FormData($("#uploadImg")[0]);
		$.ajax({
			url : url,
			type : 'POST',
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(goodsFile) {
				alert("上传成功！");
				$("#img").val(goodsFile);
			},
			error : function(goodsFile) {
				alert(goodsFile);
			}
		});
	}

	function deleteGoods() {
		var row = $('#datagrid').datagrid('getSelected');
		if (!row) {
			$.messager.alert('提示', '请选择需要删除的数据');
			return;
		}
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				var url = contextPath + '/web/delete/goods.do'
				var param = {
					goodsId : row.goodsId
				};
				$.post(url, param, function(result) {
					if (result > 0) {
						$('#datagrid').datagrid('reload'); // reload the user data
						$.messager.alert('提示', '操作成功');
					}
				}, 'json');
			}
		});
	}
	
	function loadMenu(i,e){
		var row = $("#datagrid").datagrid("getSelected");
		
		//alert(row.goodsId);
		//根据主键查询
		$("#datagrid2").datagrid("options").url = contextPath + "/web/show/allMenus.do?goodsId="+row.goodsId;
		$("#datagrid2").datagrid("reload");
	}
	
	function addMenu(){
		var row = $("#datagrid").datagrid("getSelected");
		if(!row){
			alert('请选择商品');return;
		}
		$('#datagrid2').datagrid('appendRow',{goodsId:row.goodsId});
		editIndex = $('#datagrid2').datagrid('getRows').length-1;
        $('#datagrid2').datagrid('selectRow', editIndex)
                		.datagrid('beginEdit', editIndex);
	}
	
	function deleteMenu(){
		var row = $('#datagrid2').datagrid('getSelected');
		if (!row) {
			$.messager.alert('提示', '请选择需要删除的数据');
			return;
		}
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				var url = contextPath + '/web/delete/menu.do'
				var param = {
					menuId : row.menuId
				};
				$.post(url, param, function(result) {
					if (result > 0) {
						$('#datagrid2').datagrid('reload'); // reload the user data
						$.messager.alert('提示', '操作成功');
					}
				}, 'json');
			}
		});
	}
	
	function saveMenu(){
		var rows = $('#datagrid2').datagrid('getChanges');
		$('#datagrid2').datagrid('acceptChanges');
		var url = baseUri + "/web/add/menus.do";
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				var data = JSON.stringify(rows);
				 
				$.ajax({
	                url: baseUri + "/web/add/menus.do",
	                type: "POST",
	                contentType : 'application/json;charset=utf-8', //设置请求头信息
	                dataType:"json",
	                data: data,    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
	                success: function(data){
	                	$('#datagrid2').datagrid('reload'); 
	                }
	            });
			}
		});
	}
	
	function updateGoods() {
		$("#dlg2").dialog("open");
		var row = $('#datagrid').datagrid('getSelected');
		if(!row) {
			$messager.alert('提示', '请选择需要修改的商品');
		} 
	}
	
	function updateForm() {
		var row = $('#datagrid').datagrid('getSelected');
		var json = $("#upForm").form("getData");
		if(json.outOfStock == 0){
			$('#backInStock').datebox('setValue', currentDate());	
			json.backInStock = currentDate();		
		}
		json.goodsId = row.goodsId;
		$.messager.confirm('提示', '确定操作吗？', function(r) {
			if (r) {
				var url = contextPath + '/web/update/goods.do'
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
	
	function goodsStatus(v,e,i) {
		if(v == 1){
			return "预售商品";
		} else {
			return "有库存";
		}
	}
	
	function timeFmt(v) {
		if(v){
			var time = new Date(v);
			return time.getFullYear() + "-" + (time.getMonth() + 1 ) + "-" + time.getDate();
		}
	}

	$(function() {
		query();
	});
</script>
<title>商品管理</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'east',split:true" title="商品详情/套餐" style="width: 300px;">
			<table class="easyui-datagrid" id='datagrid2'
                   data-options="url:'datagrid_data1.json',singleSelect:true,method:'get',singleSelect:true,fit:true,toolbar:'#tb2',fitColumns:true">
               <thead>
                   <tr>
                    <th data-options="field:'ck',checkbox:true"></th>
                   	<th data-options="field:'menuType',width:100,editor:{type:'textbox',options:{required:true}}">套餐</th>
                	<th data-options="field:'price',width:80,align:'right',editor:{type:'numberbox',options:{precision:1,required:true}}">原价</th>
                   </tr>
                 </thead>
             </table>
		</div>
		<div data-options="region:'center',title:'商品列表'">
			<table class="easyui-datagrid" id='datagrid'
				data-options="rownumbers:true,singleSelect:true,method:'get',fit:true,fitColumns:true,toolbar:'#tb',pagination:true,onClickRow:loadMenu,onSelect:loadMenu">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'title'" width="80">商品名称</th>
						<th data-options="field:'price'" width="80">价格</th>
						<th data-options="field:'cost'" width="80">成本价</th>
						<th data-options="field:'mktprice'" width="80">建议价格</th>
						<th data-options="field:'store'" width="80">库存</th>
						<th data-options="field:'storePlace'" width="80">库位</th>
						<th data-options="field:'decPics'" width="50">图片路径</th>
						<th data-options="field:'outOfStock'" width="50" formatter="goodsStatus">预售产品</th>
						<th data-options="field:'backInStock'" width="50" formatter="timeFmt">预售日期</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="tb" style="height: auto">
		<form id='form2' class='easyui-form'>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok',plain:true" onclick="addGoods()">新增商品</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-no',plain:true" onclick="deleteGoods()">删除商品</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-reload',plain:true" onclick="updateGoods()">更新商品</a>
		</form>
	</div>
	<div id="tb2" style="height: auto">
		<form id='form4' class='easyui-form'>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok',plain:true" onclick="addMenu()">增加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true" onclick="deleteMenu()">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-save',plain:true" onclick="saveMenu()">保存</a>
		</form>
	</div>

	<div align="center" id="dlg" class="easyui-dialog" title="添加商品"
		data-options="iconCls:'icon-rearch',closed:true"
		style="width: 500px; height: 470px; padding: 10px">
		<div class='easyui-panel' data-options="fit:true">
			<form id="uploadImg" class="easyui-form">
				<div style="margin-bottom: 20px">
					上传文件： <input type="file" name="file" /> <input type="button"
						value="上传" onclick="doUpload()" />
				</div>
			</form>
			<form id="addForm" class="easyui-form">
				<input type="hidden" name="decPics" id="img">
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="title" style="width: 100%"
						data-options="label:'商品名称',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="price" style="width: 100%"
						data-options="label:'价格',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="cost" style="width: 100%"
						data-options="label:'成本价',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="mktprice" style="width: 100%"
						data-options="label:'建议价格',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="store" style="width: 100%"
						data-options="label:'库存',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="storePlace" style="width: 100%"
						data-options="label:'库位',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-textbox" name="outOfStock" style="width: 100%"
						data-options="label:'是否为预售商品（默认0不是，输入1设置为“预售”）',required:true">
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-datebox" name="backInStock" style="width: 100%"
						data-options="label:'预售日期',required:true">
				</div>
			</form>
			<div style="text-align: center; padding: 5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitForm()" style="width: 80px">提交</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$('#addForm').form('clear')" style="width: 80px">清空</a>
			</div>
		</div>
	</div>
	<div align="center" id="dlg2" class="easyui-dialog" title="添加商品"
		data-options="iconCls:'icon-rearch',closed:true"
		style="width: 500px; height: 470px; padding: 10px">
		<div class='easyui-panel' data-options="fit:true">
			<form id="upForm" class="easyui-form">
				<div style="margin-bottom: 20px">
				<select class="easyui-combobox" name="outOfStock" label="是否为预售商品" style="width:100%">
					<option value="0">有库存</option>
					<option value="1">预售商品</option>
				</div>
				<div style="margin-bottom: 20px">
					<input class="easyui-datebox" name="backInStock" id="backInStock" style="width: 100%"
						data-options="label:'预售日期',required:true">
				</div>
			</form>
			<div style="text-align: center; padding: 5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="updateForm()" style="width: 80px">提交</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$('#upForm').form('clear')" style="width: 80px">清空</a>
			</div>
		</div>
	</div>
</body>
</html>