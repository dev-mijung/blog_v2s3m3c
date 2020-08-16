<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang='ko'>
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
  <aside style='float: left'>
    <a href='../blog_categrp/list.do'>카테고리 그룹</a> >
    <a href='../blog_cate/list.do'>카테고리</a> > 
    등록
  </aside>
  <div class='menu_line'></div>
  
  <div class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test='${cnt == 1 }'>
            <li class='li_none'>
              <span class='span_success'>새로운 컨텐츠를 등록 했습니다. ^^</span>
            </li>
          </c:when>
          <c:otherwise>
            <li class='li_none'>
              <span class='span_fail'>새로운 컨텐츠 등록에 실패 했습니다. ㅠㅠ</span>
            </li>
          </c:otherwise>
        </c:choose>
        
        <li class='li_none'>
          <br>
          <c:choose>
            <c:when test='${cnt == 1 }'>
              <button type='button'
                          onclick='location.href="./create.do?cate_no=${param.cate_no}"'
                          class='btn btn-info'>새로운 컨텐츠 등록</button>
            </c:when>
            <c:otherwise>
              <button type='button'
                          onclick='history.back();'
                          class='btn btn-info'>다시 시도</button>
            </c:otherwise>
          </c:choose>
          
          <button type='button'
                      onclick='location.href="./list.do?cate_no=${param.cate_no }"'
                      class='btn btn-info'>목록</button>
        </li>
      </ul>
    </fieldset>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>