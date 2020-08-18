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
    전체 첨부 파일
  </div>
  
  <aside style='float: left;'>
    <a href='./list.do'>모든 이미지 파일</a>
  </aside>
  <aside style='float: right;'>
    <a href='javascript:location.reload();'>새로고침</a>
  </aside>
  <div class='menu_line' style='clear: both;'></div>
  
  <div style='width: 100%;'>
    <table class='table table-striped' style='width: 100%;'>
      <colgroup>
        <col style='width: 10%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
      </colgroup>
      
      <thead>
        <tr>
          <th style='text-align: center;'>NO</th>
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>원본<br>파일명</th>
          <th style='text-align: center;'>저장<br>파일명</th>
          <th style='text-align: center;'>Preview<br>파일명</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      </thead>
    
    <tbody>
      <c:forEach var='blog_attachfileVO' items='${list }'>
        <c:set var='contents_no' value='${blog_attachfileVO.contents_no }'/>
        <c:set var='fname' value='${blog_attachfileVO.fname.toLowerCase() }'/>
        <c:set var='attachfile_no' value='${blog_attachfileVO.attachfile_no }'/>
        <c:set var='thumb' value='${blog_attachfileVO.thumb }'/>
        <c:set var='fupname' value='${blog_attachfileVO.fupname }'/>
        <c:set var='attachfile_rdate' value='${blog_attachfileVO.attachfile_rdate }'/>
        
        <tr>
          <td style='vertical-align: middle; text-align: center;'>${attachfile_no }</td>
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>  
              <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif') }">
                <img src='./storage/${thumb }'>
              </c:when> 
              <c:otherwise>
                ${fname }
              </c:otherwise>
            </c:choose>
          <td style='text-align: center; vertical-align: middle;'>${fname }</td>
          <td style='text-align: center; vertical-align: middle;'>${fupname }</td>
          <td style='text-align: center; vertical-align: middle;'>${thumb }</td>
          <td style='text-align: center; vertical-align: middle;'>${attachfile_rdate.substring(0,10) }</td>
          <td style='text-align: center; vertical-align: middle;'>
            <a href='./delete.do?attachfile_no=${attachfile_no }'><span class="glyphicon glyphicon-trash"></span></a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
   </table>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>