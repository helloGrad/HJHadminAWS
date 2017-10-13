<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class=" w3-col m2 l2">
        <div class=" w3-card-2 w3-white sidebar">
            <h5 class="w3-center w3-padding-16 " style="letter-spacing: 0.3em;"><strong>모집공고 관리</strong></h5>
            <ul class="w3-ul w3-center w3-text-grey" style="letter-spacing: 0.1em;">
                <li><a href="">대학원 </a></li>
                <li><a href="">연구실 </a></li>
            </ul>

            <h5 class="w3-center w3-padding-16" style="letter-spacing: 0.3em;"><strong>기관 관리</strong></h5>
            <ul class="w3-ul w3-center w3-text-grey" style="letter-spacing: 0.1em;">
             <li><a href="${pageContext.servletContext.contextPath }/organz/unlist">대학교 </a></li>
              <li><a href="${pageContext.servletContext.contextPath }/organz/gradlist">대학원 </a></li>
              <li><a href="${pageContext.servletContext.contextPath }/organz/deptlist">학부/학과 </a></li>
              <li><a href="${pageContext.servletContext.contextPath }/organz/lablist">연구실 </a></li>
            </ul>


            <Br>
        </div>
    </div>
</body>
</html>