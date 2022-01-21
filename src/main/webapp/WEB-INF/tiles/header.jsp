<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/common/tags.jsp" %>
<header id="header">
  <div class="header-wrap">
    <div class="header__logo">
      <a href="/home"><img src="../../resources/images/common/mainLogo.png" alt="logo" class="logo" /></a>
    </div>
    <div class="search">
      <button class="search__stay">STAY</button>
      <button class="search__activity">ACTIVITY</button>
    </div>
    <nav id="nav">
      <ul class="nav__menu">
        <li class="nav__item">PROMOTION</li>
        <c:if test="${empty LOGIN_USER}">
        	<li class="nav__item">
        		<a href="/login">LOGIN</a>
        	</li>
        </c:if>
        <c:if test="${not empty LOGIN_USER}">
        	<li class="nav__item">
       			<a href="/mypage/main">
       				<img src="../../resources/images/common/my.png" alt="my" class="my" />
       			</a>
       		</li>
       		<li class="nav__item">
	       		<a href="/logout">LOGOUT</a>
       		</li>
        </c:if>
        <li class="nav__item"><i class="fas fa-globe"></i></li>
      </ul>
    </nav>
  </div>
</header>