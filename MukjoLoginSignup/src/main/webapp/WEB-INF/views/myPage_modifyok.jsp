<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- SweetAlert창 바꾸기-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:500" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body,ul ,li, h1,h2,h3{
    margin: 0;
    padding: 0;
    font-family: 'Sunflower' !important;
}

button {
   font-family: 'Sunflower' !important;
}
</style>
<%
   String log = "LOGIN";
   
   HttpSession sess = request.getSession();
   
   String loginedMemberSeq = (String)sess.getAttribute("loginedMemberSeq");
   String welcome = "";
   
   if(loginedMemberSeq != null) {
      welcome = (String)sess.getAttribute("loginedMemberName")+"님 환영합니다.";
      log = "LOGOUT";
   } else {
         out.println ( "<script>");
         out.println ( "window.location.href = 'http://localhost/welcome'");
         out.println ( "</script>");
   }

   int flag=(int)request.getAttribute("flag");
   int cpage = (int)request.getAttribute("cpage");
   String bseq = (String)request.getAttribute("bseq");
   
   out.println("<script type='text/javascript'>");
   if(flag == 0) {
      out.println("$().ready(function () {");
      out.println("   Swal.fire({");
      out.println("      title: '글 수정 성공',");
      out.println("      text: '성공적으로 수정했습니다.',");
      out.println("      icon: 'success',");
      out.println("   }).then(() => {");
      out.println("      location.href='../../view?cpage="+cpage+"&bseq="+bseq+"'");
      out.println("   })");
      out.println("});");
   } else {
      out.println("$().ready(function () {");
      out.println("   Swal.fire(");
      out.println("      'error',");
      out.println("      '수정하지 못했습니다.'");
      out.println("   ).then(() => {");
      out.println("      history.back();");
      out.println("   })");
      out.println("});");
   }
   out.println("</script>");
%>