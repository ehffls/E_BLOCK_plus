<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script src="/E_BLOCK_plus/0_src/js/table/bootstrap-table.js"></script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<div class="ui container">
<table id="taable" class="ui celled table">
      <thead>
        <tr><th>Bang</th>
        <th>Song</th>
        <th>aaa</th>
      </tr></thead>
      <tbody>

      </tbody>
      <tfoot>
        <tr><th colspan="3">
          <div class="ui right floated pagination menu">
            <a class="icon item">
              <i class="left chevron icon"></i>
            </a>
            <a class="item">1</a>
            <a class="item">2</a>
            <a class="item">3</a>
            <a class="item">4</a>
            <a class="icon item">
              <i class="right chevron icon"></i>
            </a>
          </div>
        </th>
      </tr></tfoot>
    </table>
</div>

<script>

	$('#taable').bootstrapTable({
		
		columns: [
				{
	                field: 'state',
	                checkbox: true,
	                align: 'center',
	                valign: 'middle'
	            }, {
				
		        field: 'band',
		        title: 'Item ID'
			    }, {
			        field: 'song',
			        title: 'Item Name'
			    }
		    ]
            ,url:'./jsonTest.json'
         });
</script>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>