//data: 내가 서버로 넘기고자 하는 데이터타입  
//datatype : 내가 서버에서 받고자 하는 데이터타입

$(function() {
	parseJson();
	getJson();
});

function parseJson() {
	$.getJSON("json/bike.json" , function(data) {
		$.ajax({
			url : "bike.do?command=second_db",
			method : "post" ,
			data : { "obj" : JSON.stringify(data) } ,
			success : function(msg) {
				alert(msg);
			} ,
			error : function() {
				alert("data 저장 실패!");
			}
		});
	});
}
function getJson() {
	$.getJSON("json/bike.json" , function(data) {
		$.each(data , function(key , val) {
			if(key == "DESCRIPTION") {
				$("table").attr("border" , "1");
				$("thead").append(
					"<tr>"+
					"<th>"+val.ADDR_GU+"</th>"+
					"<th>"+val.CONTENT_ID+"</th>"+
					"<th>"+val.CONTENT_NM+"</th>"+
					"<th>"+val.NEW_ADDR+"</th>"+
					"<th>"+val.CRADLE_COUNT+"</th>"+
					"<th>"+val.LONGITUDE+"</th>"+
					"<th>"+val.LATITUDE+"</th>"+
					"</tr>"
				);
			} else { //key값이  DATA 일 경우
		  		var list = val;
					for(i=0; i<list.length; i++) {
						var str = list[i];
						$("tbody").append(
							"<tr>"
							+"<td>"+str.addr_gu+"</td>"
							+"<td>"+str.content_id+"</td>"
							+"<td>"+str.content_nm+"</td>"
							+"<td>"+str.new_addr+"</td>"
							+"<td>"+str.cradle_count+"</td>"
							+"<td>"+str.longitude+"</td>"
							+"<td>"+str.latitude+"</td>"
							+"</tr>"
						);
					}
			}
		});
	}); 
}