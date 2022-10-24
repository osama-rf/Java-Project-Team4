<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html dir=
<c:choose>
    <c:when test="${lang.equalsIgnoreCase('en')}">
        "ltr"
    </c:when>
    <c:otherwise>
        "rtl"
    </c:otherwise>
</c:choose>
>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    <title>${menu.brandName_en} - ${menu.brandName_ar}</title>
</head>

<body data-spy="scroll" data-target="#main-nav" id="home">

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top" id="main-nav">
    <div class="container">
        <a href="/" class="navbar-brand">
            <img src="data:image/jpg;base64,${menu.brandLogo_path}" width="50" height="50" class="rounded-circle">
            <c:choose>
                <c:when test="${lang.equalsIgnoreCase('en')}">
                    ${menu.brandName_en}
                </c:when>
                <c:otherwise>
                    ${menu.brandName_ar}
                </c:otherwise>
            </c:choose>
        </a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav
<c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                ml-auto
                            </c:when>
                            <c:otherwise>
                                mr-auto
                            </c:otherwise>
                        </c:choose>
    ">
                <li class="nav-item dropdown mr-3">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                        <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Language
                            </c:when>
                            <c:otherwise>
                                اللغة
                            </c:otherwise>
                        </c:choose>
                    </a>
                    <div class="dropdown-menu">
                        <a href="/language/menu/${menu.id}/en" class="dropdown-item">English</a>
                        <a href="/language/menu/${menu.id}/ar" class="dropdown-item">العربية</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section style="background: url('data:image/jpg;base64,${menu.background_path}')" id="body">
    <div class="row">
        <div class="col-12">
            <div class="container tabs showItems rounded p-2 mt-4">
                <div id="tabs-controls" class="d-flex flex-wrap flex-md-nowrap mt-4 text-light align-items-center justify-content-center text-center">
                    <div  class="port-item mx-2 rounded mb-2 mb-md-0" onclick="changeActive(this)" data-toggle="collapse" data-target="#all">
                        <span class="d-block font-weight-bold">
                    <c:choose>
                        <c:when test="${lang.equalsIgnoreCase('en')}">
                            All
                        </c:when>
                        <c:otherwise>
                            الكل
                        </c:otherwise>
                    </c:choose>
                </span>
                    </div>
                    <c:forEach var="category" items="${menu.categories}">
                        <div class="port-item rounded mx-2 mb-2 mb-md-0" onclick="changeActive(this)" data-toggle="collapse" data-target="#${category.name_en}">
                            <span class="d-block font-weight-bold">
                    <c:choose>
                        <c:when test="${lang.equalsIgnoreCase('en')}">
                            ${category.name_en}
                        </c:when>
                        <c:otherwise>
                            ${category.name_ar}
                        </c:otherwise>
                    </c:choose>
                            </span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div  class="container tabs showItems rounded">
                <div id="all" class="collapse show">
                    <div class="container py-2">
                        <div class="row text-center">
                            <div class="col-lg-7 mx-auto">
                                <h1 class="display-5 text-light">
                                    <c:choose>
                                        <c:when test="${lang.equalsIgnoreCase('en')}">
                                            All
                                        </c:when>
                                        <c:otherwise>
                                            الكل
                                        </c:otherwise>
                                    </c:choose>
                                </h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mx-auto">
                                <!-- List group-->
                                <ul class="list-group text-dark p-0">
                                    <!-- list group item-->
                                    <c:forEach var="item" items="${all_items}">
                                        <li class="list-group-item mb-3 ">
                                            <!-- Custom content-->
                                            <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                                                <div class="media-body order-2 order-lg-2 mx-3 ">
                                                    <h5 class="mt-0 font-weight-bold m-2">
                                                        <c:choose>
                                                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                                                ${item.name_en}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${item.name_ar}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </h5>
                                                    <p class="font-italic text-muted mb-0 small mx-2">
                                                        <c:choose>
                                                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                                                ${item.description_en}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${item.description_ar}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </p>
                                                    <div class="d-flex align-items-center justify-content-between mt-1">
                                                        <h6 class="font-weight-bold m-2">
                                                            <c:choose>
                                                                <c:when test="${item.discountPrice > 0 && item.discountPrice != null}">
                                                                    ${item.discountPrice}$
                                                                    <del class="text-muted">${item.price}$</del>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${item.price}$
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </h6>
                                                    </div>
                                                </div>
                                                <img src="data:image/jpg;base64,${item.image_path}" alt="Generic placeholder image" height="200" width="200" class="ml-lg-2 order-1 order-lg-1 align-self-center mb-3">
                                            </div> <!-- End -->
                                        </li> <!-- End -->
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach var="category" items="${menu.categories}">
                    <div id="${category.name_en}" class="collapse">
                        <div class="container py-2">
                            <div class="row text-center text-light">
                                <div class="col-lg-7 mx-auto">
                                    <h1 class="display-5">
                                        <c:choose>
                                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                                ${category.name_en}
                                            </c:when>
                                            <c:otherwise>
                                                ${category.name_ar}
                                            </c:otherwise>
                                        </c:choose>
                                    </h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 mx-auto">
                                    <!-- List group-->
                                    <ul class="list-group text-dark p-0">
                                        <!-- list group item-->
                                        <c:forEach var="item" items="${category.items}">
                                            <li class="list-group-item mb-3">
                                                <!-- Custom content-->
                                                <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                                                    <div class="media-body order-2 order-lg-2">
                                                        <h5 class="mt-0 font-weight-bold m-2">
                                                            <c:choose>
                                                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                                                    ${item.name_en}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${item.name_ar}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </h5>
                                                        <p class="font-italic text-muted mb-0 mx-2 small">
                                                            <c:choose>
                                                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                                                    ${item.description_en}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${item.description_ar}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                                            <h6 class="font-weight-bold my-2">
                                                                <c:choose>
                                                                    <c:when test="${item.discountPrice > 0 && item.discountPrice != null}">
                                                                        ${item.discountPrice}$
                                                                        <del class="text-muted">${item.price}$</del>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${item.price}$
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </h6>
                                                        </div>
                                                    </div>
                                                    <img src="data:image/jpg;base64,${item.image_path}" alt="Generic placeholder image" height="200" width="200" class="ml-lg-5 order-1 order-lg-1 mb-3 align-self-center">
                                                </div> <!-- End -->
                                            </li> <!-- End -->
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>


<!-- FOOTER -->
<footer id="main-footer" class="sticky-bottom bg-dark">
    <div class="container ">
        <div class="row">
            <div class="col text-center py-4">
                <h3>MiM</h3>
                <p>Copyright &copy;
                    <span id="year"></span>
                </p>
            </div>
        </div>
    </div>
</footer>

<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    // Init Scrollspy
    $('body').scrollspy({ target: '#main-nav' });

    // Smooth Scrolling
    $("#main-nav a").on('click', function (event) {
        if (this.hash !== "") {
            event.preventDefault();

            const hash = this.hash;

            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function () {

                window.location.hash = hash;
            });
        }
    });

    $('.port-item').click(function () {
        $('.collapse').collapse('hide');
    });

    function changeActive(ele){
        let x = document.querySelectorAll(".port-item");
        x.forEach(function(ele){
            if(ele.classList.contains("active-tab")){
                ele.classList.remove("active-tab")
            }
        })
        ele.classList.add('active-tab');
    }

</script>
</body>

</html>