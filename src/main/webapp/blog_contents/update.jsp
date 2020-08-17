<%@ page contentType="text/html; charset=UTF-8" %>

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
  <div class ='title_line'>
    컨텐츠 수정
  </div>
  
  <aside style='float: left;'>
    <a href='../blog_categrp/list.do'>카테고리 그룹</a> >
    <a href='../blog_cate/list.do'>카테고리</a> > 컨텐츠 수정
  </aside>
  
  <aside style='float: right;'>
    <a href='./list.do'>목록</a>
  </aside>
  
  <div class='menu_line'>
    <div style='width: 100%;'>
      <form name='frm' method='POST' action='./update.do' class='form-horizontal'>
        <input type='hidden' name='member_no' id='member_no' value='1'>
        <input type='hidden' name='cate_no' id='cate_no' value='${param.cate_no }'>
        <input type='hidden' name='contents_no' id='contents_no' value='${param.contents_no }'>
        
        <div class='form-group'>
        <div class='col-md-12'>
          <input type='text' class='form-control' name='contents_title' value='${blog_Contents_VO.contents_title }'
                    required='required' style='width: 80%;'>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <textarea class='form-control' name='contents_content' id='contents_content' rows='10'
                        style='width: 80%;'>${blog_Contents_VO.contents_content }</textarea>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='text' class='form-control' name='contents_web' id='contents_web' 
                    value='${blog_Contents_VO.contents_web }' placeholder='인터넷주소' style='width: 80%;'>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='text' class='form-control' name='contents_word' id='contents_word' 
                    value='${blog_Contents_VO.contents_content }' style='width: 80%;'>
        </div>
      </div>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='password' class='form-control' name='contents_passwd' id='contents_passwd' value='' 
                    placeholder='패스워드' style='width: 20%'> 
        </div>
      </div>
      
      <div class='content_bottom_menu'>
        <button type='submit' class='btn btn-info'>수정</button>
        <button type='button' class='btn btn-info' onclick="location.href='./list.do'">취소[목록]</button>
      </div>
    </form>
    </div>
    </div>
</body>
</html>