<%--
  Created by IntelliJ IDEA.
  User: Сергей
  Date: 26.04.2021
  Time: 18:48
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
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <form class="d-flex" action="index">
                    <button class="btn btn-outline-success">Выход</button>
                </form>
                <form class="d-flex" action="myInf">
                    <button class="btn btn-outline-success">${userJSP.name} ${userJSP.surname}</button>
                </form>
            </div>
        </div>
    </nav>
</header>


<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

            <div class="container">
                <div class="carousel-caption">
                    <h1>Праздники у Алекса</h1>
                    <p>Мы являемся единственным свадебным агентством в городе Владимир,
                        с помощью которого вы сможете подготовиться к одному из самых значимых дней в вашей жизни
                        максимально быстро и просто. Вы сможете просмотреть анкеты ведущих, фотографов и других
                        помощников в организации свадьбы, общаться с ними напрямую. Сможете подобрать шоу-программу
                        и даже заказать торт.</p>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

            <div class="container">
                <div class="carousel-caption text-end">
                    <h1>Фотогалерея</h1>
                    <p>Посмотрите наши работы.</p>
                    <p><a class="btn btn-lg btn-primary" href="Gallerey">Открыть галерею</a></p>
                </div>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>
</html>