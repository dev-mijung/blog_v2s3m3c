<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>JJUNG'S BLOG</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<div class='title_line'>카테고리 등록</div>

<form name='frm' method='POST' action='./create.do' class="form-horizontal">
  <input type="hidden" name="blog_categrpno"  value="1">
  
  <div class="form-group">
    <label class="control-label col-md-3">카테고리 이름</label>
    <div class="col-md-9">
      <input type="text" name="cate_name" value="" required="required" autofocus="autofocus"
                class="form-control" style="width: 50%;">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-md-3">출력 순서</label>
    <div class="col-md-9">
      <input type="number" name="cate_seqno" value="" required="required" placeholder="${cate_seqno }"
                min="1" max="1000" step="1"  class="form-control"  style="width: 30%;">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-md-3">출력 형식</label>
    <div class="col-md-9">
      <select name="cate_visible" class="form-control" style="width: 20%;">
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
    </div>
  </div>
  
  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button style="submit" class="btn">등록</button>
    <button style="button" onclick="location.hreef='./list.do'" class="btn">목록</button>
  </div>
</form>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>