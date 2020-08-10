<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- font awasome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    
    <!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery.cookie.js"></script>

    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

    <style>
        body{
            font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }
        input:read-only{
        	background-color: #c3dbff !important;
        	border: none !important;
        }

        #nav{
            margin-bottom: 50px;
        }
        #nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            position: -webkit-sticky; /* Safari */
            position:fixed;
            width: 100%;
            height: 50px;
            z-index: 100;
            top: 0;
        }
        #nav li {
            float: left;
        }
        #nav li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        #nav ul li a:hover{
            color: rgb(169, 204, 255);
        }

        #searcher{
            width: 25%;
            height: 60%;
            margin: 7px;
            margin-left: 40px;
        }
        #searcherBtn{
            height: 60%;
            margin-top: 7px;
            background-color: rgb(82, 142, 253);
            border: none;
            color: white;
        }
        #userManage{
            float: right;
            margin-right: 30px;
            margin-top: 12px;
            color: rgb(185, 185, 185);
        }
        #userManage i{
            height: 100%;
            font-size: 24px;
        }
        #userManage1_1{
            font-size: 20px;
        }
        #userManage1_2{
            font-size: 15px;
            margin-right: 20px;
        }
        .fa-door-open:hover{
            transform: scale(1.3);
            color: white;
        }



        .wrap{
            padding-left: 8%;
            padding-right: 8%;
            padding-bottom: 3%;
        }
        .btn{
            border: none;
            border-radius: 7px;
            background-color: rgb(82, 142, 253);
            color: white;
            font-size: 14px;
            width: 90px;
            height: 30px;
        }
        .btn:hover{
            background-color: rgb(23, 104, 255);
        }
        #toListBtn{
            
        }
        #writeBtn{
            float: right;
        }

        th{
            float: right;
        }

        #txtBoardTitle{
            background-color: white;
            border: none;
            font-size: 15px;
            font-weight: 700;
            color: rgb(82, 82, 82);
        }
        
        #writeForm form table tr td, th{
            padding-top: 5px !important;
        }
        
        #readFrm{
            background-color: #c3dbff;
            padding: 5px;
            padding-bottom: 0px;
            border: none;
            border-radius: 15px;
        }

    </style>


    <script>
        $(document).ready(function(){
        	$('#toListBtn').click(function(){
        		if(checkDel()){
                	var id = document.getElementById("getBoardID").value;
                	location.href = "list.do?id="+id;
                }
            });
        	
        	// nav로그아웃 버튼
            $('#logoutIcon').click(function(){
            	var logoutCheck = confirm("로그아웃 하시겠습니까?");
    			if(logoutCheck == true){
                	var currentUrl = window.location.href;
                	$.cookie('url', currentUrl);
                	location.href = "sessionLogout.do";
    			}
            })
        	
        	<% 
       			String loginID = (String)session.getAttribute("loginUser");
        		String loginPW = (String)session.getAttribute("loginUserPW");
    	 	%>

        });

        function writeCheck(){
            if(document.frm.title.value.length == 0){
                alert("제목을 작성해주세요");
                frm.title.focus();
                return false;
            }
            if(document.frm.id.value.length == 0){
                alert("ID를 작성해주세요");
                frm.id.focus();
                return false;
            }
            if(document.frm.password.value.length == 0){
                alert("비밀번호를 작성해주세요");
                frm.password.focus();
                return false;
            }
            if(document.frm.content.value.length == 0){
                alert("게시글 내용을 작성해주세요");
                frm.content.focus();
                return false;
            }

            //금칙어 체크
            if(bad_word_check()){ 
                return true; 
            }
            else{ 
                return false; 
            }
            
         // 검색어 쿠키가져오기
		     function getListCookie(cName) {
		          cName = cName + '=';
		          var cookieData = document.cookie;
		          var start = cookieData.indexOf(cName);
		          var cValue = '';
		          if(start != -1){
		               start += cName.length;
		               var end = cookieData.indexOf(';', start);
		               if(end == -1)end = cookieData.length;
		               cValue = cookieData.substring(start, end);
		          }

		          var getCookieStr = unescape(cValue);
		           
		          // hidden태그에 결과 넣어놓기
				  $("#searchLists").val(getCookieStr);
		     }
		     getListCookie("boardList");
		     
		     
		     
		     
		     
		     
		     // 검색어 쿠키 통해서 검색어 제공
		     var temp = document.getElementById('searchLists').value;
			    
			 // 배열 형태로 전달
			 var availableBoard = temp.split(',');
			    
			 $("#searcher").autocomplete({
			        //source: availableBoard,
			        source: function(request, response) {
				        var results = $.ui.autocomplete.filter(availableBoard, request.term);
				        response(results.slice(0, 10));
				    },
			        
			        select: function(event, ui) {
			            console.log(ui.item);
			        },

			        focus: function(event, ui) {
			            return false;
			            //event.preventDefault();
			        }
			    });
        }

        function checkDel(){
            var a = confirm("작성중인 내용은 복구가 불가능합니다.\n정말 돌아가시겠습니까?");
            if(a==true){
                return true;
            }
            else{
                return false;
            }
        }

        // 금칙어 체크
        function bad_word_check() {
            var word = document.getElementById("txtDesc").value + document.getElementById("txtTitle").value;
            var swear_words_arr = new Array("도박", "토토", "출금", "입금", "계좌", "팝니다", "삽니다", "거래");

            orgword = word.toLowerCase();
            awdrgy = 0;

            while (awdrgy <= swear_words_arr.length - 1) {
                if (orgword.indexOf(swear_words_arr[awdrgy]) > -1) {
                    alert(swear_words_arr[awdrgy] + "은(는) 금지어입니다. 등록 할 수 없습니다.");
                    return;
                }
                awdrgy++;
            }
            return true;
        }

        function searchCheck(){
			searchStr = document.getElementById('searcher').value;
			
			if(searchStr == ""){
				alert("검색어를 확인해주세요");
				return false;	
			}
			else{
				location.href = 'search.do?query='+searchStr;
				return false;	
			}
		}
        
    </script>
