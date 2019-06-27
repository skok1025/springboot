<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page contentType="text/html;charset=UTF-8" %>
<% pageContext.setAttribute("newline", "\n");%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="guestbook-timeline">
				<h1>방명록</h1>
				<div id="form-container">
					<form id="add-form" action="${pageContext.servletContext.contextPath }/guestbook/addtimeline" method="post">
						<input type="text" name="name" id="input-name" placeholder="이름">
						<input type="password" name="password" id="input-password" placeholder="비밀번호">
						<textarea id="tx-content" name="contents" placeholder="내용을 입력해 주세요."></textarea>
						<input type="submit" value="보내기" />
					</form>
				</div>
				<hr>
				
				<ul id="list-guestbook">
					<c:set var='count' value='${fn:length(list)}'/>
					<c:forEach items='${list }' var='vo' varStatus="status">
					<li data-no='${vo.no}'>
						<div class="profile-box">
						<a href='${pageContext.servletContext.contextPath }/guestbook/delete/${vo.no}' data-no='${vo.no}'>삭제</a>
						</div>
						
						<div class="content-box">
							<strong>${vo.name }</strong>
							<p>
								${fn:replace(vo.contents,newline,"<br>") }
							</p>
						</div> 
					</li>
					</c:forEach>
					
					
									
				</ul>
			</div>
			<div id="dialog-delete-form" title="메세지 삭제" style="display:none">
  				<p class="validateTips normal">작성시 입력했던 비밀번호를 입력하세요.</p>
  				<p class="validateTips error" style="display:none">비밀번호가 틀립니다.</p>
  				<form>
 					<input type="password" id="password-delete" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" id="hidden-no" value="">
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  				</form>
			</div>
			<div id="dialog-message" title="" style="display:none">
  				<p></p>
			</div>						
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="guestbook-ajax"/>
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>