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
          <a href="/dashboard" class="nav-link active">
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
          <a href="/dashboard/categories" class="nav-link">
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
              Dashboard
            </c:when>
            <c:otherwise>
              لوحة التحكم
            </c:otherwise>
          </c:choose>
        </h1>
      </div>
    </div>
  </div>
</header>

<!-- ACTIONS -->
<section id="actions" class="py-4 mb-4 bg-light">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <a href="#" class="btn btn-warning btn-block" data-toggle="modal" data-target="#addMenuModal">
          <i class="fas fa-plus"></i>
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Add Menu
            </c:when>
            <c:otherwise>
              اضافة قائمة طعام
            </c:otherwise>
          </c:choose>
        </a>
      </div>
      <div class="col-md-3">
        <a href="#" class="btn btn-success btn-block" data-toggle="modal" data-target="#addCategoryModal">
          <i class="fas fa-plus"></i>
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Add Category
            </c:when>
            <c:otherwise>
              اضافة تصنيف
            </c:otherwise>
          </c:choose>
        </a>
      </div>
      <div class="col-md-3">
        <a href="#" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addItemModal">
          <i class="fas fa-plus"></i>
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Add Items
            </c:when>
            <c:otherwise>
              اضافة منتج
            </c:otherwise>
          </c:choose>
        </a>
      </div>
    </div>
  </div>
</section>

<!-- LastAdded -->
<section id="lastAdded">
  <div class="container">
    <div class="row">
      <div class="col-md-9">
        <div class="card">
          <div class="card-header">
            <h4 class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
              <c:choose>
                <c:when test="${lang.equalsIgnoreCase('en')}">
                  Menus
                </c:when>
                <c:otherwise>
                  قوائم الطعام
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
                    Title
                  </c:when>
                  <c:otherwise>
                    العنوان
                  </c:otherwise>
                </c:choose>
              </th>
              <th>
                <c:choose>
                  <c:when test="${lang.equalsIgnoreCase('en')}">
                    Categories
                  </c:when>
                  <c:otherwise>
                    الأصناف
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
              <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="menu" items="${menus}">
              <tr>
                <td><c:out value="${menu.id}"/></td>
                <td>
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      <c:out value="${menu.brandName_en}"/>
                    </c:when>
                    <c:otherwise>
                      <c:out value="${menu.brandName_ar}"/>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:out value="${menu.categories.size()}"/>
                </td>
                <td>
                  <f:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${menu.createdAt}"/>
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


<!-- MODALS -->

<!-- ADD Menu MODAL -->
<div class="modal fade" id="addMenuModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-warning text-white">
        <h5 class="modal-title">
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Add Menu
            </c:when>
            <c:otherwise>
              اضافة قائمة طعام
            </c:otherwise>
          </c:choose>
        </h5>
        <button class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form:form action="/dashboard/menu/create" method="POST" enctype="multipart/form-data" modelAttribute="menu">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="brandName_en" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if> ">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Brand Name in English
                    </c:when>
                    <c:otherwise>
                      اسم البراند بالانجليزي
                    </c:otherwise>
                  </c:choose>
                </label>
                <input name="brandName_en" id="brandName_en" class="form-control" />
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="brandName_ar" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if> ">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Brand Name in Arabic
                    </c:when>
                    <c:otherwise>
                      اسم البراند بالعربي
                    </c:otherwise>
                  </c:choose>
                </label>
                <input name="brandName_ar" id="brandName_ar" class="form-control" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="background" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if> ">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Menu Background
                    </c:when>
                    <c:otherwise>
                      خلفية قائمة الطعام
                    </c:otherwise>
                  </c:choose>
                </label>
                <input type="file" name="background_image" id="background" class="form-control" />
                <input type="hidden" name="background" value="no image">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="brandLogo" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if> ">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Brand Logo
                    </c:when>
                    <c:otherwise>
                      شعار البراند
                    </c:otherwise>
                  </c:choose>
                </label>
                <input type="file" name="brand_Logo" id="brandLogo" class="form-control" />
                <input type="hidden" name="brandLogo" value="no image">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <button class="btn btn-warning" type="submit">
                <c:choose>
                  <c:when test="${lang.equalsIgnoreCase('en')}">
                    Add
                  </c:when>
                  <c:otherwise>
                   اضافة
                  </c:otherwise>
                </c:choose>
              </button>
            </div>
          </div>
        </form:form>
      </div>
    </div>
  </div>
</div>


<!-- ADD CATEGORY MODAL -->
<div class="modal fade" id="addCategoryModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-success text-white">
        <h5 class="modal-title">
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Add Item
            </c:when>
            <c:otherwise>
              اضافة منتج
            </c:otherwise>
          </c:choose>
        </h5>
        <button class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form:form action="/dashboard/category/create" method="POST" modelAttribute="category">
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <form:select class="form-control" path="menu">
                  <c:forEach var="menu" items="${menus}">
                    <form:option value="${menu.id}">
                      <c:choose>
                        <c:when test="${lang.equalsIgnoreCase('en')}">
                          <c:out value="${menu.brandName_en}"/>
                        </c:when>
                        <c:otherwise>
                          <c:out value="${menu.brandName_ar}"/>
                        </c:otherwise>
                      </c:choose>
                    </form:option>
                  </c:forEach>
                </form:select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="name_en" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Category Name in English
                    </c:when>
                    <c:otherwise>
                      اسم التصنيف بالانجليزي
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input path="name_en" class="form-control"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="name_ar" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Category Name in Arabic
                    </c:when>
                    <c:otherwise>
                      اسم التصنيف بالعربي
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input path="name_ar" class="form-control"/>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-success">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                ADD
              </c:when>
              <c:otherwise>
                اضافة
              </c:otherwise>
            </c:choose>
          </button>
        </form:form>
      </div>
    </div>
  </div>
