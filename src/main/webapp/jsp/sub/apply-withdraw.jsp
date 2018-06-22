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
		$("#datagrid").datagrid("options").url = contextPath + "/web/withdraws.do?"+param;
		$("#datagrid").datagrid("reload");
		
	}
	
	function pass(p){
		var url = baseUri + "/web/checkwithdraw.do";
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		var dealRemark = $.trim($("#dealRemark").textbox('getText'));
		if(dealRemark == ''){
    		$.messager.alert('提示','请输入审核意见！');return;
    	}
		
		$.messager.confirm('提示','确定操作吗？',function(r){
            if (r){
            	var param = {dealRemark:dealRemark,state:p,withdrawId:row.withdrawId};
                $.post(url,param,function(result){
                    if (result){
                    	$('#datagrid').datagrid('reload');   // reload the user data
                        $.messager.alert('提示','操作成功');
                        $("#dealRemark").textbox('setText','');
                    }
                },'json');
            }
        });
	}
	
	function showDetail(){
		
	}
	
	function timefrt(v,e,i){
		if(v){
			var d = new Date(v);
			return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" " +d.getHours()+":"+d.getMinutes();
		}
	}
	
	function showAsset(){
		var row = $('#datagrid').datagrid('getSelected');
		if(!row)return;
		$("#dlg").dialog("open");
		
		$("#userCode2").text(row.userCode);
		
		$("#income-datagrid").datagrid("options").url=contextPath + "/web/cashincome.do?userCode="+row.userCode;
		$("#income-datagrid").datagrid("reload");
		
		$("#spend-datagrid").datagrid("options").url=contextPath + "/web/cashspend.do?userCode="+row.userCode;
		$("#spend-datagrid").datagrid("reload");
		
		var param = {userCode:row.userCode};
		var url = contextPath + "/app/user/asset.do";
        $.post(url,param,function(result){
            if (result.code == 0){
            	$("#income2").text(result.attr.income);
            	$("#spend2").text(result.attr.spend);
            	$("#balance2").text(result.model.balance);
            }
        },'json');
		
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
               <th data-options="field:'withdrawId'" width="30">申请编号</th>
               <th data-options="field:'userCode'" width="30">用户代码</th>
               <th data-options="field:'amount'" width="80">提现金额</th>
               <th data-options="field:'alipay'" width="80">支付宝收款帐号</th>
               <th data-options="field:'weixin'" width="80">微信收款帐号</th>
               <th data-options="field:'remark'" width="80">用户备注</th>
               <th data-options="field:'summary'" width="80">说明</th>
               <th data-options="field:'createTime'" width="70" formatter="timefrt">申请时间</th>
           </tr>
       </thead>
   </table>
   <div id="tb" style="height:auto">
   		<form id='form1' class='easyui-form'>
	   		用户编码：<input class="easyui-textbox" id='userCode-id' name='userCode' style="width:280px" maxlength="50">
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="btn" onclick="query()">查询</a>
	   	 </form>
	   	 <form id='form2' class='easyui-form'>    
	   	         审核意见：<input class="easyui-textbox" id='dealRemark' style="width:280px" maxlength="80">
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="pass(1)">通过审核</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="pass(0)">不通过</a>
	       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-more',plain:true" onclick="showAsset()">查看用户收支明细</a>
	   	 </form>
   </div>
   
   <div align="center" id="dlg" class="easyui-dialog" title="查看用户收支明细" 
   			data-options="iconCls:'icon-rearch',closed:true" style="width:960px;height:470px;padding:10px">
   		<div class='easyui-layout' data-options="fit:true">
   			<div region='north' style='height:50px;'>
   				<p style="color:#333333;font-size: 13px;font-weight: bolder;padding:0 10px;">
   					 用户编码：<span id='userCode2'>  </span>　|　收入：<span id='income2'></span>　|　
   					 支出：<span id='spend2'></span>　|　余额：<span id='balance2'></span>
   				</p> 
   			</div>
   			<div region='west' style='width:50%;'>
   				<table class="easyui-datagrid" id='income-datagrid' title="收入明细" 
                       data-options="singleSelect:true,method:'get',fit:true,fitColumns:true,pagination:true">
			       <thead>
			           <tr>
			               <th data-options="field:'userCode'" width="30">用户代码</th>
			               <th data-options="field:'amount'" width="40">收入金额</th>
			               <th data-options="field:'summary'" width="80">说明</th>
			               <th data-options="field:'createTime'" width="50" formatter="timefrt">收入时间</th>
			           </tr>
			       </thead>
			   </table>
   			</div>
   			<div region='center' >
   				<table class="easyui-datagrid" id='spend-datagrid' title="支出明细" 
                       data-options="singleSelect:true,method:'get',fit:true,fitColumns:true,pagination:true">
			       <thead>
			           <tr>
			               <th data-options="field:'userCode'" width="30">用户代码</th>
			               <th data-options="field:'amount'" width="40">支出金额</th>
			               <th data-options="field:'summary'" width="80">说明</th>
			               <th data-options="field:'createTime'" width="50" formatter="timefrt">支出时间</th>
			           </tr>
			       </thead>
			   </table>
   			</div>
   		</div>
   	</div>
</body>
</html>