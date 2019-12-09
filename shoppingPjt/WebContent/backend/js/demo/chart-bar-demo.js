// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
var datas = new Array();
$.ajax({
	url : "./SelectBarChart.ajax",
	dataType : "json",
	success : function(data) {
		var max = data.result[0].count;
		for (var i = 0; i < data.result.length; i++) {
			datas.push(data.result[i].count);
			if(max < parseInt(data.result[i].count))
				max = data.result[i].count
		}
		max = parseInt(max) + 10;
		var ctx = document.getElementById("myBarChart");
		var myLineChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "월", "화", "수", "목", "금", "토", "일" ],
				datasets : [ {
					label : "Revenue",
					backgroundColor : "rgba(2,117,216,1)",
					borderColor : "rgba(2,117,216,1)",
					data : datas,
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'month'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 6
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : max,
							maxTicksLimit : 5
						},
						gridLines : {
							display : true
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

// Bar Chart Example

