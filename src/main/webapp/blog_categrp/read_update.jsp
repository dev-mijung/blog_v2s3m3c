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
  <div class='title_line'> 카테고리 그룹 > ${blog_Categrp_VO.blog_name } 조회(수정)</div>
  
  <div id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
  <form name='frm_create' id='frm_create' method='POST' action='./read_update.do'>
    <input type='hidden' name='blog_categrpno' id='blog_categrpno' value='${blog_Categrp_VO.blog_categrpno }'>
    
    <label>그룹 이름</label>
      <input type='text' name='blog_name' value='${blog_Categrp_VO.blog_name  }' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='blog_seqno' value='${blog_Categrp_VO.blog_seqno }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='blog_visible'>
        <option value='Y' ${blog_Categrp_VO.blog_visible == 'Y' ? "selected='selected'" : "" }>Y</option>
        <option value='N' ${blog_Categrp_VO.blog_visible == 'N' ? "selected='selected'" : "" }>N</option>
      </select>
       
      <button type="submit" id='submit'>수정</button>
      <button type="button" onclick="location.href='./list.do'">수정 취소</button>
    </FORM>
  </DIV>
  
  <table class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
    </colgroup>
    
    <thead>
      <tr>
        <th class='th_bs'>순서</th>
        <th class='th_bs'><a href='./read_update.do?blog_categrpno='${blog_Categrp_VO.blog_categrpno }>대분류명</a></th>
        <th class='th_bs'>등록일</th>
        <th class='th_bs'>출력</th>
        <th class='th_bs'>기타</th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach var="blog_Categrp_VO" items="${list }"> 
        <c:set var="blog_categrpno" value="${blog_Categrp_VO.blog_categrpno }"/>
        <c:set var="blog_seqno" value="${blog_Categrp_VO.blog_seqno }"/>
        <c:set var="blog_name" value="${blog_Categrp_VO.blog_name }"/>
        <c:set var="blog_rdate" value="${blog_Categrp_VO.blog_rdate}"/>
        <c:set var="blog_visible" value="${blog_Categrp_VO.blog_visible}"/>
     
        <tr>
          <td class="td_bs">${blog_seqno }</td>
          <td class="td_bs_left"><a href='./read_update.do?blog_categrpno=${blog_categrpno}'>${blog_name}</a></td>
          <td class="td_bs">${blog_rdate.substring(0,10)}</td>
          <td class="td_bs">
            <c:choose>
             <c:when test="${blog_visible == 'Y' }">
              <a href='./update_visible.do?blog_categrpno=${blog_categrpno}&blog_visible=${blog_visible }'>
              <img src='./images/yes.png' style='width: 20%;'></a>
             </c:when>
            <c:otherwise>
              <a href='./update_visible.do?blog_categrpno=${blog_categrpno}&blog_visible=${blog_visible }'>
              <img src='./images/no.png' style='width: 20%;'></a>
            </c:otherwise>
           </c:choose>
          </td>
          <td class="td_bs"><a href='./read_update.do?blog_categrpno=${blog_categrpno}'><span class="glyphicon glyphicon-pencil"></span></a> /
                                    <a href='./read_delete.do?blog_categrpno=${blog_categrpno}'><span class="glyphicon glyphicon-trash"></span></a> /
                                    <a href='./update_seqno_up.do?blog_categrpno=${blog_categrpno}'><span class="glyphicon glyphicon-arrow-up"></span></a> / 
                                    <a href='./update_seqno_down.do?blog_categrpno=${blog_categrpno}'><span class="glyphicon glyphicon-arrow-down"></span></a>
          </td>
         </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class='bottom_menu'>${paging }
  <br><br>
  </div>
 <jsp:include page="/menu/bottom.jsp"/>
</body>
</html>