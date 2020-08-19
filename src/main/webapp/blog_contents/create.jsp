<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
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
  <aside style='float: left;'>
    <a href='../blog_categrp/list.do'>카테고리 그룹</a> >
    <a href='../blog_cate/list.do'>카테고리 </a> >
    신규등록
  </aside>
  <aside style='float: right;'>
    <a href='./list.do'>목록</a>
  </aside>
  
  <div class='menu_line'></div>
  <div style='width : 100%;'>
    <form name='frm' method='POST' action='./create.do'>
      <!-- FK member_no 지정-->
      <input type='hidden' name='member_no' id='member_no' value='1'>
      <!-- FK cate_no 지정-->
      <input type='hidden' name='cate_no' id='cate_no' value='${param.cate_no }'>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='text' class='form-control' name='contents_title' value='' placeholder='제목'
                    required='required' style='width: 80%;'>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <textarea class='form-control' name='contents_content' id='contents_content' rows='10'
                        placeholder='내용' style='width: 80%;'></textarea>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='text' class='form-control' name='contents_web' id='contents_web' value=''
                    placeholder='인터넷주소' style='width: 80%;'>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='text' class='form-control' name='contents_word' id='contents_word' value=''
                    placeholder='검색어' style='width: 80%;'>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='password' class='form-control' name='contents_passwd' id='contents_passwd' value='' 
                    placeholder='패스워드' style='width: 20%'> 
        </div>
      </div>
      
      <div class='content_bottom_menu'>
        <button type='submit' class='btn btn-info'>등록</button>
        <button type='button' class='btn btn-info' onclick="location.href='./list.do'">취소[목록]</button>
      </div>
    </form>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>