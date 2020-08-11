<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>JJUNG'S BLOG</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<div class='title_line'>알림</div>
<div class='message'>
  <fieldset class='fieldset_basic'>
  <ul>
    <li class='li_none_left'>
      <span class='span_fail'> 블로그 카테고리 그룹(${blog_Categrp_VO.blog_name }) 삭제에 실패 했습니다.</span>
    </li>
    <li class='li_none_left'>
      <span class='span_fail'> 다시 시도 해주세요.</span>
    </li>
    <li class='li_none_left'>
    <button type='button' onclick='history.back()'>다시 시도</button>
    <button type='button' onclick="location.href='./list.do'">목록</button>
    </li>
  </ul>
  </fieldset>
</div>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>