</div>

<!-- ADD Item MODAL -->
<div class="modal fade" id="addItemModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Add Item
            </c:when>
            <c:otherwise>
              اضافة منتج
            </c:otherwise>
          </c:choose>
        </h5>
        <button class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form:form action="/dashboard/item/create" method="POST" modelAttribute="item" enctype="multipart/form-data">
          <div class="row">
            <div class="col-12">
              <div class="form-group mb-3">
                <label for="menu_id" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Choose Menu
                    </c:when>
                    <c:otherwise>
                      اختر قائمة طعام
                    </c:otherwise>
                  </c:choose>
                </label>
                <select onchange="getCategories(this,${user.id})" id="menu_id" class="form-control">
                  <option value="" selected>...</option>
                  <c:forEach var="menu" items="${menus}">
                    <option value="${menu.id}">
                      <c:choose>
                        <c:when test="${lang.equalsIgnoreCase('en')}">
                          <c:out value="${menu.brandName_en}"/>
                        </c:when>
                        <c:otherwise>
                          <c:out value="${menu.brandName_ar}"/>
                        </c:otherwise>
                      </c:choose>
                    </option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group mb-3">
                <label for="categories" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if> ">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Select Category
                    </c:when>
                    <c:otherwise>
                      اختر تصنيف
                    </c:otherwise>
                  </c:choose>
                </label>
                <select name="categories" id="categories" class="form-control" multiple required></select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-6">
              <div class="form-group">
                <label for="name_en" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Product Name in English
                    </c:when>
                    <c:otherwise>
                      اسم المنتج بالانجليزي
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input class="form-control" path="name_en"/>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label for="name_en" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Product Name in Arabic
                    </c:when>
                    <c:otherwise>
                      اسم المنتج بالعربي
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input class="form-control" path="name_ar"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-6">
              <div class="form-group">
                <label for="description_en" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Description Name in English
                    </c:when>
                    <c:otherwise>
                      وصف المنتج بالانجليزي
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:textarea class="form-control" path="description_en"/>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label for="description_ar" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Description Name in Arabic
                    </c:when>
                    <c:otherwise>
                      وصف المنتج بالعربي
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:textarea class="form-control" path="description_ar"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-6">
              <div class="form-group">
                <label for="price" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Product Price
                    </c:when>
                    <c:otherwise>
                     سعر المنتج
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input type="Number" class="form-control" path="price"/>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label for="discountPrice" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Discount price ( if any )
                    </c:when>
                    <c:otherwise>
                      سعر المنتج بعد الخصم ( إن وجد )
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input class="form-control" path="discountPrice"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-6">
              <div class="form-group">
                <label for="promo_en" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Product Promo in English ( if any )
                    </c:when>
                    <c:otherwise>
                      العرض الترويجي بالانجليزي ( إن وجد )
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input class="form-control" path="promo_en"/>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label for="promo_ar" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if>">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      Product Promo in Arabic ( if any )
                    </c:when>
                    <c:otherwise>
                      العرض الترويجي بالعربي ( إن وجد )
                    </c:otherwise>
                  </c:choose>
                </label>
                <form:input class="form-control" path="promo_ar"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label for="product_image" class="<c:if test="${lang.equalsIgnoreCase('ar')}">float-right</c:if> ">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                     Product Image
                    </c:when>
                    <c:otherwise>
                      صورة المنتج
                    </c:otherwise>
                  </c:choose>
                </label>
                <input type="file" name="product_image" id="product_image" class="form-control" />
                <input type="hidden" name="image" value="no image">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <button type="submit" class="btn btn-success">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      ADD
                    </c:when>
                    <c:otherwise>
                      اضافة
                    </c:otherwise>
                  </c:choose>
                </button>
              </div>
            </div>
          </div>
        </form:form>
      </div>
    </div>
  </div>
</div>





<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>

<script>
  // Get the current year for the copyright
  $('#year').text(new Date().getFullYear());


  function getCategories(element,user_id){
    let menu_id = element.value;
    $.ajax({
      url: "/api/getCategories/"+ menu_id + "/" + user_id,
      type: "GET",
      dataType:"json",
      success: function(response){
        let options = "";
        response.forEach(function(ele,index){
          options += "<option value='" + ele[0] + "'" + ">" +
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      ele[1]
                    </c:when>
                    <c:otherwise>
                      ele[2]
                    </c:otherwise>
                  </c:choose>
                  + "</option>";
        });
        document.getElementById("categories").innerHTML = options;
      }});
  }
</script>
</body>

</html>
