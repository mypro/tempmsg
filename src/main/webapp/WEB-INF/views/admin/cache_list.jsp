<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
 <ol class="breadcrumb">
   <li><a href="cache/manager">缓存管理</a></li>
 </ol>
          <div class="row">
           <form id="cacheForm" action="cache/query" method="post">
             <div class="form-group col-xs-4">
               <input type="text" class="form-control" id="cacheKey" name="cacheKey" placeholder="缓存Key..." value="${cacheKey}">
             </div>
             <button type="submit" class="btn btn-primary">查询</button>
             <button type="button" id="removeBtn" class="btn btn-danger">清除</button>
           </form>
          </div>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>KEY</th>
                  <th>VALUE</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="item" varStatus="status" items="${data}">
                <tr>
                  <td>${status.index+1}</td>
                  <td>${item.key}</td>
                  <td>${item.value}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<jsp:include page="footer.jsp" />
<script type="text/javascript">
$("#removeBtn").click(function(){
	$("#cacheForm").attr("action","cache/remove").submit();
});
</script>