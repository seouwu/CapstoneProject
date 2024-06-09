<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
    <script>
        var errorMessage = "${errorMessage}";
        alert(errorMessage);
        window.location.href = "LoginProcess.jsp"; // 확인 버튼 클릭 시 LoginProcess.jsp로 이동
    </script>
</head>
<body>

</body>
</html>