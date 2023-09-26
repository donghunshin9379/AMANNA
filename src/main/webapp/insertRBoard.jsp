<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String id = request.getParameter("id");
%>   
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<title>Write review</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
    #preview {
        margin-top: 20px;
    }

    #preview img {
        width: 300px;
        height: auto;
    }
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }

    h1 {
        text-align: center;
        margin-top: 30px;
        font-size: 28px;
        color: #333;
    }

    table {
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fceff1;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        width: 100px;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }

    input[type="file"] {
        margin-top: 10px;
    }

    #preview1 {
        margin-top: 10px;
        text-align: center;
    }

    #preview1 img {
        max-width: 300px;
        height: auto;
    }

    .center {
        text-align: center;
    }

    .submit-button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #ff5722;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .submit-button:hover {
        background-color: #f4511e;
    }

    .error {
        color: red;
        font-size: 14px;
        margin-top: 5px;
    }
    
    main {
	height: 850px;
}

footer {
position : relative;
bottom : 0;

}
</style>
<script>
$(function () {
    $(".mainnav1 >li").mouseover(function () {
      $(this).children(".site_nav").stop().slideDown(300);

      $(".mainnav1 > li").mouseleave(function () {
        $(this).children(".site_nav").stop().slideUp(300);
      });
    }); //메뉴

    setInterval(move, 3000);
    function move() {
      $(".menuslide ul").animate(
        {
          left: "-1350px",
        },
        1500,
        function () {
          $(this).append($(".menuul ul li").first());
          $(".menuslide ul").css("left", 0);
        }
      );
    } //
  }); //전체
$(document).ready(function() {
    $("#uploadFile1").change(function() {
        var file = $(this)[0].files[0];
        var reader = new FileReader();

        reader.onload = function(e) {
            $("#preview1").html("<img src='" + e.target.result + "' />");
        }

        reader.readAsDataURL(file);
    });

    $("#reviewForm").submit(function(event) {
        var rTitle = $("input[name='rTitle']").val();
        var rContent = $("textarea[name='rContent']").val();

        if (rTitle.trim() === "" || rContent.trim() === "") {
            event.preventDefault();
            Swal.fire({
                title: "내용 입력 바랍니다",
                icon: "warning",
                confirmButtonColor: "#3085d6",
                confirmButtonText: "확인"
            });
        }
    });
});
</script>
</head>
<body>
<%@include file="html/header.jspf"%>
<main>
    <form id="reviewForm" action="insertRBoard.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= id %>"> 
        <br><br><br><br>
        <table>
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="rTitle">
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="rContent" rows="10" cols="40"></textarea>
                </td>
            </tr>
            <tr>
                <th>파일첨부</th>
                <td>
                    <input type="file" name="uploadFile" id="uploadFile1">
                </td>
                <div id="preview1"></div>
            </tr>
            <tr>
                <td colspan="2" class="center">
                    <input type="submit" value="리뷰 작성하기">
                </td>
            </tr>
        </table>
    </form>
    </main>
       <%@include file="html/footer.jspf"%>
</body>
</html>