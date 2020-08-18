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
  <div class='title_line'>
    컨텐츠 삭제
  </div>
  
  <div class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test="${passwd_cnt == 1 }"> <!-- 패스워드 일치 -->
            <c:choose>
              <c:when test='${cnt == 1 }'> <!-- 글 삭제 성공 -->
                <li class='li_none'>
                  <span class='li_none'>
                    『${blog_Contents_VO.contents_title }』컨텐츠를 삭제 했습니다 ^^
                  </span>
                </li>
              </c:when>
              <c:otherwise> <!-- 글 삭제 실패-->
                <li class='li_none'>
                  <span class='span_fail'> 『${blog_Contents_VO.contents_title }』컨텐츠 삭제에 실패 했습니다 ㅠㅠ</span>
                </li>
                <li class='li_none'>
                  <span class='span_fail'>다시 시도해주세요.</span>
                </li>
             </c:otherwise>
            </c:choose>
           </c:when>
           <c:otherwise>
            <li class='li_none'>
              <span class='span_fail'>패스워드가 일치하지 않습니다. 다시 시도해주세요.</span>
            </li>
           </c:otherwise>
          </c:choose>
        
        <c:choose>
          <c:when test='${cnt == 1 && passwd_cnt == 1 }'>
            <li class='li_none'>
              <button type='button'
                          onclick='location.href="./list_all.do?cate_no=${param.cate_no}&contents_no=${param.contents_no }"'
                          class='btn btn-info'>목록</button>
            </li>
          </c:when>
          <c:otherwise>
            <li class='li_none'>
              <button type='button'
                          onclick='history.back();'
                          class='btn btn-info'>재시도</button>
              <button type='button'
                          onclick='location.href="./list_all.do?cate_no=${param.cate_no}"'
                          class='btn btn-info'>목록</button>
            </li>
          </c:otherwise>
        </c:choose>
      </ul>
    </fieldset>  
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>