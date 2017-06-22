<%@ page contentType="text/html; charset=UTF-8"%>
<script>
$(function() {

<%-- 라디오 상태별 검색 --%>
	$('input[name=showState]').click(function(){
		var user_state_flag = $(this).val();
		var data = {'user_state_flag' : user_state_flag};
		console.log(data);
		$.ajax({
			url:'/admin/member/user/state',
			method: 'GET',
			data: data,
			success: function(responseData){
					var data = responseData.trim();
					var $parentObj=$("body");
		           	var data = responseData.trim();
		            $parentObj.empty();
		           	$parentObj.html(data);
			}
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
		
		var flag = confirm('일반 회원으로 변경하시겠습니까?');
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
	        	url:'/admin/member/user/normal/'+chkList,
	        	method:'put',
                data: data,
                success:function(responseData){
                	if(responseData.trim() =='1'){
                       alert("일반 회원으로 변경 성공");
                       location.href="/admin/member/user";
                    }else{
                       alert("변경 실패" + responseData);
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
 	var $btnBlack = $('button[name=btnBlack]');
	$btnBlack.click(function(){
		var flag = confirm('블랙 회원으로 변경하시겠습니까?');
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
	        	url:'/admin/member/user/black/'+chkList,
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("블랙 회원으로 변경 성공");
                       location.href="/admin/member/user";
                    }else{
                       alert("변경 실패" + responseData);
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
		
		var flag = confirm('탈퇴 회원으로 변경하시겠습니까?');
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
	        	url:'/admin/member/user/leave/'+chkList,
                 method:'put',
                 data: data,
                 success:function(responseData){
                     if(responseData.trim() =='1'){
                       alert("탈퇴 회원으로 변경 성공");
                       location.href="/admin/member/user";
                    }else{
                       alert("변경 실패" + responseData);
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
	    $('.searchBtn:first-child').html($(this).html() + '<span class="caret"></span>');
	    $('.searchBtn:first-child').val($(this).text() );
	 }); 
	
	<%-- 검색창 --%>
	var $btnSearch = $('button[name=btnSearch]');
	$btnSearch.click(function(){
		var to_dateObj = $('input[name=to_date]');
		var from_dateObj = $('input[name=from_date]');
		var to_date = new Date($('input[name=to_date]').val());
		var from_date = new Date($('input[name=from_date]').val());
		var searchCategory= $('.searchBtn:first-child').val();
		var searchItem= $('input[name=searchItem]').val();
		
		<%-- 기간 검색 --%>
		 if ( ( ("" != (searchCategory) ) && ("" != (searchItem) ) ) && ( ( typeof(to_date) != Date ) || ( typeof(from_date) != Date  ) ) ){
			var data={'searchCategory': searchCategory, 'searchItem': searchItem};
			console.log("검색어" + searchCategory + "아이디" + searchItem );
			$.ajax({
				url:'/admin/member/user/searchItem',
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
	        	url:'/admin/member/user/searchDate',
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