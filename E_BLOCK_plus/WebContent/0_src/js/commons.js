/***********************************************************************************
 * [[윈도우 팝업창 처리 구현]]
 * 	@param1		화면에 띄울 페이지의 URL
 * 	@param2		팝업창의 가로길이
 * 	@param3		팝업창의 세로길이
 * 	@param4		팝업창의 이름
 ***********************************************************************************/
function cmm_window_popup(url,popupWidth,popupHeight,popupName)
{
	//예상상황 : 해상도(1600*1024)라면, 팝업창크기(700,450)
	Top = (window.screen.height-popupHeight/3);	//(1024-450)/3 = 191px
	Left = (window.screen.width-popupWidth/2);	//(1600-700)/2 = 300px
	if(Top<0) Top = 0;//0보다 작아서 화면을 벗어나면 0으로 초기화
	if(Left<0) Left = 0;//0보다 작아서 화면을 벗어나면 0으로 초기화
	options = "location=no, fullcreen=no, status=yes";
	options += ", left="+Left+", top="+Top;
	options += ", width="+popupWidth+",height="+popupHeight;
	popupName = window.open(url,popupName,options);
	popupName.focus();
	
}