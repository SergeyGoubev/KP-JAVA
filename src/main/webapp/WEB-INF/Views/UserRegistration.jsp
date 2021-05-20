<%--
  Created by IntelliJ IDEA.
  User: Сергей
  Date: 26.04.2021
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title> Свадебное агентство </title>
</head>

<body bgcolor="FFCCFF">
<form:form method="post" action="saveuser">
    <table >
        <tr>
            <td><h2>Заполните данные для регистрации:</h2></td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td><form:input path="surname"/></td>
        </tr>
        <tr>
            <td>Возраст:</td>
            <td><form:input path="age"/></td>
        </tr>
        <tr>
            <td>Телефон:</td>
            <td><form:input path="telephone"/></td>
        </tr>
        <tr>
            <td>Электронная почта:</td>
            <td><form:input path="email"/></td>
        </tr>
        <tr>
            <td>Пожелания к свадьбе:</td>
            <td><form:input path="weddingWishes"/></td>
        </tr>
        <tr>
            <td>Логин:</td>
            <td><form:input path="login"/></td>
        </tr>
        <tr>
            <td>Пароль:</td>
            <td><form:input path="password"/></td>
        </tr>
        <tr>
            <td> </td>
            <td><input type="submit" value="Добавить" /></td>
        </tr>
    </table>
</form:form>

<br>
<table border="2">
    <tr>
        <td bgcolor="CC99FF" width="130"> <a href="index">Вернуться назад</a> </td>
    </tr>
</table>

</body>
</html>
