<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<main id="main">
  <header class="section__header">
    <h1 class="section__title">MY PAGE</h1>
    <p class="section__text">마이페이지</p>
  </header>
  <article class="mypage">
    <div class="mypage__info">
      <p class="info__title">${LOGIN_USER.name}님 반가워요!</p>
      <p class="info__count">호게와 함께 0번의 여행을 했어요.</p>
    </div>
    <div class="host">
      <a href="/host/applyForm" class="host__registration">
        <img src="../../resources/images/main/login_icon.png" alt="" class="host__icon" />
        호스트 등록
      </a>
      <!--  
      호스트 등록 후
      <a href="/host/main" class="host__change">
        <img src="../../resources/images/main/login_icon.png" alt="" class="host__icon" />
        호스트 페이지
      </a>
      -->
    </div>
    <div class="mypage-wrap">
      <div class="mypage__menu">
        <ul class="menu__my-stay">
          <li class="my-stay__item title">My Stay</li>
          <li class="my-stay__item">
            <a href="" class="active">예약정보</a>
          </li>
          <li class="my-stay__item"><a href="">관심 스테이</a></li>
          <li class="my-stay__item"><a href="">다녀온 스테이</a></li>
          <li class="my-stay__item">
            <a href=""
              ><img src="../../resources/images/main/chat_icon.png" alt="" class="chat-icon"
            /></a>
          </li>
        </ul>
        <ul class="menu__my-info">
          <li class="my-info__item title">내 계정</li>
          <li class="my-info__item"><a href="">회원 정보 수정</a></li>
          <li class="my-info__item"><a href="">1:1 문의</a></li>
          <li class="my-info__item"><a href="">FAQ</a></li>
        </ul>
      </div>
      <div class="mypage__content">
        <ul class="content__menu">
          <li class="content__item"><a href="" class="active">STAY</a></li>
          <li class="content__item"><a href="">ACTIVITY</a></li>
        </ul>
        <div class="content">content</div>
      </div>
    </div>
  </article>
</main>