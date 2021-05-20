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
<form:form method="post" action="saveorganizator" enctype="multipart/form-data">
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
            <td>Описание:</td>
            <td><form:input path="description"/></td>
        </tr>
        <tr>
            <td>Категория:
            <select>
                <option label="Ведущие" value="1" selected>Ведущие</option>
                <option>Видеографы</option>
                <option>Рестораны </option>
                <option>Декор и флористика </option>
                <option>Мастера причёски и макияжа </option>
                <option>Свадебные салоны </option>
                <option>Шоу-программы </option>
                <option>Транспорт </option>
                <option>Торты </option>
                <option>Музыкальное сопровождение </option>
                <option>Постановка свадебного танца </option>
                <option>Отели </option>
            </select>
            </td>
            <td><form:input path="category"/></td>
        </tr>
        <tr>
            <td>Фото:</td>
            <td><input type="file" name="image2"/></td>
        </tr>
        <tr>
            <td>Название организации:</td>
            <td><form:input path="organizationName"/></td>
        </tr>
        <tr>
            <td>Адрес организации:</td>
            <td><form:input path="address"/></td>
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
