
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
	
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
		     	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="${ s:mvcUrl('HC#index').build() }">Casa do Código</a>
		    </div>
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		     	<ul class="nav navbar-nav">
		        	<li><a href="${ s:mvcUrl('PC#listProducts').build() }">Lista de Produtos</a></li>
		        	<li><a href="${ s:mvcUrl('PC#form').build() }">Cadastro de Produtos</a></li>
		     	</ul>
		    </div><!-- /.navbar-collapse -->
		 </div>
	</nav>
		
	<div class="container">	
	
		<h1>Cadastro de Produtos</h1>
		<form:form action="${s:mvcUrl('PC#save').build()}" cssClass="" 
					method="POST" commandName="product" enctype="multipart/form-data">
			<div class="form-group">
				<form:label path="title">Title</form:label>
				<form:input path="title"  cssClass="form-control"/>
				<span class="help-block"><form:errors path="title"></form:errors></span>
			</div>
			<div class="form-group">
				<form:label path="description">Description</form:label>
				<form:textarea rows="10" cols="20" path="description" cssClass="form-control"></form:textarea>
				<span class="help-block"><form:errors path="description"></form:errors></span>
			</div>
			<div class="form-group">
				<form:label path="pages">Pages</form:label>
				<form:input path="pages" cssClass="form-control"/>
				<span class="help-block"><form:errors path="pages"></form:errors></span>
			</div>
			<div class="form-group">
				<form:label path="releaseDate">Data de Lançamento</form:label>
				<form:input path="releaseDate" cssClass="form-control"/>
				<span class="help-block"><form:errors path="releaseDate"></form:errors></span>
			</div>
			
			<c:forEach items ="${ types }" var="priceType" varStatus="status">
				<div class="form-group">
					<form:label path="prices">${ priceType }</form:label>
					<form:input path="prices[${ status.index }].value" cssClass="form-control"/>
					<form:hidden path="prices[${ status.index }].type" value="${ priceType }" />
				</div>
			</c:forEach>
			
			<div class="form-group">
				<form:label path="sumaryPath"></form:label>
				<input name="sumary" type="file" class="form-control"></input>
				<span class="help-block"><form:errors path="sumaryPath"></form:errors></span>
			</div>
			
			<div class="form-group">
				<form:button type="submit" class="btn btn-primary">Send!</form:button>
			</div>
		</form:form>
	</div>
</body>
</html>