<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:import url="include/header.jsp"/>
<section class="container mt-4 mb-4">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-4">todo modify</h6>
        <form method="post" action="/todo/modify">
            <input type="text" value="${dto.tno}" name="tno" hidden>
            <div class="row mb-3">
                <label for="title" class="col-sm-2 col-form-label">title</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" id="title" placeholder="title" value="${dto.title}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="dueDate">date</label>
                <div class="col-sm-10">
                    <input type="date" name="dueDate" id="dueDate" class="form-control" placeholder="date" value="${dto.dueDate}">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="writer">writer</label>
                <div class="col-sm-10">
                    <input type="text" name="writer" id="writer" class="form-control" placeholder="writer" value="${dto.writer}" readonly />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="writer">finished</label>


                <div class="col-sm-10">
                    <label for="finished" class="check_box ms-2">
                        <input type="checkbox" name="finished" id="finished" ${dto.finished?"checked":""}>
                        <em class="icon_ck"></em> 완료 여부
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <div class="float-end">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </div>
        </form>
    </div>
</section>

<script type="text/javascript">
    //에러 메시지 팝업 출력
    $(function () {

        <c:forEach items="${errors}" var="error">

        $("#msgModal").modal("show");
        document.querySelector(".modal-body").innerHTML ="<p> ${error.defaultMessage} </p>";

        </c:forEach>

    });

</script>
<c:import url="include/footer.jsp"></c:import>