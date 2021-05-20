<%--
  Created by IntelliJ IDEA.
  User: Сергей
  Date: 02.05.2021
  Time: 12:18
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
        <td bgcolor="CC99FF" width="150"> <a href="userIndex">Вернуться назад</a> </td>
    </tr>
</table>
<br>
<table border="2" width="70%" cellpadding="2">
    <tr>
        <td>Имя:</td>
        <td>Фамилия:</td>
        <td>Комментарий:</td>
        <td></td>
    </tr>
    <form:form method="post" action="saveguest">
        <tr>
            <td><form:input path="name"/></td>
            <td><form:input path="surname"/></td>
            <td><form:input path="comment"/></td>
            <td><input type="submit" value="Добавить" /></td>
        </tr>
    </form:form>

    <c:choose>
        <c:when test="${fn:length(list) gt 0}">
            <c:forEach var="guests" items="${list}">
                <tr>
                    <td>${guests.name}</td>
                    <td>${guests.surname}</td>
                    <td>${guests.comment}</td>
                    <td><form:form method="post" action="deleteGuest/${guests.id}"><input type="submit" value="Удалить" /></form:form></td>
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