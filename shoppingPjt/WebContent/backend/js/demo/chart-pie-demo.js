// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
var array = new Array();
$.ajax({
	url : "./SelectPieChart.ajax",
	dataType : "json",
	success : function(data) {
		for (var i = 0; i < data.result.length; i++)
			array.push(data.result[i].count);
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "10대", "20대", "30대", "40대", "50대", "기타" ],
				datasets : [ {
					data : array,
					backgroundColor : [ '#007bff', '#dc3545', '#ffc107',
							'#28a745' ,'#FFB2F5' , '#993800'],
				} ],
			},
		});
	}
})
