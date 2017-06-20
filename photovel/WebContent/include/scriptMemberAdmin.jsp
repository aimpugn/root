<%@ page contentType="text/html; charset=UTF-8"%>

<script>
$(function() {
<%-- 라디오 상태별 검색 --%>
	$('input[name=showStatus]').click(function(){
		var admin_state_flag = $(this).val();
		var data = {'admin_state_flag' : admin_state_flag};
		$.ajax({
			url:'/admin/adminState',
			method: 'GET',
			data: data,
			success: function(responseData){
				var data = responseData.trim();
				var $parentObj=$("body");
	           	var data = responseData.trim();
	            $parentObj.empty();
	           	$parentObj.html(data);
			}
			//error: function(xhr, status, error){
			//	alert("조회가 되지 않았습니다. 관리자에게 문의");
			//}
		});
	});
		
<%-- 체크박스 --%>
	function allCheckFunc( obj ) {
		//낱개 체크박스의 프라퍼티가 체크드이면 obj에 체크드 속성을 표시한다. 
		$("input[name=chk]").prop("checked", $(obj).prop("checked") );
	}
	
	/* 체크박스 체크시 전체선택 체크 여부 */
	function chkboxFunc(obj){
		var allObj = $("input[name=chkAll]"); //전체선택 체크박스 
		var objName = $(obj).attr("name"); // obj네임은 체크드 된 낱개 체크박스의 이름을 갖는다.
	
		if( $(obj).prop("checked") ){//낱개 체크박스 체크드이면
			checkBoxLength = $("input[name="+ objName +"]").length;//낱개 박스의 갯수를 구한다.
			checkedLength = $("input[name="+ objName +"]:checked").length;//체크된 낱개 박스의 갯수를 구한다.
	
			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}else{
			allObj.prop("checked", false);
		}
	}
	
	//전체체크박스클릭시 
	$(function(){
		$("input[name=chkAll]").click(function(){
			allCheckFunc( this );
		});
		$("input[name=chk]").each(function(){
			$(this).click(function(){
				chkboxFunc( $(this) );
			});
		});
	});
	
<%-- 체크박스 : 사용 상태로 변경  --%>
 	var $btnNormal = $('button[name=btnNormal]');
	$btnNormal.click(function(){
		
		var flag = confirm('사용으로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');
  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		
			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminNormal',
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("사용 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("사용 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });	
		
<%-- 체크박스 : 중지 상태로 변경 --%>
 	var $btnStop = $('button[name=btnStop]');
	$btnStop.click(function(){
		var flag = confirm('중지로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');
  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		
			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminStop',
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("중지 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("중지 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });
	
	
<%-- 체크박스 : 탈퇴 상태로 변경 --%>
 	var $btnLeave = $('button[name=btnLeave]');
	$btnLeave.click(function(){
		
		var flag = confirm('탈퇴로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');
  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		
			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminLeave',
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("탈퇴 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("탈퇴 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
     });
<%-- 검색창 --%>

	$('.dropdown-menu').on('click', 'li a', function(){
	    $('.searchBtn:first-child').html($(this).html() + ' <span class="caret"></span>');
	    $('.searchBtn:first-child').val($(this).text() );
	 }); 
	
	
	var $btnSearch = $('button[name=btnSearch]');
	$btnSearch.click(function(){
		var to_dateObj = $('input[name=to_date]');
		var from_dateObj = $('input[name=from_date]');
		var to_date = new Date($('input[name=to_date]').val());
		var from_date = new Date($('input[name=from_date]').val());
		var searchCategory= $('.searchBtn:first-child').val();
		var searchItem= $('input[name=searchItem]').val();
		
		console.log("인밸리드데이트 값" + to_date);
		//var $searchValue = $('input[name=searchValue]').val();
		//var $searchItem= $('#searchItem option:selected').val();
		
		<%-- 기간 검색 --%>
		 if ( ( ("" != (searchCategory) ) && ("" != (searchItem) ) ) && ( ( typeof(to_date) != Date ) || ( typeof(from_date) != Date  ) ) ){
			var data={'searchCategory': searchCategory, 'searchItem': searchItem};
			console.log("검색어" + searchCategory + "아이디" + searchItem );
			$.ajax({
				url:'/admin/adminSearchItem',
				method: 'get',
				data: data,
				success:function(responseData){
					var data = responseData.trim();
    				var $parentObj=$("body");
    	           	var data = responseData.trim();
    	            $parentObj.empty();
    	           	$parentObj.html(data);
				}
			});
		return false;
		} else if( ("" != (from_date)) && ("" != (to_date)) ){
			var data = {'from_date': from_date, 'to_date' : to_date};
			console.log(data);
	        $.ajax({
	        	url:'/admin/adminSearchDate',
	             method:'get',
	             data: data,
	           	 success: function(responseData){
	    				var data = responseData.trim();
	    				var $parentObj=$("body");
	    	           	var data = responseData.trim();
	    	            $parentObj.empty();
	    	           	$parentObj.html(data);
	             },
		        error: function(xhr, status, error){
					return false;
				}
	       	});
	       	return false;	
		}
	});
});
	
</script>


<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<script>
$(function() {

라디오 상태별 검색
	$('input[name=showState]').click(function(){
		var admin_state_flag = $(this).val();
		var data = {'admin_state_flag' : admin_state_flag};
		$.ajax({
			url:'/admin/adminState',
			method: 'GET',
			data: data,
			success: function(responseData){
				var data = responseData.trim();
				var $parentObj=$("body");
	           	var data = responseData.trim();
	            $parentObj.empty();
	           	$parentObj.html(data);
			}
			//error: function(xhr, status, error){
			//	alert("조회가 되지 않았습니다. 관리자에게 문의");
			//}
		});
	});
		
체크박스
	function allCheckFunc( obj ) {
		//낱개 체크박스의 프라퍼티가 체크드이면 obj에 체크드 속성을 표시한다. 
		$("input[name=chk]").prop("checked", $(obj).prop("checked") );
	}
	
	/* 체크박스 체크시 전체선택 체크 여부 */
	function chkboxFunc(obj){
		var allObj = $("input[name=chkAll]"); //전체선택 체크박스 
		var objName = $(obj).attr("name"); // obj네임은 체크드 된 낱개 체크박스의 이름을 갖는다.
	
		if( $(obj).prop("checked") ){//낱개 체크박스 체크드이면
			checkBoxLength = $("input[name="+ objName +"]").length;//낱개 박스의 갯수를 구한다.
			checkedLength = $("input[name="+ objName +"]:checked").length;//체크된 낱개 박스의 갯수를 구한다.
	
			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}else{
			allObj.prop("checked", false);
		}
	}
	
	//전체체크박스클릭시 
	$(function(){
		$("input[name=chkAll]").click(function(){
			allCheckFunc( this );
		});
		$("input[name=chk]").each(function(){
			$(this).click(function(){
				chkboxFunc( $(this) );
			});
		});
	});
	
체크박스 : 사용 상태로 변경 
 	var $btnNormal = $('button[name=btnNormal]');
	$btnNormal.click(function(){
		
		var flag = confirm('사용으로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');

  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		

			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminNormal',
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("사용 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("사용 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });	
		
체크박스 : 중지 상태로 변경
 	var $btnStop = $('button[name=btnStop]');
	$btnStop.click(function(){
		var flag = confirm('중지로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');

  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		

			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminStop',
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("중지 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("중지 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
		
     });
	
	
체크박스 : 탈퇴 상태로 변경
 	var $btnLeave = $('button[name=btnLeave]');
	$btnLeave.click(function(){
		
		var flag = confirm('탈퇴로 변경하시겠습니까?');
        if(flag==true){
			var chkList = new Array();
			var cnt = 0;
			var checkbox = $('input[name=chk]:checked');

  			chkList = $(checkbox).map(function(i){
					return $(this).val();
			}).get();		

			var data = {'chkList': chkList};
			
			jQuery.ajaxSettings.traditional = true;
			
	        $.ajax({
	        	url:'/admin/adminLeave',
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("탈퇴 성공");
                       location.href="/admin/member/admin";
                    }else{
                       alert("탈퇴 실패" + responseData);
                    } 
                 },
		        error: function(xhr, status, error){
					return false;
				}
           	});
           	return false;	
		};
     });

검색창
	$('.dropdown-menu').on('click', 'li a', function(){
	    $('.searchBtn:first-child').html($(this).html() + ' <span class="caret"></span>');
	    $('.searchBtn:first-child').val($(this).text() );
	 }); 
	
	검색창
	var $btnSearch = $('button[name=btnSearch]');
	$btnSearch.click(function(){
		var to_dateObj = $('input[name=to_date]');
		var from_dateObj = $('input[name=from_date]');
		var to_date = new Date($('input[name=to_date]').val());
		var from_date = new Date($('input[name=from_date]').val());
		var searchCategory= $('.searchBtn:first-child').val();
		var searchItem= $('input[name=searchItem]').val();
		
		console.log("인밸리드데이트 값" + to_date);
		//var $searchValue = $('input[name=searchValue]').val();
		//var $searchItem= $('#searchItem option:selected').val();
		
		기간 검색
		 if ( ( ("" != (searchCategory) ) && ("" != (searchItem) ) ) && ( ( typeof(to_date) != Date ) || ( typeof(from_date) != Date  ) ) ){
			var data={'searchCategory': searchCategory, 'searchItem': searchItem};
			console.log("검색어" + searchCategory + "아이디" + searchItem );
			$.ajax({
				url:'/admin/adminSearchItem',
				method: 'get',
				data: data,
				success:function(responseData){
					var data = responseData.trim();
    				var $parentObj=$("body");
    	           	var data = responseData.trim();
    	            $parentObj.empty();
    	           	$parentObj.html(data);
				}
			});
		return false;
		} else if( ("" != (from_date)) && ("" != (to_date)) ){
			var data = {'from_date': from_date, 'to_date' : to_date};
			console.log(data);
	        $.ajax({
	        	url:'/admin/adminSearchDate',
	             method:'get',
	             data: data,
	           	 success: function(responseData){
	    				var data = responseData.trim();
	    				var $parentObj=$("body");
	    	           	var data = responseData.trim();
	    	            $parentObj.empty();
	    	           	$parentObj.html(data);
	             },
		        error: function(xhr, status, error){
					return false;
				}
	       	});
	       	return false;	
		}
	});
});
</script>	 --%>