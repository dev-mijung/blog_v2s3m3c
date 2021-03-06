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
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class='title_line'>
    ${blog_Cate_VO.cate_name }
  </div>
  
  <aside style='float: left;'>
    <a href='../blog_categrp/list.do'>카테고리 그룹</a> >
    <a href='../blog_cate/list_join_by_blog_categrpno.do?blog_categrpno=${blog_Cate_VO.blog_categrpno }'>${blog_Categrp_VO.blog_name }</a>
  </aside>
  <aside style='float: right;'>
    <a href='./create.do?cate_no=${blog_Cate_VO.cate_no }'>등록</a>
    <span class='top_menu_sep'> | </span>
    <a href='javascript:location.reload();'>새로고침</a>
  </aside>
  
  <div class='menu_line' style='clear: both;'></div>
  
  <div style='width: 100%;'>
    <table class='table table-striped' style='width: 100%;'>
      <colgroup>
        <col style='width: 15%;'/>
        <col style='width: 20%;'/>
        <col style='width: 50%;'/>
        <col style='width: 15%;'/>
        <col style='width: 10%;'/>
      </colgroup>
    
    <thead>
      <tr>
        <th style='text-align: center;'>등록일</th>
        <th style='text-align: center;'>카테고리</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>회원</th>
        <th style='text-align: center;'>IP</th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach var='blog_contents_VO' items='${list }'>
        <c:set var='contents_no' value='${blog_contents_VO.contents_no }'/>
        <c:set var='contents_rdate' value='${blog_contents_VO.contents_rdate }'/>
        <c:set var='cate_no' value='${blog_contents_VO.cate_no }'/>
        <c:set var='contents_title' value='${blog_contents_VO.contents_title }'/>
        <c:set var='member_no' value='${blog_contents_VO.member_no }'/>
        <c:set var='ip' value='${blog_contents_VO.ip }'/>
        
        <tr>
          <td style='text-align: center;'>${contents_rdate.substring(0,10) }</td>
          <td style='text-align: center;'>${blog_Cate_VO.cate_name }</td>
          <td style='text-align: center;'>
            <a href='./read.do?contents_no=${contents_no}'>${contents_title }</a>
          </td>
           <td style='text-align: center;'>${member_no }</td>
           <td style='text-align: center;'>${ip }</td>
        </tr>
      </c:forEach>
    </tbody>
   </table>
   <br><br>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>