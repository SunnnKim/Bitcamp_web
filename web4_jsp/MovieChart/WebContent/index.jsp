<%@page import="main.MovieManager"%>
<%@page import="dto.MovieVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MovieVo> list = MovieManager.getCGVdata();
	for(int i=0; i<list.size(); i++ ){
		System.out.println(list.get(i).toString());
	}

	// https://www.highcharts.com/demo
	// jquery cdn
	// 차트로 만들기 위해서는 list => json으로 바꿔주어야 함
	
	String jsonlike = "[";
	for(MovieVo m : list){
		jsonlike += "{ name:'" + m.getTitle() + "',y:"+m.getLike() +" }, ";
	}
	jsonlike = jsonlike.substring(0,jsonlike.lastIndexOf(","));	// 마지막 , 만 삭제하기
	jsonlike +="]";
	
	// json 확인 작업
	// System.out.println(jsonlike);
	
	
	// json에 접근하기
	request.setAttribute("jsonlike", jsonlike);	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

</head>
<body>

<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

<script type="text/javascript">

Highcharts.chart('container', {
	  chart: {
	    plotBackgroundColor: null,
	    plotBorderWidth: null,
	    plotShadow: false,
	    type: 'pie'
	  },
	  title: {
	    text: '영화가 좋아요'
	  },
	  tooltip: {
	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	  },
	  plotOptions: {
	    pie: {
	      allowPointSelect: true,
	      cursor: 'pointer',
	      dataLabels: {
	        enabled: true,
	        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	      }
	    }
	  },
	  series: [{
	    name: 'Brands',
	    colorByPoint: true,
	    data: <%= request.getAttribute("jsonlike")%> // json데이터 바로 갖다 붙일수 있음 
	    	
	    	
	  }]
	});

</script>

</body>
</html>