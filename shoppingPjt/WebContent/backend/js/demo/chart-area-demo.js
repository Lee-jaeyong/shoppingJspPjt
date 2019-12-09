// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
function selectAreaChart(date){
	$.ajax({
		url : "./SelectAreaChart.ajax",
		data : {
			date : date
		},
		dataType : "json",
		success : function(data) {
			$("#areaChart").children().remove();
			$("#areaChart").append('<canvas id="myAreaChart" width="100%" height="30"></canvas>');
			var arrays = new Array();
			var max = data.result[0].count
			for(var i= 0;i<data.result.length;i++)
			{
				arrays.push(data.result[i].count);
				if(max < parseInt(data.result[i].count))
					max = data.result[i].count;
			}
			max = parseInt(max) + 10;
			var ctx = document.getElementById("myAreaChart");
			var myLineChart = new Chart(ctx,
					{
				type : 'line',
				data : {
					labels : [ "1시", "2시", "3시", "4시", "5시", "6시", "7시",
						"8시", "9시", "10시", "11시", "12시", "13시", "14시",
						"15시", "16시", "17시", "18시", "19시", "20시",
						"21시", "22시", "23시", "24시" ],
						datasets : [ {
							label : "",
							lineTension : 0.3,
							backgroundColor : "rgba(2,117,216,0.2)",
							borderColor : "rgba(2,117,216,1)",
							pointRadius : 5,
							pointBackgroundColor : "rgba(2,117,216,1)",
							pointBorderColor : "rgba(255,255,255,0.8)",
							pointHoverRadius : 5,
							pointHoverBackgroundColor : "rgba(2,117,216,1)",
							pointHitRadius : 50,
							pointBorderWidth : 2,
							data : arrays,
						} ],
				},
				options : {
					scales : {
						xAxes : [ {
							time : {
								unit : 'date'
							},
							gridLines : {
								display : false
							},
							ticks : {
								maxTicksLimit : 7
							}
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								max : max,
								maxTicksLimit : 5
							},
							gridLines : {
								color : "rgba(0, 0, 0, .125)",
							}
						} ],
					},
					legend : {
						display : false
					}
				}
			});
		}
	});
}
