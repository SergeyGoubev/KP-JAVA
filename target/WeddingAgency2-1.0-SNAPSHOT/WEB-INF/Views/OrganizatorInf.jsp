<%--
  Created by IntelliJ IDEA.
  User: Сергей
  Date: 29.04.2021
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title> Свадебное агентство </title>
</head>

<body bgcolor="FFCCFF">

<table border="3">
    <tr>
        <td bgcolor="CC99FF" width="60"> <a href="../index">Выход</a></td>
        <td bgcolor="CC99FF" width="150"> <a href="../${backRef}">Вернуться на главную страницу</a> </td>
        <td bgcolor="CC99FF" width="150"> <a href="34.html">Написать сообщение</a></td>
    </tr>
</table>
<br>
<table border="2" width="70%" cellpadding="2">

    <tr>
        <td>Ведущий: ${user.name} ${user.surname}</td>
        <td>Рейтинг: ${user.rating}</td>
    </tr>
    <tr>
        <td>${user.description}</td>
        <td><img src="../getUserImage/${user.userId}" height="300" width="300"/></td>
    </tr>
    <tr>
        <td>Телефон: ${user.telephone}</td>
        <td>Email: ${user.email}</td>
    </tr>
    <tr>
        <td>${user.organizationName}</td>
        <td>${user.address}</td>
    </tr>
</table>
<br>
<table border="0" ${hidden}>
    <form:form method="post" action="../comment/${user.userId}">
        <tr>
            <td>Комментарий:</td>
            <td><form:input path="comment"/></td>
        </tr>
        <tr>
            <td>Оценка (введите значение от 1 до 5):</td>
            <td><form:input path="mark"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Добавить" /></td>
        </tr>
    </form:form>
</table>

<table border="2" width="70%" cellpadding="2">
    <c:choose>
        <c:when test="${fn:length(list) gt 0}">
            <c:forEach var="commentRating" items="${list}">
                <tr>
                    <td rowspan="2">${commentRating.mark}</td>
                    <td>${commentRating.date} <a href="../userInf/${commentRating.userId}">${commentRating.name} ${commentRating.surname}</a></td>
                </tr>
                <tr>
                    <td>${commentRating.comment}</td>
                </tr>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <tr>
                <td align="center"><h3>Список пуст</h3></td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
</body>
</html>





