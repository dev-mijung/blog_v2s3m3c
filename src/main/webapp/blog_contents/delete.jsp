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
    컨텐츠 삭제
  </div>
  
  <aside style='float: left;'>
    <a href='../blog_categrp/list.do'>카테고리 그룹</a> >
    <a href='./list.do?cate_no=${cate_no }'>${blog_Cate_VO.cate_name }</a> >
    삭제
  </aside>
  
  <aside style='float: right;'>
    <a href='./list_all.do?cate_no=${cate_no }'>목록</a>
  </aside>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='POST' action='./delete.do'>
    <input type='hidden' name='contents_no' value='${param.contents_no }'>
    <input type='hidden' name='cate_no' value='${param.cate_no }'>
    
    <div class='form-group'>
      <div class='col-md-12' style='text-align: center; margin: 30px;'>
        삭제 되는 글: ${blog_Contents_VO.contents_title } <br><br>
        삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다. <br><br>
      </div>
    </div>
    
    <div class='form-group'>
      <div class='col-md-12'>
        <input type='password' class='form-control' name='contents_passwd' placeholder='패스워드'
                style='width: 20%; margin: 10px auto;'>
      </div>
    </div>
     
     <div style='text-align: center;'>
      <button type='submit' class='btn btn-info'>삭제</button>
      <button type='button' onclick='history.back();' class='btn btn-info'>취소</button>
     </div>
  </form>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>