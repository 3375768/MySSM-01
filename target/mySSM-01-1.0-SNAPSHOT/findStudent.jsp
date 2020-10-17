<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function () {
            loadStudentData()
            $("#button").click(function () {
                loadStudentData()
            })
        })

        function loadStudentData() {
            $.ajax({
                url:"student/findStudent.do",
                type:"get",
                dataType:"json",
                success:function (resp) {
                    $("#info").html("")

                    $.each(resp,function (i,n) {
                        $("#info").append("<tr>")
                        .append("<td>" + n.id + "</td>")
                        .append("<td>" + n.name + "</td>")
                        .append("<td>" + n.age + "</td>")
                        .append("</tr>")
                    })
                }
            })

        }
    </script>
</head>
<body>
    <div align="center">
        <table>
            <thead>
            <tr>
                <td>id</td>
                <td>name</td>
                <td>age</td>
            </tr>
            </thead>
            <tbody id="info">

            </tbody>
        </table>
        <input type="button" id="button" value="查看所有学生">
    </div>
</body>
</html>
