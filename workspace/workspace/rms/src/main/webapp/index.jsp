<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="includes/partial/header.jsp" />

<div class="imageBanner-image container">
<div id="myCarousel" class="carousel slide" data-ride="carousel"  >


  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  <c:set var="count" value="0" scope="page" />
  <c:forEach var="imageBanner" items="${imageBanners}">
  
  <c:if test="${ count == 0 }">
    <div class="item active">
     <img src= "${pageContext.request.contextPath}/banners/${ imageBanner.id }"style="float:center;  width: 100%; height: 100%">
      <c:set var="count" value="${count + 1}" scope="page"/>
    </div>
     </c:if>
  <c:if test="${ count > 0 }">  
   <div class="item">
      <img src="${pageContext.request.contextPath}/banners/${ imageBanner.id }" style="float:center; width: 100%; height: 100%" >
      <c:set var="count" value="${count + 1}" scope="page"/>
    </div>
  </c:if>
  
  </c:forEach>
  </div>


</div>

</div>

<jsp:include page="includes/partial/footer.jsp" />

