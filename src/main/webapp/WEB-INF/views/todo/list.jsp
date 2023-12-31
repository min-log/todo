<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:import url="include/header.jsp"/>
<section class="container mt-4 mb-4">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-0">todo list</h6>

    <c:forEach items="${responseDTO.dtoList}" var="dto">
        <div class="item d-flex text-body-secondary pt-3">
            <a href="/todo/finished?tno=${dto.tno}" class="btn_finished
                <c:if test="${dto.finished == true}"> active</c:if> ">
            </a>
            <div class="item-con pb-3 mb-0 small lh-sm border-bottom">
                <p class="title">
                    <a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}">
                    ${dto.title}
                    </a>
                </p>
                <p class="flex_between">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week" viewBox="0 0 16 16">
                          <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
                          <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                        </svg>
                        ${dto.dueDate}
                    </span>
                    <span class="text-gray-dark">@ ${dto.writer}</span>
                </p>

            </div>
        </div>
    </c:forEach>

        <div class="float-end mt-4">
            <ul class="pagination flex-wrap">
                <c:if test="${responseDTO.prev}">
                    <li class="page-item">
                        <a class="page-link" data-num="${responseDTO.start -1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                    <li class="page-item">
                        <a class="page-link" data-num="${num}" >${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${responseDTO.next}">
                    <li class="page-item">
                        <a class="page-link"  data-num="${responseDTO.end + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>


</section>


<script>


    document.querySelector(".pagination").addEventListener("click", function (e) {
        e.preventDefault()
        e.stopPropagation()

        const target = e.target


        if(target.tagName !== 'A') {
            return
        }
        const num = target.getAttribute("data-num")

        self.location = `/todo/list?page=\${num}` //백틱(` `)을 이용해서 템플릿 처리
    },false)


</script>

<c:import url="include/footer.jsp"></c:import>