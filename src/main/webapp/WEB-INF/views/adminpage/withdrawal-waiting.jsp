<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>

 <main id="main">
      <article id="admin-user">
        <form class="search-user__form" id="form-search-user" method="get" action="withdrawal">
          <input type="hidden" name="page" value="1" />
          <ul class="search-bar">
          	 <li>총 선택금액:<strong id="total" class="text-danger">0</strong> 원<li> 
     		 <li><button type="button" class="btn__search" id="btn-withdrawal-submit" onclick="">선택 승인</button><li>
     		 <li><button type="button" class="btn__search" id="btn-withdrawal" onclick="location.href='/admin/withdrawal'">승인 완료 목록</button><li>
	          <li>
		        <select class="search__select" name="opt">
					<option value="" selected disabled="disabled">검색조건</option>
					<option value="호스트번호">호스트번호</option>
					<option value="호스트이름">호스트이름</option>
				</select>
	          </li>
	          <li>
		        <input
		              type="text"
		              class="search-user"
		              name="value"
		              value=""
		          />
		          <button type="button" class="btn__search" id="btn-search-user">검색</button>
	          </li>
          </ul>
        </form>
		<form class="" id="withdrawal-approval" method="post" action="withdrawal-approval">
		<table class="user-list-table">
			<colgroup>
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 15%;">
				<col style="width: 15%;">
				<col style="width: 11%;">
				<col style="width: 8%;">
				<col style="width: 13%;">
				<col style="width: 16%;">
			
			</colgroup>
			<thead>
				<tr>
					<th class="style"><input type='checkbox' name='withdrawal'  value='selectall' class="selectAll"/>전체선택</th>
					<th class="style">호스트번호</th>
					<th class="style">호스트이름</th>
					<th class="style">금액</th>
					<th class="style">예금주</th>
					<th class="style">계좌번호</th>
					<th class="style">은행</th>
					<th class="style">승인</th>
					<th class="style">출금신청일</th>
				</tr>
			</thead>
				<tbody id="dataSection">
		
			</tbody>
		</table>
		</form>

		
<!-- 페이지 내비게이션 표시 -->		
		<div class="row mb-3">
			<div class="col">
				<div class="pagination">
					<ul id="paginationBox" class="pagination">
		
					</ul>
				</div>
			</div>
		</div>

		
      
      </article>
    </main>

<script type="text/javascript">
$(function(){
	
	activeMenu("매출관리", "송금 신청내역");
	})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ", ");
}

getWithdrawal();


function getWithdrawal(page) {
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
	$.ajax({
		type: 'POST',
		url : "/admin/getWithdrawal.do", //서비스 주소 
		data : { //서비스 처리에 필요한 인자값
			page : page,
			opt : opt,
			value : value
		},
		success : function(result) {
			const list = result['list'];
			const pagination = result['pagination'];
	
			var data = "";
			var block = "";
			
			// 테이블의 row를 삽입하는 부분
			
			for (var i = 0; i < list.length; i++) {
				data += "<tr>";
				data += "<td><input type='checkbox' name='withdrawal' value=" + list[i].withdrawalNo + "></td>";
				data += "<td>" + list[i].hostNo + "</td>";
				data += "<td>" + list[i].hostName + "</td>";
				data += "<td style='color:red' data-amount='"+ list[i].amount +"'><span>" + numberWithCommas(list[i].amount) + "</span>원</td>";
				data += "<td>" + list[i].accountHolderName + "</td>";
				data += "<td>" + list[i].accountNumber + "</td>";
				data += "<td>" + list[i].bankName + "</td>";
				data += "<td>승인대기</td>";
				data += "<td>" + list[i].createdDate + "</td>";
				data += "</tr>";
			}
			$("#dataSection").html(data);
			
				
				

			// 이전버튼 활성화 여부를 결정하는 부분
			if (pagination['prevPage']) {
				block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawal("
						+ (pagination['beginPage'] - 1)
						+ ")'> < </a></li>";
			} else {
				block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
			}

			// 번호를 표시하는 부분
			for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
				if (page !== i) {
					block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawal("
							+ i + ")'>" + (i) + "</a></li>";
				} else {
					block += "<li class='page-item disabled'><a class='page-link'>"
							+ (i) + "</a></li>";
				}
			}

			if (pagination['nextPage']) {
				block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawal("
						+ (pagination['endPage'] + 1)
						+ ")'>  > </a></li>";
			} else {
				block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
			}
			
			$("#paginationBox").html(block);
		}
	})
}


$(".selectAll").change(function(){
	$("#dataSection [type=checkbox][name=withdrawal]").prop("checked", $(this).prop("checked"))
	setTotalPrice()
})


// $("컨테이너").on("이벤트이름", "대상엘리먼트", 이벤트핸들러함수)
$("#dataSection").on("change", '[type=checkbox][name=withdrawal]', function() {
	// 전체선택을 제외한 체크박스들의 갯수 
	var len = $("#dataSection [type=checkbox][name=withdrawal]").length;
	var ckLen = $("#dataSection [type=checkbox][name=withdrawal]:checked").length;
	
	if(len === ckLen){ //3-3
		$(".selectAll").prop("checked", true);
	}else{
		$(".selectAll").prop("checked", false);
	}
	setTotalPrice()    
})


function setTotalPrice() {
	var totalPrice = 0;
	//$("#dataSection :checkbox:checked").closest("tr").find("td:eq(3) span").each(function() {
	//	totalPrice += parseInt($(this).text().replace(/,\s/g, ''))
	//});
	$("#dataSection :checkbox:checked").closest("tr").find("td:eq(3)").each(function() {
		totalPrice += parseInt($(this).data("amount"))
	});
	
	$("#total").text(totalPrice.toLocaleString());
}

function checkboxArr() {
    var checkArr = [];     // 배열 초기화
    $("input[name='withdrawal']:checked").each(function(i) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    })
 
    $.ajax({
        url: 'approveWithdrawal'
        , type: 'post'
        , dataType: 'text'
        , data: {
        	withdrawalNoList: checkArr
        }
    });
}


$("#btn-withdrawal-submit").click(function(){
	
	checkboxArr();
	getWithdrawal();
});
</script>