</head>
<body>
	
	
	<c:set var='str' value='<%=loginID %>'/>
	<c:set var='strPass' value='<%=loginPW %>'/>
	 
    <!-- 네비게이션 ----------------------------------------->
    <div id="nav">
        <ul>
            <li><a class="active" href="main.do">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <span id="navSearchZon">
                <input type="text" id="searcher"/>
            	<input type="button" id="searcherBtn" value="검색" onclick="return searchCheck();"/>
            </span>
            <input type="hidden" id="searchLists">
            
            <c:if test="${str==null}">
            
            </c:if>
			<c:if test="${str!=null}">
				<span id="userManage">
	                <i class="fas fa-user-circle"></i>
	                <span id="userManage1_1"><c:out value="${str}"/></span>
	                <span id="userManage1_2">님 </span>
	                <i id="logoutIcon" class="fas fa-door-open"></i>
            	</span>
			</c:if>
        </ul>
    </div>
	<!-- 네비게이션 끝 -->
    
    <!-- 게시글 작성 -------------------------------------->
    <div class="wrap">
        <br>
        <h1>게시글 작성</h1>
        <input id="getBoardTitle" type="hidden" value=${param.title}>
        <input id="getBoardID" type="hidden" value=${param.id}>
        <div id="readFrm">
        	<div id="writeForm">
	            <form method="POST" name="frm" >
	                <table>
	                    <tr>
	                        <th>게시판</th>
	                        <td><input id="txtBoardTitle" type="text" name="boardTitle2" size="20" value="${param.title} 게시판" readonly></td>
	                        <input type="hidden" name="boardTitle" value=${param.title}>
	                    </tr>
	                    <tr>
	                        <th>제목</th>
	                        <td><input id="txtTitle" type="text" name="writeTitle" size="30"></td>
	                    </tr>
	                    <tr>
	                        <th>아이디</th>
	                        <c:if test="${str==null}">
	                        	<td><input id="txtId" type="text" name="writerId" size="20"></td>
	                        </c:if>
	                        <c:if test="${str!=null}">
	                        	<td><input id="txtId" type="text" name="writerId" size="20" value="<c:out value="${str}"/>" readonly></td>
	                        </c:if>
	                    </tr>
	                    <tr>
	                        <th>비밀번호</th>
	                        
	                        <c:if test="${strPass==null}">
	                        	<td><input id="txtPassword" type="password" name="password" size="20"></td>
	                        </c:if>
	                        <c:if test="${strPass!=null}">
	                        	<td><input id="txtPassword" type="password" name="password" size="20" value="<c:out value="${strPass}"/>" readonly></td>
	                        </c:if>
	                    </tr>
	                    <tr>
	                        <th>내  용</th>
	                        <td><textarea id="txtContent" cols="70" rows="10" name="content"></textarea></td>
	                    </tr>
	                </table>
	                <hr/>
	                <input type="submit" id="writeBtn" class="btn" value="저장하기" onclick="return writeCheck();">
	            </form>
	        </div>
        </div>
        
        
            <input type="button" id="toListBtn" class="btn" value="목록으로">
        
        <!-- 게시글 작성 -->
</body>
</html>