<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<style type="text/css">
	.css1{
		height:40px;border-bottom:1px solid #dddddd;display: flex;align-items:center;justify-content: center;margin:auto;cursor: pointer;
	}
	.accordion .accordion-header-selected{
		background: #eeeeee;color:#333333;
	}
	.accordion .accordion-header-selected .panel-title{
		color:#333333;
	}
</style>
<script type="text/javascript">
	function addTab(title,type,page,id){
		var tab = $('#maintabs').tabs('getTab',title);
		if(tab){
			$('#maintabs').tabs('select',title);return;
		}
		var _src = contextPath + "/jsp/sub/"+page;
		$('#maintabs').tabs('add',{
			tools:[{
		        iconCls:'icon-mini-refresh',
		        handler:function(){
		        	reloadUrl(id,_src);
		        }
		    }],
			title:title,
		    closable:true,
		    content:'<iframe id="'+id+'" src="'+_src+'" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>'
		});
	}
	
	function reloadUrl(id,url){
		$("#"+id).attr("src",url);
	}
</script>
<title>欢迎</title>
</head>
<body class='easyui-layout'>
		<div data-options="region:'north'" style="height:50px">
			<div align="center" style="display: flex;justify-content:center;align-items:center;font-size: 1.4rem;color: #555555;font-weight: bold;height:100%;font-family: '微软雅黑'">
	        	求助宝后台管理程序
        	</div>
		</div>
        <div data-options="region:'south',split:true" style="height:50px;">
        	<div align="center" style="display: flex;justify-content:center;align-items:center;font-size: 1rem;color: #333333;font-weight: bold;height:100%;">
	        	求助宝 Copyright © 2010-2017 www.cpijiang.cn
        	</div>
        </div>
        <!-- <div data-options="region:'east',split:true" title="East" style="width:180px;">
            <ul class="easyui-tree" ></ul>
        </div> -->
        <div data-options="region:'west',split:true" style="width:200px;">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="用户申请" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'judger','apply-role.jsp?type=judger','sq001')">公审员申请</div>
                    <div class="css1" onclick="addTab(this.innerText,'corp','apply-role.jsp?type=corp','sq002')">公司申请</div>
                    <div class="css1" onclick="addTab(this.innerText,'expert','apply-role.jsp?type=expert','sq003')">专家申请</div>
                    <div class="css1" onclick="addTab(this.innerText,'professional','apply-role.jsp?type=professional','sq004')">职业人申请</div>
                </div>
                <div title="用户管理" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','modifyUser.jsp','modifyUser')">密码重置/推送消息/流水明细</div>
                </div>
                <div title="财务" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','apply-withdraw.jsp','cw001')">用户提现申请</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','withdraw-record.jsp','cw002')">用户提现记录</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','user-income.jsp','cw003')">用户收入明细</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','user-spend.jsp','cw004')">用户消费明细</div>
                    
                </div>
                <div title="信息审核" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','user-check.jsp','sh001')">用户信息审查</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','task-check.jsp','sh002')">任务内容审查</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','task-service.jsp','sh004')">客服介入任务</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','service-mgt.jsp','sh006')">客服管理</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','task-check.jsp','sh007')">退费处理</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','task-judge.jsp','sh005')">公审任务查看</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','sysMsg.jsp','sh009')">系统消息</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','complaint-check.jsp','sh003')">举报投诉及涉黄赌毒管理</div>
                </div>
                <div title="超期任务" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','task-question-untreated.jsp','cq001')">超期问答</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','task-argument-untreated.jsp','cq002')">超期未处理争议</div>
                </div>
                <div title="前端管理" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','banner.jsp','szBanner')">设置Banner</div>
                </div>
                <div title="自营管理" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','goods.jsp','goods')">商品管理</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','orders.jsp','orders')">订单管理</div>
                </div>
                <div title="数据分析" style="padding:10px;">
                    <div class="css1" onclick="addTab(this.innerText,'tx','userData.jsp','users')">用户数据</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','loginData.jsp','logins')">登陆数据</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','taskData.jsp','tasks')">任务数据</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','commission.jsp','commisionDetails')">佣金明细</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','commissionSum.jsp','commissionSum')">佣金合计</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','zombieFans.jsp','zombieFans')">僵尸粉统计</div>
                    <div class="css1" onclick="addTab(this.innerText,'tx','analysis-Orders.jsp','analysisOrders')">订单数据</div>
                </div>
            </div>
        </div>
        <div data-options="region:'center',iconCls:'icon-ok'">
            <div class="easyui-tabs" id='maintabs' data-options="fit:true,border:false,plain:true">
            </div>
        </div>
</body>
</html>