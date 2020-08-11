<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }"/>

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
  /* $(function(){ // 자동실행
    $('#btn_send').on('click',send);
    $('#btn_list').on('click',list);
  })
  
  function list(){
    location.href='${root}/blog_categrp/list.do'
  }
  
  function send(){
    var frm = $('#frm');
    var params = frm.serialize();
    
    if($('#blog_name',frm).val()==''){
      alert('그룹 이름을 입력 해주세요.')
      $('#blog_name',frm).focus();
      return;
    }
    
    $.ajax({
      url: './create.do',
      type: 'post',
      cache: false,
      async: true, // 비동기 통신
      dataType: 'json',
      data: params,
      success: function(rdata){ //응답이 온 경우
        var msg = "";
        if(rdata.cnt > 0){
          msg = "등록에 성공 했습니다^^ "
         
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('등록성공'); // 제목 : modal_title 요소내용을 ID 중복 확인으로 바꿈
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal(); 
        } else {
        msg = "등록에 실패 했습니다ㅠㅠ"
        msg += "다시 등록 해주세요"
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
        $('#modal_title').html('등록실패'); // 제목 : modal_title 요소내용을 ID 중복 확인으로 바꿈
        $('#modal_content').html(msg);        // 내용
        $('#modal_panel').modal(); 
      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
    error: function(request, status, error) { // callback 함수, ajax가 호출하는 함수, ajax엔진이 호출 함
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>'; // 상태값.
          msg += '<strong>error</strong><br>'+error + '<hr>'; // 에러메세지 
          console.log(msg);
        } //브라우저 콘솔에 찍힘
      });
    } */
</script>
</head>
<body>
<!-- Modal 알림창 시작, 알림창 필요시 계속 사용할 수 있음-->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 핵심)제목 두가지 위치를 잘 알고 있어야 함-->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 핵심)내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='btn_list' class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  
  
 <jsp:include page="/menu/top.jsp" flush='false'/>
   
   <div class='title_line'>블로그 그룹 등록</div>
   <form name='frm' id='frm' method='POST' action='./create.do' class='form-horiziontal'>
    <div class="form-group">
      <label class="control-label col-md-3">그룹 이름</label>
      <div class='col-md-9'>
      <input type='text' name='blog_name' id='blog_name' value='' required="required"
                autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
     </div>
     
     <div class="form-group">
      <label class="control-label col-md-3">출력 순서</label>
      <div class="col-md-9">
        <input type='number' name='blog_seqno'  id='blog_seqno' value='1' required="required"
                  placeholder="${seqno }" min="1" max="1000" step="1"
                  style='width: 30%;' class="form-control">
      </div>
     </div>
     
     <div class="form-group">
      <label class="control-label col-md-3">출력 형식</label>
      <div class="col-md-9">
        <select name='blog_visible' class='form-control' style='width: 20%;'>
          <option value='Y' selected='selected'>Y</option>
          <option value='N'>N</option>
        </select>
      </div>
     </div>
     
     <div class="content_bottom_menu" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do" class="btn">목록</button>
     </div>
   </form>
   <jsp:include page="/menu/bottom.jsp" flush='false'/>
  </body>
</html>