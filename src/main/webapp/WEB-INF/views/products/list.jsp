
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Books and Stuff</title>
		<c:url value="/resources" var="cssPath"></c:url>
		<link rel="stylesheet" href="${ cssPath }/css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="${ cssPath }/css/bootstrap-3.3.7-dist/css/bootstrap-theme.css.map">
		<link rel="stylesheet" href="${ cssPath }/css/style.css">
		
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
			     	<ul class="nav navbar-nav navbar-right">
			     		<li>
			     			<a href="#">
			     				<security:authentication property="principal.username"/>
			     			</a>
			     		</li>
			     	</ul>
			    </div><!-- /.navbar-collapse -->
			 </div>
		</nav>
		
		<div class="container">
			<h1>Lista de Produtos</h1>
			<div>${ sucesso }</div>
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th>Titulo</th>
						<th>Descrição</th>
						<th>Preços</th>
						<th>Páginas</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ products }" var="product">
						<tr>
							<td><a
								href="${ s:mvcUrl('PC#detail').arg(0, product.id).build() }">${ product.title }</a>
							</td>
							<td>${ product.description }</td>
							<td class="price">
							<c:forEach items="${ product.prices }" var="price">
								<span>${ price.type } = ${ price.value }</span>
							</c:forEach>
							</td>
							<td>${ product.pages }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>