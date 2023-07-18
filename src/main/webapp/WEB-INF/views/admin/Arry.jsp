<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 최신 버전 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<script>
function getShowSeatList() {
	  $.ajax({
	    url: "${pageContext.request.contextPath}/showing/getShowSeatList",
	    type: "post",
	    //contentType: "application/json",
	    data: {showSq: showSq},
	    dataType: "json",
	    success: function(result) {
	      console.log(result);
	      var width = parseInt('${concertHall.concertHallWidth}');
	      var height = parseInt('${concertHall.concertHallHeight}');
	      var container = $('#container');
	      container.empty();
	      container.css({
	        'grid-template-columns': 'repeat(' + width + ', 30px)',
	        'display': 'grid',
	        'width': width * 30 + 'px'
	      });
	      var index = 0;
	      var seatClassSq; // 좌석클래스 시퀀스
	      var seatClass; // 좌석클래스 명
	      var seatNo; // 좌석 번호
	      const set = new Set(); // 중복제거를 위한 셋 선언
	      for (var i = 0; i < width; i++) {
	        for (var j = 0; j < height; j++) {
	          seatClassSq = result.data[index].seatClassSq;
	          seatClass = result.data[index].seatClass;
	          seatNo = result.data[index].seatNo;
	          index++; // 좌석 갯수 만큼 인덱스 증가
	          set.add(seatClass);

	          var item = $('<button type="button" data-seatclasssq="' + seatClassSq + '" data-seatno="' + seatNo + '">')
	            .attr('id', seatNo)
	            .addClass('item')
	            .addClass(seatClass)
	            .val(seatNo)
	            .text(seatNo);

	          container.append(item);
	        }
	      }
	      // 클래스 명 배열에 저장
	      var cssarr = ['red', 'pink', 'blue', 'green'];
	      var index2 = 0; // 클래스배열에서 사용할 인덱스
	      for (let index of set) {
	        $("." + index).addClass(cssarr[index2]);
	        index2++;
	      }
	    },
	    error: function(XHR, status, error) {
	      console.error(status + " : " + error);
	    }
	  });
	   }
</script>

</html>