<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/dashboard_style.css">
    <title>MiM Dashboard</title>
</head>

<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
        <a href="/" class="navbar-brand">MiM</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav">
                <li class="nav-item px-2">
                    <a href="/dashboard/" class="nav-link">
                        <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Menus
                            </c:when>
                            <c:otherwise>
                                قوائم الطعام
                            </c:otherwise>
                        </c:choose>
                    </a>
                </li>
                <li class="nav-item px-2">
                    <a href="/dashboard/categories" class="nav-link active">
                        <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Categories
                            </c:when>
                            <c:otherwise>
                                التصنيفات
                            </c:otherwise>
                        </c:choose>
                    </a>
                </li>
                <li class="nav-item px-2">
                    <a href="/dashboard/items" class="nav-link">
                        <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Items
                            </c:when>
                            <c:otherwise>
                                المنتجات
                            </c:otherwise>
                        </c:choose>
                    </a>
                </li>
            </ul>

            <ul class="navbar-nav <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                ml-auto
              </c:when>
              <c:otherwise>
                mr-auto
              </c:otherwise>
            </c:choose>">
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
                        <a href="/language/dashboard/en" class="dropdown-item">English</a>
                        <a href="/language/dashboard/ar" class="dropdown-item">العربية</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">
                        <i class="fas fa-user-times"></i>
                        <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Logout
                            </c:when>
                            <c:otherwise>
                                تسجيل خروج
                            </c:otherwise>
                        </c:choose>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- HEADER -->
<header id="main-header" class="py-2 bg-primary text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>
                    <i class="fas fa-cog"></i>
                    <c:choose>
                        <c:when test="${lang.equalsIgnoreCase('en')}">
                            Categories
                        </c:when>
                        <c:otherwise>
                            التصنيفات
                        </c:otherwise>
                    </c:choose>
                </h1>
            </div>
        </div>
    </div>
</header>

<!-- LastAdded -->
<section class="mt-5" id="lastAdded">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4 class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                            <c:choose>
                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                    Categories
                                </c:when>
                                <c:otherwise>
                                    التصنيفات
                                </c:otherwise>
                            </c:choose>
                        </h4>
                    </div>


                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th>#</th>
                            <th>
                                <c:choose>
                                    <c:when test="${lang.equalsIgnoreCase('en')}">
                                        Category Name
                                    </c:when>
                                    <c:otherwise>
                                        اسم التصنيف
                                    </c:otherwise>
                                </c:choose>
                            </th>
                            <th>
                                <c:choose>
                                    <c:when test="${lang.equalsIgnoreCase('en')}">
                                        Which Menu?
                                    </c:when>
                                    <c:otherwise>
                                        أي قائمة طعام؟
                                    </c:otherwise>
                                </c:choose>
                            </th>
                            <th> <c:choose>
                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                    Date
                                </c:when>
                                <c:otherwise>
                                    تاريخ الاضافة
                                </c:otherwise>
                            </c:choose></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td><c:out value="${category.id}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${lang.equalsIgnoreCase('en')}">
                                            <c:out value="${category.name_en}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${category.name_ar}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${lang.equalsIgnoreCase('en')}">
                                            <c:out value="${category.menu.brandName_en}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${category.menu.brandName_ar}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <f:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${category.createdAt}"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center bg-primary text-white mb-3">
                    <div class="card-body">
                        <h3>
                            <c:choose>
                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                    Menus
                                </c:when>
                                <c:otherwise>
                                    قوائم الطعام
                                </c:otherwise>
                            </c:choose>
                        </h3>
                        <h4 class="display-4">
                            <i class="fas fa-pencil-alt"></i> <c:out value="${countMenus}"/>
                        </h4>
                        <a href="/dashboard" class="btn btn-outline-light btn-sm">
                            <c:choose>
                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                    View
                                </c:when>
                                <c:otherwise>
                                    عرض
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </div>
                </div>

                <div class="card text-center bg-success text-white mb-3">
                    <div class="card-body">
                        <h3> <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Categories
                            </c:when>
                            <c:otherwise>
                                التصنيفات
                            </c:otherwise>
                        </c:choose></h3>
                        <h4 class="display-4">
                            <i class="fas fa-folder"></i> <c:out value="${countCategories}"/>
                        </h4>
                        <a href="/dashboard/categories" class="btn btn-outline-light btn-sm"> <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                View
                            </c:when>
                            <c:otherwise>
                                عرض
                            </c:otherwise>
                        </c:choose></a>
                    </div>
                </div>

                <div class="card text-center bg-warning text-white mb-3">
                    <div class="card-body">
                        <h3> <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                                Items
                            </c:when>
                            <c:otherwise>
                                المنتجات
                            </c:otherwise>
                        </c:choose></h3>
                        <h4 class="display-4">
                            <i class="fas fa-users"></i> <c:out value="${countItems}"/>
                        </h4>
                        <a href="/dashboard/items" class="btn btn-outline-light btn-sm">
                            <c:choose>
                                <c:when test="${lang.equalsIgnoreCase('en')}">
                                    View
                                </c:when>
                                <c:otherwise>
                                    عرض
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer id="main-footer" class="bg-dark text-white mt-5 p-5">
    <div class="container">
        <div class="row">
            <div class="col">
                <p class="lead text-center">
                    Copyright &copy;
                    <span id="year"></span>
                    MiM
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

<script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
</script>
</body>

</html>
