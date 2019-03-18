
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/" var="contextPath" />
	<c:url value="/resources" var="cssPath"></c:url>
	<meta charset="UTF-8">
	<title>Books and Stuff</title>
	<link rel="stylesheet" href="${ cssPath }/css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ cssPath }/css/bootstrap-3.3.7-dist/css/bootstrap-theme.css.map">
	
	<script type="text/javascript" src="${ cssPath }/js/jquery.min.js"></script>					
	<script type="text/javascript" src="${ cssPath }/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
		
	<div class="container">	
	
		<h1>Log In</h1>
		<form:form servletRelativeAction="/login" cssClass="" method="POST">
			
			<div class="form-group">
				<label for="username">Nome Usuário</label>
				<input name="username" type="text" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="password">Senha</label>
				<input name="password" type="password" class="form-control" />
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Logar</button>
			</div>
		</form:form>
	</div>
</body>
</html>