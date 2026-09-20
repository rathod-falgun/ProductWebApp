<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="./base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="bg-light d-flex h-100 text-center align-items-center justify-content-center" style="min-height: 100vh;">

    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column justify-content-center" style="max-width: 42em;">
        <main class="px-3">
            <h1 class="display-4 fw-bold mb-4">Welcome to Our Website</h1>
            <p class="lead mb-4">We are glad you are here. Explore our platform and discover what we can do for you.</p>
            <p class="lead">
                <a href="<c:url value='/dashboard'/>" class="btn btn-lg btn-primary fw-bold border-white bg-primary">Go to DashBoard</a>
                <a href="<c:url value='/addProduct'/>" class="btn btn-lg btn-primary fw-bold border-white bg-primary">Add Product</a>
            </p>
        </main>
    </div>
</body>
</html>
