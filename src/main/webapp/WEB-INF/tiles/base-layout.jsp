<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOGE :: 호게</title>
    <script
      src="https://kit.fontawesome.com/d94ff6bbbc.js"
      crossorigin="anonymous"
    ></script>
    <!-- font -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Abel&display=swap" rel="stylesheet">     
    <link rel="stylesheet" href="../../resources/css/style.css" />
    <link rel="stylesheet" href="../../resources/css/mypage_style.css" />
    <!-- <script src="main.js" defer></script> -->
  </head>
   <body>
      <tiles:insertAttribute name="commonheader"/> 
      
      <tiles:insertAttribute name="body"/>

      <tiles:insertAttribute name="footer"/> 
  </body>
</html>