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

  <title>Menu In Minutes</title>
</head>

<body data-spy="scroll" data-target="#main-nav" id="home">

<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" id="main-nav">
  <div class="container">
    <a href="/" class="navbar-brand">MiM</a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a href="#home" class="nav-link">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                Home
              </c:when>
              <c:otherwise>
                الرئيسية
              </c:otherwise>
            </c:choose>
          </a>
        </li>
        <li class="nav-item">
          <a href="#whyus-head-section" class="nav-link">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                WhyUs
              </c:when>
              <c:otherwise>
                لماذا نحن
              </c:otherwise>
            </c:choose>
          </a>
        </li>
        <li class="nav-item">
          <a href="#dashboard-section" class="nav-link">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                Features
              </c:when>
              <c:otherwise>
                الخصائص
              </c:otherwise>
            </c:choose>
          </a>
        </li>
        <li class="nav-item">
          <a href="#our_menus" class="nav-link">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                Menus Happy with us
              </c:when>
              <c:otherwise>
                قوائم طعام سعيدة معنا
              </c:otherwise>
            </c:choose>
          </a>
        </li>
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
            <a href="/language/home/en" class="dropdown-item">English</a>
            <a href="/language/home/ar" class="dropdown-item">العربية</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- HOME SECTION -->
<header id="home-section">
  <div class="dark-overlay">
    <div class="home-inner container">
      <div class="row">
        <div class="col-lg-8 d-none d-lg-block">
          <h1 class="display-4">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                Create <strong>Your Menu</strong> and increase your <strong>revenue</strong>
              </c:when>
              <c:otherwise>
                انشئ قائمة طعامك و زد من أرباحك!
              </c:otherwise>
            </c:choose>
          </h1>
          <div class="d-flex">
            <div class="p-4 align-self-start">
              <i class="fas fa-check fa-2x"></i>
            </div>
            <div class="p-4 align-self-end">
              <c:choose>
                <c:when test="${lang.equalsIgnoreCase('en')}">
                 Open an account if you don't have one otherwise login just login
                </c:when>
                <c:otherwise>
                  قم بفتح حساب إذا لم يكن لديك أو قم بتسجيل الدخول
                </c:otherwise>
              </c:choose>
            </div>
          </div>

          <div class="d-flex">
            <div class="p-4 align-self-start">
              <i class="fas fa-check fa-2x"></i>
            </div>
            <div class="p-4 align-self-end">
              <c:choose>
                <c:when test="${lang.equalsIgnoreCase('en')}">
                  Move to your dashboard by clicking on - <strong>Dashboard Button</strong> -
                </c:when>
                <c:otherwise>
                  انتقل الى لوحة التحكم بالضغط على - <strong> زر لوحة التحكم - </strong>
                </c:otherwise>
              </c:choose>
            </div>
          </div>

          <div class="d-flex">
            <div class="p-4 align-self-start">
              <i class="fas fa-check fa-2x"></i>
            </div>
            <div class="p-4 align-self-end">
              <c:choose>
                <c:when test="${lang.equalsIgnoreCase('en')}">
                  Create your menu and add your categories and your items !
                </c:when>
                <c:otherwise>
                  انشئ قائمة طعامك وقم باضافة التصنيفات والمنتجات !
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>

        <div class="col-lg-4">
          <c:choose>
            <c:when test="${loggedin}">
              <div style="margin-top:100px;" class="card card-form">
                <div class="card-body text-center">
                  <c:choose>
                    <c:when test="${lang.equalsIgnoreCase('en')}">
                      <a href="/dashboard" class="btn btn-block btn-dark text-white">Dashboard</a>
                    </c:when>
                    <c:otherwise>
                      <a href="/dashboard" class="btn btn-block btn-dark text-white">لوحة التحكم</a>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="card card-form">
                <c:choose>
                  <c:when test="${login}">
                    <div class="card-body">

                      <h3 class="text-center">
                        <c:choose>
                          <c:when test="${lang.equalsIgnoreCase('en')}">
                            Login
                          </c:when>
                          <c:otherwise>
                            تسجيل دخول
                          </c:otherwise>
                        </c:choose>
                      </h3>
                      <form:form action="/login" method="post" modelAttribute="login_form">
                        <div class="form-group">
                          <label for="email" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                            <c:choose>
                              <c:when test="${lang.equalsIgnoreCase('en')}">
                                Email
                              </c:when>
                              <c:otherwise>
                                البريد الالكتروني
                              </c:otherwise>
                            </c:choose>
                          </label>
                          <form:input path="email" type="email" class="form-control form-control-lg"/>
                        </div>
                        <div class="form-group">
                          <label for="password" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                            <c:choose>
                              <c:when test="${lang.equalsIgnoreCase('en')}">
                                Password
                              </c:when>
                              <c:otherwise>
                                كلمة المرور
                              </c:otherwise>
                            </c:choose>
                          </label>
                          <form:input path="password" type="password" class="form-control form-control-lg"/>
                        </div>
                        <button type="submit" class="btn btn-outline-light btn-block mb-3">
                          <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                              Login
                            </c:when>
                            <c:otherwise>
                              دخول
                            </c:otherwise>
                          </c:choose>
                        </button>
                        <div class="text-center">
                          <a class="text-white" href="/home/register">
                            <c:choose>
                              <c:when test="${lang.equalsIgnoreCase('en')}">
                                Create an account
                              </c:when>
                              <c:otherwise>
                                تسجيل حساب جديد
                              </c:otherwise>
                            </c:choose>
                          </a>
                        </div>
                      </form:form>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="card-body">
                      <h3 class="text-center">
                        <c:choose>
                          <c:when test="${lang.equalsIgnoreCase('en')}">
                            Sign Up Today
                          </c:when>
                          <c:otherwise>
                            سجل حسابك اليوم
                          </c:otherwise>
                        </c:choose>
                      </h3>
                      <form:form action="/register" method="post" modelAttribute="register_form">
                        <div class="row">
                          <div class="col-6">
                            <div class="form-group">
                              <label for="firstName" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                                <c:choose>
                                  <c:when test="${lang.equalsIgnoreCase('en')}">
                                    First Name
                                  </c:when>
                                  <c:otherwise>
                                    الاسم الاول
                                  </c:otherwise>
                                </c:choose>
                              </label>
                              <form:input path="firstName" type="text" class="form-control form-control-lg" />
                            </div>
                          </div>
                          <div class="col-6">
                            <div class="form-group">
                              <label for="lastName" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                                <c:choose>
                                  <c:when test="${lang.equalsIgnoreCase('en')}">
                                    Last Name
                                  </c:when>
                                  <c:otherwise>
                                    الاسم الاخير
                                  </c:otherwise>
                                </c:choose>
                              </label>
                              <form:input path="lastName" type="text" class="form-control form-control-lg"/>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="email" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                            <c:choose>
                              <c:when test="${lang.equalsIgnoreCase('en')}">
                                Email
                              </c:when>
                              <c:otherwise>
                                البريد الالكتروني
                              </c:otherwise>
                            </c:choose>
                          </label>
                          <form:input path="email" type="email" class="form-control form-control-lg" />
                        </div>
                        <div class="row">
                          <div class="col-6">
                            <div class="form-group">
                              <label for="password" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                                <c:choose>
                                  <c:when test="${lang.equalsIgnoreCase('en')}">
                                    Password
                                  </c:when>
                                  <c:otherwise>
                                    كلمة المرور
                                  </c:otherwise>
                                </c:choose>
                              </label>
                              <form:input path="password" type="password" class="form-control form-control-lg"/>
                            </div>
                          </div>
                          <div class="col-6">
                            <div class="form-group">
                              <label for="confirm_password" class="<c:if test="${lang.equalsIgnoreCase('ar')}"> float-right </c:if>">
                                <c:choose>
                                  <c:when test="${lang.equalsIgnoreCase('en')}">
                                    Confirm Password
                                  </c:when>
                                  <c:otherwise>
                                    تأكيد كلمة المرور
                                  </c:otherwise>
                                </c:choose>
                              </label>
                              <form:input path="confirm_password" type="password" class="form-control form-control-lg" />
                            </div>
                          </div>
                        </div>
                        <button type="submit" class="btn btn-outline-light btn-block mb-3" >
                          <c:choose>
                            <c:when test="${lang.equalsIgnoreCase('en')}">
                              Register
                            </c:when>
                            <c:otherwise>
                              تسجيل
                            </c:otherwise>
                          </c:choose>
                        </button>
                        <div class="text-center">
                          <a class="text-white text-center" href="/home/login">
                            <c:choose>
                              <c:when test="${lang.equalsIgnoreCase('en')}">
                                Have an account? Login
                              </c:when>
                              <c:otherwise>
                                لديك حساب؟ سجل دخول
                              </c:otherwise>
                            </c:choose>
                          </a>
                        </div>
                      </form:form>
                    </div>
                  </c:otherwise>
                </c:choose>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>
