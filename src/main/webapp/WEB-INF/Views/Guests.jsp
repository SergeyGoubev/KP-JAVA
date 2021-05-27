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
    <title> Агенство по проведению праздников</title>

    <!-- Bootstrap core CSS -->
    <!-- <link href="/resources/css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <style>
        <%@ include file="/resources/css/carousel.css" %>
        .gosti{
            margin-top: 30px;
        }
        .text{
            align-content: center;
        }
    </style>

</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="userIndex">ПуА</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="userIndex">Главная</a>
                    </li>
                    <li class="nav-item"><a class="nav-link">Люди<i class="fa fa-angle-down"></i></a>
                        <ul class="submenu">
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/1">Ведущие</a></li>
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/2">Фотографы</a></li>
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/3">Видеографы</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link">Еда</a>
                        <ul class="submenu">
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/4">Рестораны</a></li>
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/10">Торты</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="weddingHosts/5">Декор и флористика</a></li>
                    <li class="nav-item"><a class="nav-link">Салоны</a>
                        <ul class="submenu">
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/6">Салон красоты</a></li>
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/7">Свадебный салон</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link">Музыка, танцы, шоу</a>
                        <ul class="submenu">
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/8">Шоу-программы</a></li>
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/11">Музыкальное сопровождение</a></li>
                            <li class="nav-item"><a class="nav-link" href="weddingHosts/12">Постановка свадебного танца</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="weddingHosts/9">Транспорт</a></li>
                    <li class="nav-item"><a class="nav-link" href="weddingHosts/13">Отели</a></li>
                    <li class="nav-item"><a class="nav-link">Моё</a>
                        <ul class="submenu">
                            <li class="nav-item"><a class="nav-link" href="guests">Список гостей</a></li>
                            <li class="nav-item"><a class="nav-link" href="error">Учёт расходов</a></li>
                            <li class="nav-item"><a class="nav-link" href="error">Мои заказы</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <form class="d-flex" action="index">
                    <button class="btn btn-outline-success">Выход</button>
                </form>
                <form class="d-flex" action="${backRef}">
                    <button class="btn btn-outline-success">Вернуться назад</button>
                </form>
            </div>
        </div>
    </nav>
</header>

<main>
    <div align="center" class="gosti">
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
                    <td class="text"><h3>Список пуст</h3></td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>
</html>












</body>
</html>