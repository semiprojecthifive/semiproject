<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>

<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">

<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style type="text/css">
   /* 전체 사이즈 1000에 맞게 사이즈 해놨으니 안 바꾸셔도 될거에여.. */
   
   /* 여기 이새끼가 전체 우리 컨테이너 역할 */
   .container{
   margin: 0 auto;
   padding: 10px;
   }

   /* 이게  우리가 이제 만들어야할 공간 */
   #main{width:1000px;overflow:hidden;}
   /* 이게 왼쪽 메뉴부분!! float:left 가  다음 창을 붙여준다 */
   #menu{width:250px;margin:5px 0 0 0;float:left;}
   /* 이게 오른쪽 본문 들어가는 부뷴 */
   #content1 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}
#content2 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}
   
   .card-body{text-align: center;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
   <div class="container">
      <%@ include file="../../../header.jsp"%>
      <hr>
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">
  <div class="card-body">
    <h5 class="card-title">사용자 기본정보</h5>
    <h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
    <p class="card-text">......<br><br><br><br><br><br><br><br><br></p>
    <a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>
    
  </div>
</div>
         </div>
         <div id="content1">
          <div class="btn-group " role="group" aria-label="First group">
                 <button type="button" class="btn btn-secondary btn-outline-secondary" onclick="location.href='/hifive/views/support/notice/noticeList.jsp'">공지사항</button>
   <button type="button" class="btn btn-secondary btn-outline-secondary" onclick="location.href='/hifive/views/support/report/reportList.jsp'">신고게시판</button>
    <button type="button" class="btn btn-secondary btn-outline-secondary" onclick="location.href='/hifive/views/user/mypage.jsp'">마이 페이지</button>
    <button type="button" class="btn btn-secondary btn-outline-secondary" onclick="location.href='/hifive/views/support/safety.jsp'">안전 유의사항</button>
   <button type="button" class="btn btn-secondary btn-outline-secondary" onclick="location.href='/hifive/views/support/tutorial.jsp'">튜토리얼</button>
  </div>
         </div>
         <div id="content2">
           

   
            <table class="table table-sm" style="text-align: center;">
               <thead>
                  <tr>
                     <th>글번호</th>
                     <th width="300px">제 목</th>
                     <th>작성자</th>
                     <th>접수상태</th>
                     <th>작성일자</th>
                     <th>조회수</th>

                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>1</td>
                     <td>Otto</td>
                     <td>@mdo</td>
                     <td>Mark</td>
                     <td>Otto</td>
                     <td>0</td>
                  </tr>
                  <tr>
                     <td>2</td>
                     <td>Thornton</td>
                     <td>@fat</td>
                     <td>Mark</td>
                     <td>Otto</td>
                     <td>0</td>
                  </tr>
                  <tr>
                     <td>3</td>
                     <td>the Bird</td>
                     <td>@twitter</td>
                     <td>Mark</td>
                     <td>Otto</td>
                     <td>0</td>
                  </tr>
                  <tr>
                     <td>4</td>
                     <td>오승연 짱</td>
                     <td>ㅋ</td>
                     <td>Mark</td>
                     <td>Otto</td>
                     <td>0</td>
                  </tr>
               </tbody>
            </table>
            <form>
               <div class="form-row align-items-center">            
                  <div class="col-auto my-1">                     
                     <select class="custom-select mr-sm-2">
                        <option selected id="RsearchTitle">제목</option>
                        <option value="1" id="RsearchTitleId">아이디</option>
                     </select>
                  </div>
                  <div class="col-auto my-1">
                     <input type="text" style="width:550px" class="form-control col-auto my-1" id="RsearchContent">
                  </div>
                  <div class="col-auto my-1">
                     <button type="submit" class="btn btn-primary">검색</button>
                  </div>
               </div>
            </form>



            <!-- 페이징 처리 부분! 아직 서블릿 구현 안 해서 동작 X -->
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                  </a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
                        class="sr-only">Next</span>
                  </a></li>
               </ul>
            </nav>
         </div>
      </div>
      <br>
      <hr>
      <%@ include file="../../../footer.jsp"%>
   </div>

</body>
</html>