</header>


<!-- Why US HEAD -->
<section id="whyus-head-section">
  <div class="container">
    <div class="row">
      <div class="col text-center py-5">
        <h1 class="display-4">
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Why us?
            </c:when>
            <c:otherwise>
              لماذا نحن؟
            </c:otherwise>
          </c:choose>
        </h1>
        <p class="lead">
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              We aim to reduce your workload by allowing you to create a simple and appealing menu for your customers in minutes.
            </c:when>
            <c:otherwise>
              نهدف إلى تقليل عبء العمل الخاص بك من خلال السماح لك بإنشاء قائمة بسيطة وجذابة لعملائك في دقائق.
            </c:otherwise>
          </c:choose>
        </p>
      </div>
    </div>
  </div>
</section>

<!-- EXPLORE SECTION -->
<section id="dashboard-section" class="bg-light text-muted py-5">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <img src="imgs/dashboard2-section.jpg" alt="" class="img-fluid mb-3 rounded-circle">
      </div>
      <div class="col-md-6">
        <h3 class="pt-5">
          <c:choose>
            <c:when test="${lang.equalsIgnoreCase('en')}">
              Control Panel & Creation
            </c:when>
            <c:otherwise>
              لوحة التحكم & الانشاء
            </c:otherwise>
          </c:choose>
        </h3>
        <p>
          <c:choose>
          <c:when test="${lang.equalsIgnoreCase('en')}">
            The control panel has been carefully designed to achieve all the necessary requirements without any complexity or difficulty
          </c:when>
          <c:otherwise>
            تم تصميم لوحة التحكم بعناية حتى تحقق جميع المتطلبات اللازمة دون أي تعقيد او صعوبة
          </c:otherwise>
        </c:choose>
        </p>
        <div class="d-flex">
          <div class="p-4 align-self-start">
            <i class="fas fa-check fa-2x"></i>
          </div>
          <div class="p-4 align-self-end">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                You can create a menu with your own logo and your brand name easily and in addition to that, select your own background yourself!
              </c:when>
              <c:otherwise>
                تستطيع إنشاء قائمة طعام تحمل شعارك الخاص واسم الماركة الخاصة بك بسهولة واضافة على ذلك حدد خلفيتك الخاصة بنفسك !
              </c:otherwise>
            </c:choose>
          </div>
        </div>

        <div class="d-flex">
          <div class="p-4 align-self-start">
            <i class="fas fa-check fa-2x"></i>
          </div>
          <div class="p-4 align-self-end">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                Create special categories for each menu you have if you want to make browsing easier to show products
              </c:when>
              <c:otherwise>
                إنشاء تصنيفات خاصة لكل قائمة طعام لديك إذا اردت حتى تجعل التصفح اسهل في اظهار المنتجات
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="d-flex">
          <div class="p-4 align-self-start">
            <i class="fas fa-check fa-2x"></i>
          </div>
          <div class="p-4 align-self-end">
            <c:choose>
              <c:when test="${lang.equalsIgnoreCase('en')}">
                Add products and images and select special offers in the product and link them in any category
              </c:when>
              <c:otherwise>
                إضافة المنتجات والصور وتحديد العروض الخاصة في بالمنتج وربطها في أي تصنيف
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="our_menus">
  <div class="container text-center">
    <div class="row p-5">
      <c:forEach var="menu" items="${menus}">
        <div class="col-md-4 d-none d-md-inline-block">
          <div class="card menus text-center">
            <div class="card-body">
              <img src="${menu.brandLogo}" width="100px" height="100px" class="mb-3">
              <h5>${menu.brandName_en}</h5>
              <h5>${menu.brandName_ar}</h5>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>



<!-- FOOTER -->
<footer id="main-footer" class="bg-dark">
  <div class="container">
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
</script>
</body>

</html>