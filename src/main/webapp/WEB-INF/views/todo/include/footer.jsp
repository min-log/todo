<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal -->
<script type="text/javascript">
    //전달 받은 메시지가 존재 할 때 팝업
    <c:if test="${msg != null}">
    $(function () {
        $("#msgModal").modal("show");
        document.querySelector(".modal-body").innerHTML = "<p>${msg}</p>";
    });
    </c:if>
</script>
<div class="modal fade" id="msgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Message</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>



</body>
</html>