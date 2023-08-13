<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:import url="include/header.jsp"/>
<section class="container mt-4 mb-4">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-4">todo</h6>
        <div class="read_con">
            <p class="flex_between color_gray">
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week" viewBox="0 0 16 16">
                      <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
                      <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                    </svg>
                    ${dto.dueDate}
                </span>
                <span>@ ${dto.writer}</span>
            </p>
            <div class="flex_between mb-4">
                <p class="title m-0">
                    ${dto.title}
                </p>
                <a href="javascript:btnFinished(${dto.tno})" class="btn_finished
                    <c:if test="${dto.finished == true}"> active</c:if> ">
                </a>
            </div>
        </div>
        <div class="mb-3">
            <div class="float-end">
                <button onclick="location.href='/todo/remove?tno=${dto.tno}'" type="submit" class="btn btn-primary">Remove</button>
                <button onclick="location.href='/todo/modify?tno=${dto.tno}'" type="reset" class="btn btn-secondary">modify</button>
            </div>
        </div>
    </div>
    <script>
        function btnFinished(e){

            console.log(e);
            $.ajax({
                url:'/api/finished?tno='+e,
                type:'get',
                dataType:'json',
                async:false,
                data : {tno: e},
                success:function(data){
                    console.log("success")
                    console.log("response : "+data);

                },
                error:function(data){
                    console.log(data);
                }
            });
        }
    </script>

</section>
<c:import url="include/footer.jsp"></c:import>