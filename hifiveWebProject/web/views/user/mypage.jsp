<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "user.model.vo.User, hsp.model.vo.*, java.util.*" %>
<%            
      String[] hchecked = new String[12];               
        String[] ochecked = new String[4];
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8"> 
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>mypage</title>
   <link rel="stylesheet" href="/hifive/resources/css/modal.css">
   <link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
   <script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
   <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <style type="text/css">

 .container{
   margin: 0 auto;
   padding: 10px;
   }

#main {
   width: 1000px;
   overflow: hidden;
}

/* 이게 왼쪽 메뉴부분!! float:left 가  다음 창을 붙여준다 */
#menu {
   width: 250px;
   margin: 5px 0 0 0;
   float: left;
   height: 1000px;
}
/* 이게 오른쪽 본문 들어가는 부뷴 */
#content1 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   /* text-align: center; */
}

#card_info { text-align:center; }

table {
	font-size:14px;
}

</style>   

  <script type="text/javascript">
       $(function(){      
          
          $.ajax({
             url : "/hifive/info",
             type : "post",
             data : {userid : $("#userid").val()},            
             dataType : "json",
             success : function(data){     
                //프로필
                /* var fileTarget = $("input[name=profileimg]");
                 console.log(fileTarget);
                 fileTarget.on("change", function(){
                    if(window.fileReader){
                       var filename = $(this)[0].files[0].name;
                    }
                    $(".card-img-top").attr("src", data.profileimg);
                 })           */                 
                /*  var fileTarget = $("input[name=profileimg]");
                 console.log("읽어온파일명:"+data.profileimg);
                 console.log("입력된 파일명:"+fileTarget);
                 fileTarget.on("change", function(){
                    $(".card-img-top").attr("src", "/hifive/resources/image/"+data.profileimg);
                    console.log("입력된 파일명:"+fileTarget);
                 }) */
                 // 프사
                 if(data.profileimg == null) {
                	  $("#profileimage").attr("src", "/hifive/resources/profileUpfiles/profile.png");
                 }
                 else {
                	  $("#profileimage").attr("src", "/hifive/resources/profileUpfiles/"+data.profileimg);
                 }
                //이름
                $("#name").val(data.name);               
                 //주소
                 if(data.address == null){
                    $("#sample5_address").val(''); 
                 }else{
                     $("#sample5_address").val(data.address); 
                 }
                 //국적 
                 if(data.nationality == null){
                    $("#nationality").val('');
                 }else{
                    $("#nationality").prop("selected", true);
                 }
                 //성별
                if(data.gender == "F"){
                   $("#gender").val('여성');
                } else {
                   $("#gender").val('남성');
                }                   
                //이메일
                $("#email").val(data.email);                
                //직업
                if(data.job == null){
                   $("#job").val('');
                } else {
                   $("#job").val(data.job);
                }                
                //생일
                $("#birth").val(data.birth);                
                //전화번호
                $("#phone").val(data.phone);                
                //자기소개
                if(data.content == null){
                   $("#introduction").val();
                } else {
                   $("#introduction").val(data.content);
                } 
                //취미
                //String[] hchecked = new String[12];         
                if(data.hobby == null){
                  
                }else{

                  var hobbies = (data.hobby).split(",");                   
                  for(var s in hobbies){                     
                     switch(hobbies[s]){
                     case "game":
                        $("#game").attr("checked", "checked"); break;
                     case "reading":
                        $("#reading").attr("checked", "checked"); break;
                     case "music":
                        $("#music").attr("checked", "checked"); break;
                     case "camping":
                        $("#camping").attr("checked", "checked"); break;
                     case "climb":
                        $("#climb").attr("checked", "checked"); break;
                     case "sport":
                        $("#sport").attr("checked", "checked"); break;
                     case "art":
                        $("#art").attr("checked", "checked"); break;
                     case "shopping":                        
                        $("#shopping").attr("checked", "checked"); break;
                     case "bike":
                        $("#bike").attr("checked", "checked"); break;
                     case "walk":
                        $("#walk").attr("checked", "checked"); break;
                     case "sleep":
                        $("#sleep").attr("checked", "checked"); break;
                     case "dance": 
                        $("#dance").attr("checked", "checked"); break;      
                     case "movie": 
                         $("#movie").attr("checked", "checked"); break;      

                     }
                  }  
                } 
             }
          }); // userajax
          
          $.ajax({
             url : "/hifive/hosting",
             type : "post",
             data : {userid : $("#userid").val()},
             dataType : "json",
             success : function(data){
            	if(data.result == '1') {
            		$("#hosttable").html("호스트를 등록하지 않았습니다."); 
            		$("#hsubmit").hide();
            		$("#hreset").hide();
            		
            		$("#phototable").html("호스트를 등록하지 않았습니다."); 
            		$("#photosubmit").hide();            		
            	}
            	else {
	                //인원
	                if(data.num == null){
	                   $("#h-num").val('');
	                } else {                   
	                    $("#h-num").val(data.num);
	                    $("#rolecheck-host").attr("checked", true);
	                }
	                //성별                
	                if(data.gender == null){
	                   $("#genderselect").prop("selected", true);
	                }else if(data.gender == "F"){
	                   $("#female").prop("selected", true);
	                }else if(data.gender == "M"){
	                   $("#male").prop("selected", true);
	                }else {
	                   $("#both").prop("selected", true);
	                }
	                //옵션 
	                if(data.check1 == null){
	                   
	                }else{
	                   var checks = data.check1.split(",");
	                   for(var s in checks){
	                      switch(checks[s]){                   
	                        case "smoking":
	                           $("#smoking").attr("class", "btn btn-outline-secondary btn-sm active"); break;
	                        case "kids":
	                           $("#kids").attr("class", "btn btn-outline-secondary btn-sm active"); break;
	                        case "pet":
	                           $("#pet").attr("class", "btn btn-outline-secondary btn-sm active"); break;
	                       case "drinking":
	                          $("#drinking").attr("class", "btn btn-outline-secondary btn-sm active"); break;
	                      }
	                   }
	                }
	                //수면장소
	                if(data.check2 == null){
	                   $("#roomselect").prop("selected", true);
	                }else if(data.check2 == 'living'){
	                   $("#living").prop("selected", true);
	                }else if(data.check2 == 'single'){
	                   $("#single").prop("selected", true);
	                }else if(data.check2 == 'sharing'){
	                   $("#sharing").prop("selected", true);
	                }else{
	                   $("#sofa").prop("selected", true);
	                }
	                //추가 정보
	                if(data.content == null){
	                   $("#hostcontent").val('');
	                }else{
	                   $("#hostcontent").val(data.content);
	                }
            	}

             },
             error : function(jqXHR, textstatus, errorThrown){
                console.log("error : "+jqXHR+", "+textstatus+", "+errorThrown);
             }             
          }); //hostajax
                 
          $.ajax({

             url : "/hifive/surfing",
             type : "post",
             data : {userid : $("#userid").val()},
             dataType : "json",
             success : function(data){
            	 if(data.result == "1") {
            		 $("#surfertable").html("서퍼를 등록하지 않았습니다."); 
            		 $("#ssubmit").hide();
             		 $("#sreset").hide();
            	 }
            	 else {
            		 //목적지
	            	 
	                if(data.destination == null){
	                   $("#s-destination").val('');
	                }else{
	                   $("#s-destination").val(data.destination);
	                   $("#rolecheck-surfer").attr("checked", true);
	                }
	                //여행시작날짜
	                if(data.startdate == null){
	                   $("#s-startdate").val('');
	                }else{
	                   $("#s-startdate").val(data.startdate);
	                }
	                //여행끝날짜
	                if(data.enddate == null){
	                   $("#s-enddate").val('');
	                }else{
	                   $("#s-enddate").val(data.enddate);
	                }
	                //인원
	                if(data.num == null){
	                   $("#s-num").val('');
	                }else{
	                   $("#s-num").val(data.num);
	                }
	             }   
             }
          });//surfing ajax
          
          $.ajax({
             url : "/hifive/partnering",
             type : "post",
             data : {userid : $("#userid").val()},
             dataType : "json",
             success : function(data){
            	if(data.result == "1") {
            		$("#partnertable").html("파트너를 등록하지 않았습니다."); 
            		$("#psubmit").hide();
            		$("#preset").hide();
            	}
            	else {
	                //목적지
	                if(data.destination == null){
	                   $("#p-destination").val('');
	                }else{
	                   $("#p-destination").val(data.destination);
	                   $("#rolecheck-partner").attr("checked", true);
	                }
	                //여행시작날짜
	                if(data.startdate == null){
	                   $("#p-startdate").val('');
	                }else{
	                   $("#p-startdate").val(data.startdate);
	                }
	                //여행끝날짜
	                if(data.enddate == null){
	                   $("#p-enddate").val('');
	                }else{
	                   $("#p-enddate").val(data.enddate);
	                }
	                //인원
	                if(data.num == null){
	                   $("#p-num").val('');
	                }else{
	                   $("#p-num").val(data.num);
	                }
	             }
             }
        });
            
           
          $.ajax({   
             url : "/hifive/reviewlist",
                type : "get",
             data : {userid : $("#userid").val()},
             dataType : "json",         
             success : function(data){
                //배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
                var jsonStr = JSON.stringify(data);
                         
                //문자열을 json 객체로 바꿈
                var json = JSON.parse(jsonStr);
             
                var values = "";
                if(json.list.length == 0){
                   values += "등록된 리뷰가 없습니다.";
                   $("#review").html($("#review").html()+values);   
                } else{               
                   for(var i in json.list){
                      values += "아이디 : " + json.list[i].user_id 
                      +"<br>날짜 : " + json.list[i].review_date
                      +"<br>내용 : " + json.list[i].content +"<br><br>";
                   }                              
                   $("#review").html($("#review").html()+values);
                   
                }
             }, // success
             error : function(jqXHR, textstatus, errorThrown){
                console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
             } // error
          });
          
       }); //document.ready

       function changePW(){
          var url= "/hifive/views/user/changePW.jsp";    //팝업창 페이지 URL
            var winWidth = 700;
             var winHeight = 600;
             var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
            window.open(url,"",popupOption);
          }
       
    </script>  
       

