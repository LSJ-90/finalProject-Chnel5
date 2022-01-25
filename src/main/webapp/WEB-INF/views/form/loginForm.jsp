<!-- 이승준: 부트스트랩을 이용한 데모뷰, 디자인 적용 시 삭제 될 것-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
 <main id="main">
  <div class="login-wrap">
    <header class="section__header">
      <h1 class="section__title">LOGIN</h1>
      <p class="section__text">로그인</p>
    </header>
    <article class="login">
      <c:if test="${not empty error }">
		<div class="mb-3 alert alert-danger">
			${error }
		</div>
	  </c:if>
      <form action="login" class="login-form" method="post">
        <div class="form__wrap">
          <div class="login__id">
            <input
              type="text"
              class="form__id"
              name="id"
              placeholder="아이디"
            />
          </div>
          <div class="login__pwd">
            <input
              type="password"
              class="form__pwd"
              name="pwd"
              placeholder="비밀번호"
            />
          </div>
        </div>
        <div class="login__btn">
          <button type="submit" class="btn__login">LOGIN</button>
        </div>
        <div class="login__etc">
          <a href="" class="sign-in">회원가입</a
          ><a href="" class="forgot-pwd">비밀번호 찾기</a>
        </div>
        <div class="login__sns">
          <p class="sns__title">SNS 계정으로 로그인하기</p>
          <div class="sns__login">
            <a href="">
              <img
                src="../../resources/images/main/sns_kakao.png"
                alt="kakao-icon"
                class="sns__icon"
            /></a>
          </div>
        </div>
      </form>
    </article>
  </div>
</main>