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
    
<script type="text/javascript">
 
  
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
  
  <div class='title_line'>
    <a href='../blog_categrp/list.do'>카테고리 그룹</a> >
    <a href='../blog_cate/list_join_by_categrpno.do'>${blog_Categrp_VO.blog_name }</a>
  </div>
  
  <div id='panel_create' style='padding: 10px 0px 10px 0px; background-color: F9F9F9; width: 100%; text-align: center;'>
    <form name='frm_create' id='frm_create' method='POST' action='./create.do'>
     <input type='hidden' name='blog_categrpno' value='${param.blog_categrpno }'> 
      
      <label>그룹 번호</label>
      <input type='number' name='blog_categrpno' required='required'
                min='1' max='99999' step='1' style='width: 5%;'>
                
      <label>카테고리</label>
      <input type='text' name='cate_name' required='required'
                style='width: 25%;'>
                
      <label>순서</label>
      <input type='number' name='cate_seqno' value='${blog_Cate_VO.cate_seqno }'  required='required'
                min='1' max='1000' step='1' style='width: 5%;'>
                
      <label>형식</label>
      <select name='cate_visible'>
        <option value='Y' selected='selected'>Y</option>
        <option value='N' >N</option>
      </select>
                
      <button type="submit" id="submit">등록</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
      
      <table class='table table-striped'>
        <colgroup>
          <col style='width: 10%;'/>
          <col style='width: 10%;'/>
          <col style='width: 20%;'/>
          <col style='width: 20%;'/>
          <col style='width: 10%;'/>
          <col style='width: 5%;'/>
          <col style='width: 20%;'/>
        </colgroup>
        
        <thead>
        <tr>
          <th class='th_bs'>그룹</th>
          <th class='th_bs'>순서</th>
          <th class='th_bs'>카테고리</th>
          <th class='th_bs'>등록일</th>
          <th class='th_bs'>출력</th>
          <th class='th_bs'>글수</th>
          <th class='th_bs'>기타</th>
        </tr>
        </thead>
        
        <tbody>
          <c:forEach var="list_join" items="${list }">
		        <c:set var="cate_no" value="${list_join.cate_no }"/>
		        <c:set var="blog_name" value="${list_join.r_blog_name }"/>
		        <c:set var="cate_seqno" value="${list_join.cate_seqno }"/>
		        <c:set var="cate_name" value="${list_join.cate_name }"/>
		        <c:set var="cate_rdate" value="${list_join.cate_rdate }"/>
		        <c:set var="cate_visible" value="${list_join.cate_visible }"/>
		        <c:set var="cate_cnt" value="${list_join.cate_cnt }"/>
      
	      <tr>
	        <td class="td_bs">${blog_name }</td>
	        <td class="td_bs">${cate_seqno }</td>
	        <td class="td_bs"><a href='../blog_contents/list_by_cate.do?cate_no=${cate_no}'>${cate_name }</a></td>
	        <td class="td_bs">${cate_rdate.substring(0,10) }</td>
	        <td class="td_bs">
	          <c:choose>
	            <c:when test = '${cate_visible == "Y" }'>
	              <a href='./update_visible.do?cate_no=${cate_no }&cate_visible=${cate_visible}'>
	              <img src='./images/yes.png' style='width: 20%;'></a>
	            </c:when>
	            <c:otherwise>
	              <a href='./update_visible.do?cate_no=${cate_no }&cate_visible=${cate_visible}'>
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
    </form>
  </div>
  <jsp:include page="/menu/bottom.jsp" />
</body>
</html>