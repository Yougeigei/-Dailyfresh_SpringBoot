<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分析页</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <style type="text/css">
        td, th {
            text-align: center;
        }

        .reg_slogan {
            height: 30px;
            text-align: left;
            font-size: 24px;
            color: #69a81e;
            margin: 15px 0 20px 150px;
        }

        #box {
            margin: 10px 0 0 20px;
        }
    </style>
</head>
<body>

<div id="box">
    <a href="${pageContext.request.contextPath}/admin/index">
        <img src="${pageContext.request.contextPath}/images/logo02.png">
    </a>
</div>
<div class="reg_slogan">统计分析商品的售卖的数量(已卖出的)</div>

<div class="container">

    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>商品名称</th>
            <th>出售数量</th>
        </tr>

        <c:forEach items="${resultList}" var="result">
            <tr style="height: 30px;">
                <td style="line-height: 30px;">${result.gname}</td>
                <td style="line-height: 30px;">${result.count}</td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>
