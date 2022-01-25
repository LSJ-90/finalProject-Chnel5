<!-- 이승준: 부트스트랩을 이용한 데모뷰, 디자인 적용 시 삭제 될 것-->
<!-- 이승준: ID값 적용된 변수=> userId,check_id, userPwd,userPwdConfirm,check_pwd,check_pwdConfirm -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script type="text/javascript">
		$(function(){
			// 아이디 정규표현식: 아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리만 가능
			var idRegex = /^[a-z][a-z0-9]{5,12}$/;
			
			// 비밀번호 정규표현식: 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
			var pwdRegex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; 
			
			// 비밀번호 유효성 체크(신버전)
			$("#userPwd").on("keyup",function() {
				var $pwd = $(this).val();
				if (!(pwdRegex.test($pwd))) {
					$("#check_pwd").html("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여 8~16자리까지만 가능합니다!!  :(").css("color", "red");
					// $("#registerBtn").attr("disabled", true);
				} else {
					$("#check_pwd").html("사용가능한 비밀번호 입니다!!  :)").css("color", "green");
				}
			});
			
			// 비밀번호 일치 확인(신버전)
			$("#userPwd, #userPwdConfirm").on("keyup", function () {
				var $pwd = $("#userPwd").val();
				var $pwdConfirm = $("#userPwdConfirm").val();
				
				if ($pwd != $pwdConfirm) {
			 		$("#check_pwdConfirm").html("불일치!! :(").css("color", "red");
			 	} else if ($pwd == "") {
			 		$("#check_pwdConfirm").html("");
			 	} else {
					$("#check_pwdConfirm").html("일치!! :)").css("color", "green");
			 	}
			});

		<%-- 비밀번호 유효성 체크(구버전)
			$("#userPwd").on("keyup",function() {
				var pwd = $("#userPwd").val();
				console.log(pwd);
				if (!(pwdRegex.test(pwd))) {
					$("#check_pwd").text("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여 8~16자리까지만 가능합니다!!  :(");
					$("#check_pwd").css("color", "red");
					$("#registerBtn").attr("disabled", true);
				} else {
					$("#check_pwd").text("사용가능한 비밀번호 입니다!!  :(");
					$("#check_pwd").css("color", "blue");
				}
			});
		--%>
			
		<%-- 비밀번호 일치 확인(구버전)
			 
			$("#userPwdConfirm").blur(function() {
				var pwd = $("#userPwd").val(); 
				var pwdConfirm = $(this).val();
				var satusValue = "";
				if (pwd != pwdConfirm) {
					$("#check_pwdConfirm").text("비밀번호가 일치하지 않습니다!!  :(");
					$("#check_pwdConfirm").css("color", "red");
					$("#registerBtn").attr("disabled", true);
				} else {
					$("#check_pwdConfirm").text("비밀번호가 일치합니다!!  :)");
					$("#check_pwdConfirm").css("color", "blue");
				}
			});
		--%>
		
			// 아이디 유효성 체크
			$("#userId").blur(function() {
				var id = $(this).val();
				
				$.ajax({
					url : "/register/checkId",
					type : "POST",
					data: {userId : id},
					success : function(reuslt) {
						// 확인용: console.log("1=중복 // 0=정상 : "+ reuslt);							
						
						if (reuslt == 1) {
							// 1 : 중복
							$("#check_id").text("사용중인 아이디입니다!!  :(");
							$("#check_id").css("color", "red");
							// $("#registerBtn").attr("disabled", true);
						} else {
							
							// 0 : 정상, 형식검사 시작
							if (idRegex.test(id)) {
								$("#check_id").text("사용가능한 아이디 입니다!!  :)");
								$("#check_id").css("color", "blue");
							} else if (id == "") {
								$("#check_id").text("아이디를 입력해주세요!!  :(");
								$("#check_id").css("color", "red");
								// $("#registerBtn").attr("disabled", true);
							} else if (!(idRegex.test(id))) {
								$("#check_id").text("아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리까지만 가능합니다!! :(");
								$("#check_id").css("color", "red");
								// $("#registerBtn").attr("disabled", true);
							}
						}
								
					}, error : function() {
							console.log("실패");
						}
				});
			});
		});
	</script>
</head>
<div class="container mt-3">  
	<div class="row">
		<div class="col">
    		<h3>회원가입폼</h3>
		</div>
	</div> 
    <div class="row mb-3">
    	<div class="col-7">
    		<%-- 
    			회원가입 중 오류가 발생하면 아래 경고창에 표시된다.
    			오류 메세지는 RequestAttributes의 addFlashAttribute(String name, Object value) 메소드를 사용해서 전달한다.
    		 
    		<c:if test="${not empty error }">
    			<div class="alert alert-danger">
    				${error }
    			</div>
    		</c:if>
    		--%>
    		<form class="border p-3 bg-light" method="post" action="register">
    			<div class="mb-3">
    				<label class="form-label">아이디</label>
    				<input type="text" class="form-control" id="userId" name="id" placeholder="ID를 입력하고 빈칸을 누르세요." required/>
    				<div class="" id="check_id"></div>
    			</div>
    			<div class="mb-3">
    				<label class="form-label">비밀번호</label>
    				<input type="password" class="form-control" id="userPwd" name="pwd" placeholder="비밀번호를 입력하세요." required/>
    				<div class="" id="check_pwd"></div>
    			</div>
    			<div class="mb-3">
    				<label class="form-label">비밀번호 체크</label>
    				<input type="password" class="form-control" id="userPwdConfirm" name="userPwdConfirm"/>
    				<div class="" id="check_pwdConfirm"></div>
    			</div>
    			<div class="mb-3">
    				<label class="form-label">이름</label>
    				<input type="text" class="form-control" name="name">
    			</div>
    			<div class="mb-3">
    				<label class="form-label">전화번호</label>
    				<input type="text" class="form-control" name="tel"/>
    			</div>
    			<div class="mb-3">
    				<label class="form-label">이메일</label>
    				<input type="text" class="form-control" name="email"/>
    			</div>
    			<div class="mb-3">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="F" checked>
						<label class="form-check-label">여자</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="M">
						<label class="form-check-label" >남자</label>
					</div>
    			</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    <span>사용자 약관 전체 동의</span>
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    <span>서비스 이용 약관 동의 (필수)</span>
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    <span>개인정보 취급방침 동의 (필수)</span>
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    <span>만14세 이상 확인 (필수)</span>
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    <span>평생회원제동의 (선택)</span>
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    <span>마케팅정보 수신 동의 (선택)</span>
				  </label>
				</div>
				<div class="mb-1 text-end">
    				<input type="submit" id="registerBtn" class=""  value="회원가입"/> <!-- disabled -->  
    			</div>
    		</form>
    	</div>
    </div>
</div>