</head>


<body>
   <div class="container">
      <%@ include file="../../header.jsp"%>
      <hr>
      <input type="hidden" id="userid" name="userid" value="">
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">            
               <font size="3" ><b>Mypage</b></font>               
               <img class="card-img-top rounded-circle" id="profileimage" src="" alt="Card image cap" height="220px">
               <div class="card-body">
                  <p class="card-text">                  
                  <div id="mpageInfo" name="mpageInfo" align="center">
                    <div class="col-sm-10"> 
                       <input type="text" readonly id="name" class="form-control" name="username" style="width:100px;">                       
                    </div> 
                     <br>
                     <br>    
                     <form action="/hifive/pimage" method="post" enctype="multipart/form-data">                              
                     <input type="file" id="pimg" name="pimg" accept="image/*">
                     <input type="hidden" id="imguserid" name="imguserid" value="<%= headeruser.getUser_Id() %>">
                     <br>
                     <input type="submit" id="imgbtn" value="프사업로드">
                     </form>        
                     <br>
                     <br>
                               
                  </div>
        
                  <br>
                  <div id="request" name="request" align="center">
                     <table>
                        <tr>
                           <th><input type="button" class="btn btn-primary" style="width:200px;" value="선호하는 USER"
                                 onclick="location.href='/hifive/favoritelist?userid=<%=userId%>'"></th>
                        </tr>
                        <tr>
                           <th><input type="button" class="btn btn-primary" style="width:200px;" value="비밀번호 변경"
                                 onclick= "changePW()"></th>
                        </tr>
                     </table>
                     <br>
                        <form action="/hifive/userdelete?userid=<%=userId %>" method="post">
                        <table>
                           <tr>
                               <th>                           
                                    <input type="submit" class="btn btn-danger" style="width:200px;" value="회원 탈퇴">                                    
                             </th>
                           </tr>
                        </table>
                      </form>                         
                  </div>                  
               </div>
            </div>
         </div>
         
         
         
         <div id="content1">
            <form action="/hifive/infoupdate?userid=<%= userId %>" method="post">              
            <div class="card" id="basisinfo" style="width: auto;">
               <div class="card-body">               
                  <table align="right" width="240" cellspacing="0" cellpadding="0">
                     <tr valign="middle">
                        <th width="80">Host</th>
                        <th>Surfer</th>
                        <th>Partner</th>
                     </tr>
                     <tr>
                        <td align="center"><input type="checkbox" id="rolecheck-host" class="rolecheck" name="role" value="host"></td>                       
                        <td align="center"><input type="checkbox" id="rolecheck-surfer" class="rolecheck" name="role" value="surfer"></td>
                        <td align="center"><input type="checkbox" id="rolecheck-partner" class="rolecheck" name="role" value="partner"></td>
                     </tr>
                  </table> 
                  <br>
                  <br> 
      
                 
                                 
                  <table class="table">
                   	<tbody>
                     <tr>
                      
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Gender</label>                       
                           <div class="col-sm-10">
                             <input type="text" readonly id="gender" class="form-control" style="width:60px;" name="gender">                                 
                           </div>
                        </div>
                          
                     </tr>
                     <tr>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Birth</label>
                            <div class="col-sm-10">
                              <input type="text" readonly id="birth" class="form-control" style="width:120px;" name="birth" size="300">
                            </div>
                        </div>   
                     </tr>                             
                     <tr>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Job</label>
                           <div class="col-sm-10">                          
                                 <input type="text" id="job" class="form-control" style="width:200px;" name="job">                           
                           </div>
                        </div>
                     </tr>     
                     <tr>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                               <input type="email" readonly id="email" name="email" class="form-control" style="width:300px;" name="email">
                            </div>
                       </div>               
                     </tr>                      
                     <tr>
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Phone</label>
                           <div class="col-sm-10">
                              <input type="tel" id="phone" class="form-control" style="width:200px;" name="phone">
                           </div>
                        </div>
                      </tr>                        
                      <tr>
                      <div class="form-group row">
                      <label class="col-sm-2 col-form-label">Address</label>
                      <div class="col-sm-10">
                      <textarea class="form-control" name="address" id="sample5_address" rows="3" cols="25" placeholder="주소"></textarea>
               		  <input type="button" class="btn btn-outline-dark text-dark" onclick="sample5_execDaumPostcode()" value="주소 입력"><br>
                      <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                      </div>
                      </div>
		               <script>            
		                   function sample5_execDaumPostcode() {
		                       new daum.Postcode({
		                           oncomplete: function(data) {
		                               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                               var fullAddr = data.address; // 최종 주소 변수
		                               var extraAddr = ''; // 조합형 주소 변수
		               
		                               // 기본 주소가 도로명 타입일때 조합한다.
		                               if(data.addressType === 'R'){
		                                   //법정동명이 있을 경우 추가한다.
		                                   if(data.bname !== ''){
		                                       extraAddr += data.bname;
		                                   }
		                                   // 건물명이 있을 경우 추가한다.
		                                   if(data.buildingName !== ''){
		                                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                                   }
		                                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                               }
		               
		                               // 주소 정보를 해당 필드에 넣는다.
		                               document.getElementById("sample5_address").value = fullAddr;
		                           }
		                       }).open();
		                   }
		               </script>
                     <br>
                     <br>
                           
                      </tr>
                      
                      <tr>
                       <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Nationality</label>
                           <div class="col-sm-10">
                             <select class="custom-select form-control-sm" name="countries" style="width:200px;">
		                        <option id="nationality">국적 선택</option>              
		                        <%
		                            java.util.Locale locale = null;                
		                             String[] countries = java.util.Locale.getISOCountries();                
		                             for(String country : countries) {            
		                                 locale = new java.util.Locale("ko", country);                                   
		                        %>
		                        <option><%= locale.getDisplayCountry() %></option>
		                        <% } %>
		                        </select>  
                           </div>
                        </div>
                        
                       
                      </tr>
                      <tr>                   
                        <div class="form-group row">
                           <label class="col-sm-2 col-form-label">Hobby</label>
                        </div>
                      
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="game" value="game">
    						<label class="form-check-label" >게임</label>
  						  </div>
                        </td>                       
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="reading" value="reading">
    						<label class="form-check-label">독서</label>
 						  </div>
                        </td>                        
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="music" value="music">
    						<label class="form-check-label">음악</label>
  						  </div>
                        </td>
                        <td>
                          <div class="form-group form-check">
              				<input type="checkbox" name="hobby" class="form-check-input" id="camping" value="camping">
    						<label class="form-check-label">캠핑</label>
  						  </div>
                        </td>
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="climb" value="climb">
    						<label class="form-check-label">등산</label>
                          </div>
                        </td>                                                                                                                                                                                         
                     </tr>
                     <tr>
                         <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="sport" value="sport">
    						<label class="form-check-label">운동</label>
  						  </div>
                        </td>                       
                        <td>
                          <div class="form-group form-check">
    					  	<input type="checkbox" name="hobby" class="form-check-input" id="art" value="art">
    					  	<label class="form-check-label">그림</label>
  						  </div>
                        </td>                        
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="shopping" value="shopping">
    						<label class="form-check-label">쇼핑</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="walk" value="walk">
    						<label class="form-check-label">산책</label>
                          </div>
                        </td>
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="movie" value="movie">
    						<label class="form-check-label">영화</label>
  						  </div>
                        </td>                     
                     </tr>                     
                     <tr>
                         <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="dance" value="dance">
    						<label class="form-check-label">춤</label>
 						  </div>
                         </td>                       
                        <td>
                         <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="sleep" value="sleep">
    						<label class="form-check-label">잠</label>
  						 </div>
                        </td>                        
                   	    <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="bike" value="bike">
    						<label class="form-check-label">자전거</label>
                          </div>
                        </td>
                        <!-- <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="" value="">
    						<label class="form-check-label">추가2</label>
  						  </div>
                        </td>
                        <td>
                          <div class="form-group form-check">
    						<input type="checkbox" name="hobby" class="form-check-input" id="" value="">
    						<label class="form-check-label">추가3</label>
  						  </div>
                        </td> -->                    
                     </tr>                     
                    </tbody>
                  </table>                                                 
               </div>
            </div>
            
            <br>
            
            <div id="mpagemenu">
               <a href="#intro"><input type="button" class="btn btn-outline-info" value="Introduction" style="width: 110px;"></a>&nbsp; 
               <a href="#myhome"><input type="button" class="btn btn-outline-info" value="My Home" style="width: 110px;"></a>&nbsp; 
               <a href="#surfer"><input type="button" class="btn btn-outline-info" value="Surfer" style="width: 110px;"></a>&nbsp; 
               <a href="#partner"><input type="button" class="btn btn-outline-info" value="Partner" style="width: 110px;"></a>&nbsp; 
               <a href="#photo"><input type="button" class="btn btn-outline-info" value="Photos" style="width: 110px;"></a>&nbsp; 
               <a href="#reference"><input type="button" class="btn btn-outline-info" value="References" style="width: 110px;"></a>
            </div>
            
            <br>
            
            <div id="intro" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Introduction</h6>
               <div class="card-body">               
                     <textarea class="form-control" id="introduction" name="introduction" rows="5" cols="90" placeholder="자기소개를 작성해주세요"></textarea>                                      
                     <br>   
                      <center>              
                     <input type="submit" class="btn btn-primary-sm" style="width:100px;" value="수정" id="updateinfo">&nbsp;&nbsp;
                     <input type="reset" class="btn btn-primary-sm" style="width:100px;" value="초기화">   
                     </center>
               </div>
            </div>
            </form>
                               
            <br>
            
            <form action="/hifive/hupdate?userid=<%=userId %>" method="post">
            	<div id="myhome" class="card" style="width: auto;">
               		<h6 class="card-header" id="card_info">My Home</h6>
               		<div class="card-body">
                  		<p class="card-text">
                 
                      <table id="hosttable">
                        <tr>
                          <td>최대가능 인원&nbsp;&nbsp;&nbsp;</td>
                          <td><input type="number" class="form-control" id="h-num" name="num" min="1" step="1" style="width:60px;"></td>
                        </tr>
                        
                        <tr>
                        </tr>
                        
                        <tr>
                          <td>선호하는 성별&nbsp;&nbsp;&nbsp;</td>
                          <td>
                            <select class="custom-select" id="pgender" name="gender" style="width:110px;">
                              <option id="genderselect" value="">선택</option>  
                              <option value="F" id="female">여성</option>
                              <option value="M" id="male">남성</option>
                              <option value="B" id="both">상관없음</option>
                            </select>
                          </td>
                        </tr>
                        
                        <tr>
                        </tr>
                        
                        <tr>
                          <td>기타가능 여부&nbsp;&nbsp;&nbsp;</td>
                          <td>
                            <table>
                              <tr>
                                <td>
                                 <!-- <div class="btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary btn-sm" id="smoking">
                                    <input type="checkbox" name="hostcheck" value="smoking"> 흡연
                                    </label>
                                 </div> -->
                                 
                                 <div class="form-group form-check">
    								<input type="checkbox" class="form-check-input" id="exampleCheck1">
    								<label class="form-check-label" for="exampleCheck1">흡연&nbsp;&nbsp;&nbsp;</label>
  						 		 </div>
                                </td>
                                <td>
                                 <!-- <div class="btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary btn-sm" id="kids"> 
                                    <input type="checkbox" name="hostcheck" value="kids"> 아이동반
                                    </label>
                                 </div> -->   
                                 <div class="form-group form-check">
    								<input type="checkbox" class="form-check-input" id="exampleCheck1">
    								<label class="form-check-label" for="exampleCheck1">아이동반&nbsp;&nbsp;&nbsp;</label>
  						 		 </div>                           
                                </td>
                                <td>
                                <!--  <div class="btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary btn-sm" id="pet">
                                    <input type="checkbox" name="hostcheck" value="pet"> 애완동물
                                    </label>
                                 </div> -->
                                 <div class="form-group form-check">
    								<input type="checkbox" class="form-check-input" id="exampleCheck1">
    								<label class="form-check-label" for="exampleCheck1">애완동물&nbsp;&nbsp;&nbsp;</label>
  						 		 </div>
                                </td>
                                <td>
                                <!--  <div class="btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary btn-sm" id="drinking">
                                    <input type="checkbox" name="hostcheck" value="drinking"> 음주
                                    </label>
                                 </div> -->  
                                 <div class="form-group form-check">
    								<input type="checkbox" class="form-check-input" id="exampleCheck1">
    								<label class="form-check-label" for="exampleCheck1">음주&nbsp;&nbsp;&nbsp;</label>
  						 		 </div>                            
                                </td>
                              </tr>
                            </table>                  
                          </td>
                        </tr> 
                        
                        <tr>
                        </tr>
                                   
                        <tr>
                          <td>수면 장소&nbsp;&nbsp;&nbsp;</td>
                          <td>
                           <select class="custom-select" name="sleeping" style="width:110px;">
                                <option value="" id="roomselect">선택</option>
                                <option value="living" id="living">거실</option>
                                <option value="single" id="single">단독 방</option>
                                <option value="sharing" id="sharing">공용 방</option>
                                <option value="sofa" id="sofa">소파</option>
                           </select>                                 
                          </td>
                        </tr> 
                        
                        <tr>
                        	<td></td>
                        	<td></td>
                        </tr>
                        
                                      
                        <tr>
                          <td>추가 정보&nbsp;&nbsp;&nbsp;</td>
                           <td><textarea class="form-control" id="hostcontent" name="etc" rows="3" cols="60"></textarea></td>   
                        </tr>
                        
                        <tr>
                        </tr>
                        
                        <tr>
                          <td>사진&nbsp;&nbsp;&nbsp;</td>
                          <td><img class="rounded-float" src="/hifive/resources/image/profile.png" width="100px" height="100px"></td>
                        </tr>
                     </table> 
                  
                
                  <br>  
                                  
                  <center>
                   <input type="submit" id="hsubmit" class="btn btn-primary-sm" style="width:100px;" value="수정">&nbsp;&nbsp;
                   <input type="reset" id="hreset" class="btn btn-primary-sm" style="width:100px;" value="초기화">   
                  </center>
               </div>
             </div>
           </form>                               
           
           <br>
           
           <form action="/hifive/supdate?userid=<%=userId %>" method="post">
            <div id="surfer" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Surfer</h6>
               <div class="card-body">
                  <p class="card-text">
                  
                   <table id="surfertable">
                     <tr>
                        <td>목적지&nbsp;&nbsp;&nbsp;</td>
                        <td><textarea class="form-control" name="city" id="s-destination" rows="1" cols="20" style="width:130px;"></textarea>
                     </tr>                     
                     <tr>                        
                        <td>여행기간&nbsp;&nbsp;&nbsp;</td>
                        <td>
                           <input type="date" id="s-startdate" class="form-control" name="startdate">                         
                        </td>
                        <td>
                        &nbsp;&nbsp;~&nbsp;&nbsp;
                        </td>
                        <td>
                           <input type="date" id="s-enddate" class="form-control" name="enddate">
                        </td>
                       
                       
                     </tr>
                     <tr>
                        <td>인원&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="number" id="s-num" class="form-control" name="num" min="1" step="1" style="width:60px;"></td>
                     </tr>
                  </table>
                                   
                 
                  <br>
                  <center>
                    <input type="submit" id="ssubmit" class="btn btn-primary-sm" style="width:100px;" value="수정">&nbsp;&nbsp;
                    <input type="reset" id="sreset" class="btn btn-primary-sm" style="width:100px;" value="초기화">   
                  </center>
               </div>
              </div>
            </form>           
            
            <br>
                     
            <form action="/hifive/pupdate?userid=<%=userId %>" method="post">
            <div id="partner" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Partner</h6>
               <div class="card-body">
                  <p class="card-text">                  
                 
                  <table id="partnertable">
                     <tr>
                        <td>목적지&nbsp;&nbsp;&nbsp;</td>
                        <td><textarea id="p-destination" name="city" class="form-control" rows="1" cols="20" style="width:130px;"></textarea>
                     </tr>                     
                     <tr>
                        <td>여행기간&nbsp;&nbsp;&nbsp;</td>
                        <td>
                           <input type="date" id="p-startdate" class="form-control" name="startdate">
                          
                        </td>
                        <td>
                         &nbsp;&nbsp;~&nbsp;&nbsp;
                        </td>
                        <td>
                           <input type="date" id="p-enddate" class="form-control" name="enddate">
                        </td>
                     </tr>
                     <tr>
                        <td>인원&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="number" id="p-num" class="form-control" name="num" min="1" step="1" style="width:60px;"></td>
                     </tr>
                  </table>
                                            
                  <br>
                 
                  <center>
                   <input type="submit" id="psubmit" class="btn btn-primary-sm" style="width:100px;" value="수정">&nbsp;&nbsp;
                   <input type="reset" id="preset" class="btn btn-primary-sm" style="width:100px;" value="초기화">   
                  </center>
               </div>
            </div>
            </form>
            
            
            <br>
            
            
            <form action="/hifive/photoupload" method="post" enctype="multipart/form-data">
            <div id="photo" class="card" style="width: auto;">
               <h6 class="card-header" id="card_info">Photos</h6>
               <div class="card-body">
               		  <table id="phototable" border="0" cellpadding="2">
               		  <tr>
               		  <td>
               		  <div class="card" style="width: 225px;">
					  <img id="output1" width="225px" height="240px" >
					  <div class="card-body">
					  <p class="card-text"><input type="file" id="photo1" name="photo1" accept="image/*" onchange="loadFile1(event)"></p>
				  
					  </div>					 
					  </div>
				      </td>
				      <td>
					  <div class="card" style="width: 225px;">
					  <img id="output2" width="225px" height="240px">
					  <div class="card-body">
					    <p class="card-text"><input type="file" id="photo2" name="photo2" accept="image/*" onchange="loadFile2(event)"></p>
					  </div>					  
					  </div>
					  </td>
					  <td>
					  <div class="card" style="width: 225px;">
					  <img id="output3" width="225px" height="240px">
					  <div class="card-body">
					    <p class="card-text"><input type="file" id="photo3" name="photo3" accept="image/*" onchange="loadFile3(event)"></p>
					  </div>
					  </div>
					  </td>
					  </tr>
					  </table>
					  <center>
					  <br>
					  <input type="submit" id="photosubmit" class="btn btn-primary" value="사진 등록하기">
					  </center>
				
					<script>
					  var loadFile1 = function(event) {
					    var output = document.getElementById('output1');
					    output.src = URL.createObjectURL(event.target.files[0]);
					  };
					  var loadFile2 = function(event) {
						    var output = document.getElementById('output2');
						    output.src = URL.createObjectURL(event.target.files[0]);
					  };
					  var loadFile3 = function(event) {
						    var output = document.getElementById('output3');
						    output.src = URL.createObjectURL(event.target.files[0]);
					  };  
					</script>
                
               </div>
            </div>
            </form>
            <br>  
               </div>
            </div>
 
            <br>
            <hr>
            <%@ include file="../../footer.jsp"%>  
            </div>      
                                       
            
</body>
</html>