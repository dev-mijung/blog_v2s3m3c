<%@ page contentType="text/html; charset=UTF-8" %>
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
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class='title_line'>
    첨부 파일
  </div>
  
  <div class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test='${param.upload_count > 0 }'>
            <li class='li_none'>
              <span class='span_success'>파일을 등록했습니다.</span>
            </li>
            <li class='li_none'>
              <span class='span_success'>정상 등록 된 파일 ${param.upload_count } 건 </span>
            </li>
          </c:when>
          <c:otherwise>
            <li class='li_none'>
              <span class='span_fail'>파일 등록에 실패했습니다.</span>
            </li>
          </c:otherwise>
        </c:choose>
        <li class='li_none'>
          <br>
          <button type='button' 
                      onclick='location.href="../blog_contents/read.do?contents_no=${param.contents_no}"'
                      class='btn btn-info'>업로드된 파일 확인</button>
          <button type='button'
                      onclick='location.href="../blog_contents/list_all.do?cate_no=${param.cate_no }"'
                      class='btn btn-info'>목록</button>
        </li>
      </ul>
    </fieldset>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>