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
		<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
		<script type="text/javascript">
            // 路径配置
            require.config({
                paths: {
                    echarts: 'http://echarts.baidu.com/build/dist'
                }
            });

            // 使用
            require(
                [
                    'echarts',
                    'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('main'));

                    var option = {
                        title : {
                            text: '未来一周气温变化',
                            subtext: '纯属虚构'
                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['最高气温','最低气温']
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        xAxis : [
                            {
                                type : 'category',
                                boundaryGap : false,
                                data : ['周一','周二','周三','周四','周五','周六','周日']
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value',
                                axisLabel : {
                                    formatter: '{value} °C'
                                }
                            }
                        ],
                        series : [
                            {
                                name:'最高气温',
                                type:'line',
                                data:[11, 11, 15, 13, 12, 13, 10],
                                markPoint : {
                                    data : [
                                        {type : 'max', name: '最大值'},
                                        {type : 'min', name: '最小值'}
                                    ]
                                },
                                markLine : {
                                    data : [
                                        {type : 'average', name: '平均值'}
                                    ]
                                }
                            },
                            {
                                name:'最低气温',
                                type:'line',
                                data:[1, -2, 2, 5, 3, 2, 0],
                                markPoint : {
                                    data : [
                                        {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                                    ]
                                },
                                markLine : {
                                    data : [
                                        {type : 'average', name : '平均值'}
                                    ]
                                }
                            }
                        ]
                    };
                    // 为echarts对象加载数据
                    myChart.setOption(option);
                }
            );
		</script>

	</div>
</div>
<%@ include file="include/bottom.jsp"%>
</body>
</html>