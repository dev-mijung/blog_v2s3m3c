<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>JJUNG'S BLOG</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="cate_no" value="${blog_Contents_VO.cate_no }"/>
<c:set var="contents_no" value="${blog_Contents_VO.contents_no }"/>

<jsp:include page="/menu/top.jsp" flush='false' />
  <div class='title_line'>
    ${blog_Cate_VO.cate_name }
  </div>
  
  <aside style='float: left;'>
    ${blog_Categrp_VO.blog_name } > ${blog_Cate_VO.cate_name }
  </aside>
  
  <aside style='float: right;'>
    <a href='../blog_attachfile/create.do?contents_no=${contents_no }&cate_no=${cate_no}'>파일 등록</a>
    <span class='menu_divide'> | </span>
    <a href='javascript:location.reload();'>새로고침</a>
    <span class='menu_divide'> | </span>
    <a href='./list_all.do?cate_no=${cate_no }'>목록</a>
    <span class='menu_divide'> | </span>
    <a href='./update.do?cate_no=${cate_no }&contents_no=${contents_no }'>수정</a>
    <span class='menu_divide'> | </span>
    <a href='./delete.do?cate_no=${cate_no }&contents_no=${contents_no }'>삭제</a>
  </aside>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='GET' action='./read.do'>
    <input type='hidden' name='contents_no' value='${contents_no }'>
    <fieldset class='fieldset'>
      <ul>
        <li class='li_none' style='border-bottom: solid 1px #AAAAAA;'>
          <span>${blog_Contents_VO.contents_title }</span>
          (<span>${blog_Contents_VO.contents_recom }</span>)
          <span>${blog_Contents_VO.contents_rdate.substring(0,16) }</span>
        </li>
        
        <li class='li_none'>
          <div>${blog_Contents_VO.contents_content }</div>
        </li>
        
        <li class='li_none'>
          <div>${blog_Contents_VO.contents_web }</div>
        </li>
        
        <li class='li_none'>
          <div>검색어(키워드): ${blog_Contents_VO.contents_word }</div>
        </li>
      </ul>
    </fieldset>
  </form>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>