<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!--=============== 작성부분 ===============-->

	<div class="ui tiny modal" id="pev_UpModal">
		<div class="ui container">
			<form id="form_ev" class="ui form" style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
				<h4 class="ui dividing header">인사평가수정</h4>
				<div class="two fields">
					<div class="field">
						<label>평가대상이름</label>
						<div class="field">
							<div class="ui disabled input">
								<input id="e_name" onfocus="this.blur()" placeholder="평가사원이름">
							</div>
						</div>
					</div>
					<div class="field">
						<label>평가점수</label>
						<div class="field">
							<div class="ui massive heart rating"  data-max-rating="5" style="margin-top: 6px; margin-left: 30px"></div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>인사평가작성</label>
					<textarea id="ev_content" style="resize: none; height: 80%" name="ev_content"></textarea>
				</div>
				<input type="hidden" id="ev_eno" name="ev_eno" />
				<input type="hidden" id="tg_eno" name="tg_eno" />
				<input type="hidden" id="ev_score" name="ev_score" />
				<div class="field" align="center">
					<div class="ui button" onclick="pev_bpermit()">저장</div>
					<div class="ui button" onclick="pev_bcancel()">취소</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">

      			/* var rate_score = 0;
      			$('.icon.active').each(function(index, element){
      				rate_score += 1;
                    return;//먼저 선택된 결재상태의 문자값만 담고 반복each문 탈출
                 }); */
		function setRating(score){
	 		if(score == 0)
	 			$('.rating').rating({ initialRating: 0, maxRating: 5 });
      		else if(score == 2)
	 			$('.rating').rating({ initialRating: 1, maxRating: 5 });
      		else if(score == 4)
	 			$('.rating').rating({ initialRating: 2, maxRating: 5 });
      		else if(score == 6)
	 			$('.rating').rating({ initialRating: 3, maxRating: 5 });
      		else if(score == 8)
	 			$('.rating').rating({ initialRating: 4, maxRating: 5 });
      		else if(score == 10)
	 			$('.rating').rating({ initialRating: 5, maxRating: 5 });
        };
		
        //저장하기
        function pev_bpermit(){
    		var new_score = $('.rating').rating('get rating')*2;
        	alert(new_score);
        	$("#ev_score").val(new_score);
    		$("#form_ev").attr("method","post");
    		$("#form_ev").attr("action","/E_BLOCK_plus/emp/pev/upd");
    		$("#form_ev").submit();
    	}
        
        //창닫기
		function pev_bcancel() {
			$('.ui.modal').modal('hide');
		};
	</script>

	<!--=============== 작성부분 ===============-->