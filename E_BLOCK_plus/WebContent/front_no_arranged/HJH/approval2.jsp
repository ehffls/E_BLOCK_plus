<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#calendar').calendar({
        	type: 'date'
        });
		$('#rangestart').calendar({
			  type: 'date',
			  endCalendar: $('#rangeend')
			});
			$('#rangeend').calendar({
			  type: 'date',
			  startCalendar: $('#rangestart')
			});
	});
	function btn_1(){
		$.ajax({
			method:"get"
		   ,url:"approvalAjax.jsp"
		   ,success:function(result){
			   $("#divx").html(result);
			}
		   ,error:function(xhrObject){
				alert(xhrObject.responseText);
			}
		});
	}
	function ac_add(){
		$('#acc_add').modal('show')
	}
</script>



<!--=============== 작성부분 ===============-->
<div class="pusher">
<div class="ui container" style="margin-top:20px">
<div class="ui compact menu">
  <div class="ui simple dropdown item">
    결재종류
    <i class="dropdown icon"></i>
    <div class="menu">
      <div class="active item">근태관련</div>
      <div class="item">비품관련</div>
      <div class="item">사직관련</div>
    </div>
  </div>
</div>
</div>
<div class="ui container" style="margin-top:20px">
<form class="ui form">
  <h4 class="ui dividing header">근태관련 결재서</h4>
  <div class="two fields">
    <div class="field">
        <div class="ui labeled input">
      <a class="ui label">신청사원</a>
      <input type="text">
      </div>
      </div>
      <div class="field">
      <div class="ui labeled input">
      <a class="ui label">결재사원</a>
      <input type="text">
    </div>
    </div>
    </div>
  <div class="two fields">
  <div class="field">
    <label>신청일자</label>
          <div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='calendar'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
    </div>
    <div class="twofield">  
    </div>
    <div class="two fields">
      <div class="field">
        <label>시작일자</label>
        <div class="ui calendar" id="rangestart">
          <div class="ui input left icon">
            <i class="calendar icon"></i>
            <input type="text" placeholder="시작일자">
          </div>
        </div>
      </div>
      <div class="field">
        <label>종료일자</label>
        <div class="ui calendar" id="rangeend">
          <div class="ui input left icon">
            <i class="calendar icon"></i>
            <input type="text" placeholder="종료일자">
          </div>
        </div>
    </div>
  </div>
      <div class="field" style="height:300px">
      <label>결재사유</label>
        <textarea style="resize:none; height:80%"></textarea>
        </div>
        <div class="field">
  <div class="ui button" tabindex="0">저장</div>
  <div class="ui button" tabindex="0">취소</div>
  </div>
</form>

</div>
</div>
<div class="grey ui inverted vertical footer segment" style="margin-top:20px">
    <div class="ui container">
      <div class="ui stackable inverted divided equal height stackable grid">
        <div class="three wide column">
          <h4 class="ui inverted header">About</h4>
          <div class="ui inverted link list">
            <a href="#" class="item">Sitemap</a>
            <a href="#" class="item">Contact Us</a>
            <a href="#" class="item">Religious Ceremonies</a>
            <a href="#" class="item">Gazebo Plans</a>
          </div>
        </div>
        <div class="three wide column">
          <h4 class="ui inverted header">Services</h4>
          <div class="ui inverted link list">
            <a href="#" class="item">Banana Pre-Order</a>
            <a href="#" class="item">DNA FAQ</a>
            <a href="#" class="item">How To Access</a>
            <a href="#" class="item">Favorite X-Men</a>
          </div>
        </div>
        <div class="seven wide column">
          <h4 class="ui inverted header">Footer Header</h4>
          <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
        </div>
      </div>
    </div>
  </div>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>
