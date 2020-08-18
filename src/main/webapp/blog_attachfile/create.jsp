<%@ page contentType="text/html; charset=UTF-8" %>
 
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
  
  <aside style='float: left;'>
    신규 등록
  </aside>
  <aside style='float: right'>
    <a href='./list_all.do?cate_no='${param.cate_no }'>목록</a>
  </aside>
  
  <div class='menu_line'></div>
  <div style='width: 100%;'>
    <form name='frm' method='POST'  action='./create.co' enctype='multipart/form-data' 
              class='form-horizontal'> 
      <input type='hidden' name='cate_no' id='cate_no' value='1'>
      <input type='hidden' name='contents_no' id='contents_no' value='1'>
      
      <div class='form-group'>
        <div class='col-md-12'>
          <input type='file' class='form-control' name='fnamesMF' value='' placeholder='파일선택'
                    multiple='multiple'>
        </div>
      </div>
      
      <div class='content_bottom_menu'>
        <button type='submit' class='btn btn-info'>파일 전송</button>
        <button type='button' onclick='location.href="./list_all.do?cate_no=${param.cate_no}"'
                    class='btn btn-info'>취소[목록]</button>
      </div>
    </form>
  </div>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>