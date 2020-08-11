<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<div class='container' style='width: 100%'>
  <!-- 화면 상단 메뉴-->
  <nav class='top_menu'>
    <span style='padding-left: 0.5%;'></span>
    <a class='menu_link'  href='${root}' >Home</a> |
    <a class='menu_link'  href='${root}/blog_categrp/list.do'>카테고리 그룹</a> |
    <a class='menu_link'  href='${root}/blog_cate/list.do'>카테고리</a> |
    <a class='menu_link'  href='${root}/blog_categrp/list.do'>전체글</a>
  </nav>
</div>
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성-->
  <div class="row" style='margin-top: 2px;'>
    <div class="col-sm-3 col-md-2"> <!-- 메뉴 출력 컬럼-->
      <%-- <img src='${root}/menu/images/1s.jpg' style='width: 100%;'> --%>
       <div style='margin-top: 5px; margin-left:20px;'>
         <img src='${root}/menu/images/peng.jpg' style='width: 80%;'><br>JJUNG'S BLOG
         <br>
         ▷ <a href='${root }/blog_categrp/list.do'>전체글</a>
       </div>
    </div>
    
    <div class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
   
<div class='content'>
 