<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>JJUNG'S BLOG</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
  <div class='title_line'>
  <a href='../blog_categrp/list.do'>카테고리 그룹</a> > 
  <a href='./list.do'>모든 카테고리</a> >
  ${blog_Cate_VO.cate_name } 조회(삭제)</div>
  
  <div id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
  <form name='frm_create' id='frm_create' method='POST' action='./read_delete.do'>
    <input type='hidden' name='cate_no' id='cate_no' value='${blog_Cate_VO.cate_no }'>
      <div class='msg_warning'>삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.</div>
      
      <label>그룹 번호</label> : ${blog_Cate_VO.blog_categrpno} &nbsp;
      
      <label>카테고리 이름</label> : ${blog_Cate_VO.cate_name} &nbsp;
 
      <label>순서</label> : ${blog_Cate_VO.cate_seqno } &nbsp;
  
      <label>형식</label> : ${blog_Cate_VO.cate_visible } &nbsp;
      
      <label>등록 글수</label> : ${blog_Cate_VO.cate_cnt } &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">삭제 취소</button>
    </FORM>
  </DIV>
  
  <table class='table table-striped'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 30%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 5%;'/>
      <col style='width: 20%;'/>
    </colgroup>
    
    <thead>
      <tr>
       <th class="th_bs">그룹</th>
        <th class="th_bs">순서</th>
        <th class="th_bs">카테고리</th>
        <th class="th_bs">등록일</th>
        <th class="th_bs">출력</th>
        <th class="th_bs">글수</th>
        <th class="th_bs">기타</th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach var="blog_cateVO" items="${list }">
      <c:set var="cate_no" value="${blog_cateVO.cate_no }"/>
      <c:set var="blog_categrpno" value="${blog_cateVO.blog_categrpno }"/>
      <c:set var="cate_seqno" value="${blog_cateVO.cate_seqno }"/>
      <c:set var="cate_name" value="${blog_cateVO.cate_name }"/>
      <c:set var="cate_rdate" value="${blog_cateVO.cate_rdate }"/>
      <c:set var="cate_cnt" value="${blog_cateVO.cate_cnt }"/> 
      <c:set var="cate_visible" value="${blog_cateVO.cate_visible }"/>
     
        <tr>
        <td class="td_bs">${blog_categrpno}</td>
        <td class="td_bs">${cate_seqno }</td>
        <td class="td_bs">${cate_name }</a></td>
        <td class="td_bs">${cate_rdate.substring(0,10) }</td>
        <td class="td_bs">
          <c:choose>
            <c:when test='${cate_visible == "Y" }'>
              <a href='./update_visible.do?cate_no=${cate_no }&cate_visible=${cate_visible}'>
              <img src='./images/yes.png' style='width: 20%;'></a>
            </c:when>
            <c:otherwise>
              <a href='./update_visible.do?cate_no=${cate_no }&cate_visible=${cate_visible }'>
              <img src='./images/no.png' style='width: 20%;'></a>
            </c:otherwise>
          </c:choose>
        </td>
        <td class="td_bs">${cate_cnt }</td>
        <td class="td_bs">
          <a href='./read_update.do?cate_no=${cate_no }'><span class="glyphicon glyphicon-pencil"></span></a> / 
          <a href='./read_delete.do?cate_no=${cate_no }'><span class="glyphicon glyphicon-trash"></span></a> / 
          <a href='./update_seqno_up.do?cate_no=${cate_no }'><span class="glyphicon glyphicon-arrow-up"></span></a> / 
          <a href='./update_seqno_down.do?cate_no=${cate_no }'><span class="glyphicon glyphicon-arrow-down"></span></a>
        </td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  
 <jsp:include page="/menu/bottom.jsp"/>
</body>
</html>