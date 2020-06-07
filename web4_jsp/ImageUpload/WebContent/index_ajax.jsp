<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">
<style>
	#kieok-jeopyun-e {
		width: 300px;
		height: 300px;
		border: 1px solid red;
		position: absolute;
		top: 100px;
		left: 400px;
	}
</style>
</head>
<body>
<%

//시간을 취득
String fname = (new Date().getTime()) + "";
System.out.println("fname:" + fname);

//String fupload = request.getSession().getServletContext().getRealPath("/upload/");
//System.out.println("uploadfolder:" + fupload);

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

%>


<script type="text/javascript">

var sel_file;

$(document).ready(function() {
    $("#input_img").on("change", handleImgFileSelect);
}); 

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
           //$("#none-pic").hide();
           var lastIndex = $("#input_img").val().lastIndexOf("//");
			if(lastIndex == -1){
				lastIndex = $("#input_img").val().lastIndexOf("\\");
			}           
           alert($("#input_img").val());

           var originname = $("#input_img").val().substring(lastIndex+1);
           var lastIndex2 = $("#input_img").val().lastIndexOf(".");
           var fileextension = $("#input_img").val().substring(lastIndex2+1);
           $("#origin_name").val(originname);
           $("#filename").val("<%=fname%>"+originname);
           
           alert("origin_name: "+$("#origin_name").val());
           alert("filename: "+$("#filename").val());
           
           
        }
        reader.readAsDataURL(f);
    });
}

</script>


<style>
.imgBox {position:relative; width:302px; height:402px; border:1px dashed #ccc; }
.imgBox > label {position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);}
.imgBox:hover > label {z-index:2;}
.img_wrap {width:300px; height:400px; text-align:center; vertical-align:middle;}
.img_wrap img {position:absolute; top:50%; left:50%;  z-index:1; display:block; max-width:300px; max-height:400px; transform:translate(-50%, -50%);}

</style>
<form method="post" enctype="multipart/form-data" action="./fileupload">
    <div class="imgBox">
        <label for="input_img">
            	<i class="fas fa-plus-circle">
           		</i>
            </label>
        <input type="file" id="input_img" name="file" style="display:none;" />
        <input type="hidden" id="filename" name="filename" value="<%= fname%>"/>
        <input type="hidden" id="origin_name" name="origin_name"/>
        <input type="hidden" id="bbs_name" name="bbs_name" value="exhibit"/>
        <input type="hidden" id="bbs_seq" name="bbs_seq" value="3"/><!-- 전시시퀀스  -->
        <input type="hidden" id="file_seq" name="file_seq" value="1"/><!-- 표지는 모두 1 -->
         <div class="img_wrap">
            <img id="img" />
         </div>
    </div>
    <div>
    </div>
    
    
    <input type="submit" value="button">
 </form>

<div id="kieok-jeopyun-e">
 	<p>158159407996113.jpg</p>
    <img src="${request.pageContext.contextPath}/filedownload?filename=1581608000512꿀3.jpg">
 </div> 
</body>
</html>