<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/todo.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <title>todo</title>

</head>
<body class="bg-body-tertiary">
<header class="p-3 pt-5 pb-5 text-bg-dark">
    <div class="container">
            <a href="/todo/register" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none logo">
                Todo
            </a>
            <ul class="nav mb-3">
                <li><a href="/todo/list" class="nav-link px-2 text-white">List</a></li>
                <li><a href="/todo/register" class="nav-link px-2 text-white">Register</a></li>
            </ul>
            <form action="/todo/list" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" id="headerSearch">
                <input type="hidden" name="size" value="${pageRequestDTO.size}">
                <div class="d-flex">
                    <input type="text" name="keyword" class="form-control form-control-dark text-bg-dark ms-2" placeholder="검색어를 입력하세요." >
                    <button type="submit" class="btn btn-primary ms-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search-heart-fill" viewBox="0 0 16 16">
                            <path d="M6.5 13a6.474 6.474 0 0 0 3.845-1.258h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.008 1.008 0 0 0-.115-.1A6.471 6.471 0 0 0 13 6.5 6.502 6.502 0 0 0 6.5 0a6.5 6.5 0 1 0 0 13Zm0-8.518c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
                        </svg>
                    </button>
                    <button type="reset" class="btn btn-secondary ms-2" title="다시 입력">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                            <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                        </svg>
                    </button>
                </div>
                <div class=" mt-2">
                    <input type="date" name="from" class="form-control" placeholder="시작일">
                    <input type="date" name="to" class="form-control ms-2" placeholder="종료일">
                    <label for="searchT" class="check_box ms-2">
                        <input type="checkbox" name="types" value="t" id="searchT">
                        <em class="icon_ck"></em> 제목
                    </label>
                    <label for="searchW" class="check_box ms-2">
                        <input type="checkbox" name="types" value="w" id="searchW">
                        <em class="icon_ck"></em> 작성자
                    </label>
                    <label for="searchF" class="check_box ms-2">
                        <input type="checkbox" name="finished" id="searchF">
                        <em class="icon_ck"></em> 완료 여부
                    </label>
                </div>
            </form>
            <%--                <div class="text-end">--%>
            <%--                    <button type="button" class="btn btn-outline-light me-2">Login</button>--%>
            <%--                    <button type="button" class="btn btn-warning">Sign-up</button>--%>
            <%--                </div>--%>

    </div>
</header>