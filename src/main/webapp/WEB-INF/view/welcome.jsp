<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title><c:set var="iutilsName" value='${fnc:getConfig("iutils.name")}' />${iutilsName} - 首页</title>
	<%@ include file="include/head.jsp"%>
	<style>
		.tpl-content-wrapper{margin-left:0}
		.widget-body{padding: 13px 20px;}
	</style>
</head>
<body>
<script src="${ctxStatic}/assets/js/theme.js"></script>
<!-- 内容区域 -->
<div class="tpl-content-wrapper">
	<div class="row-content am-cf">
		<div class="am-u-sm-12 am-u-md-6">
			<div class="widget am-cf">
				<div class="widget-head am-cf">
					<div class="widget-title am-fl">系统运行状况</div>
				</div>
				<div class="widget-body widget-body-md am-fr">
					<div class="am-progress-title">JVM内存 <span class="am-fr am-progress-title-more">${systemInfo.usedMemory}MB / ${systemInfo.maxMemory}MB</span></div>
					<div class="am-progress">
						<div class="am-progress-bar am-progress-bar-danger" style="width: ${systemInfo.maxMemory/systemInfo.usedMemory}%"></div>
					</div>
					<div class="am-progress-title">物理内存 <span class="am-fr am-progress-title-more">${systemInfo.memery}% / 100%</span></div>
					<div class="am-progress">
						<div class="am-progress-bar" style="width: ${systemInfo.memery}%"></div>
					</div>
					<div class="am-progress-title">CPU使用 <span class="am-fr am-progress-title-more">28% / 100%</span></div>
					<div class="am-progress">
						<div class="am-progress-bar  am-progress-bar-warning" style="width: 75%"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="am-u-sm-12 am-u-md-6">
			<div class="widget am-cf">
				<div class="widget-head am-cf">
					<div class="widget-title am-fl">服务器基本信息</div>
				</div>
				<div class="widget-body widget-body-md am-fr">
					<p>JAVA虚拟机：${systemInfo.javaVendor} ${systemInfo.javaVmName} (${systemInfo.javaVersion})</p>
					<p>服务器名称：${systemInfo.osName}</p>
					<p>服务器架构：${systemInfo.osArch}</p>
					<p>服务器时间：${systemInfo.javaTime}</p>
				</div>
			</div>
		</div>
	</div>

	<div id="main" class="row-content am-cf" style="height: 400px; width: 600px;">
		<script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
		<script type="text/javascript">
            // 基于准备好的dom，初始化echarts图表
            var myChart = echarts.init(document.getElementById('main'));

            var option = {
                title: {
                    text: '折线图堆叠'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['周一','周二','周三','周四','周五','周六','周日']
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        name:'邮件营销',
                        type:'line',
                        stack: '总量',
                        data:[120, 132, 101, 134, 90, 230, 210]
                    },
                    {
                        name:'联盟广告',
                        type:'line',
                        stack: '总量',
                        data:[220, 182, 191, 234, 290, 330, 310]
                    },
                    {
                        name:'视频广告',
                        type:'line',
                        stack: '总量',
                        data:[150, 232, 201, 154, 190, 330, 410]
                    },
                    {
                        name:'直接访问',
                        type:'line',
                        stack: '总量',
                        data:[320, 332, 301, 334, 390, 330, 320]
                    },
                    {
                        name:'搜索引擎',
                        type:'line',
                        stack: '总量',
                        data:[820, 932, 901, 934, 1290, 1330, 1320]
                    }
                ]
            };
            myChart.setOption(option);
        </script>

	</div>
</div>
<%@ include file="include/bottom.jsp"%>
</body>
</html>