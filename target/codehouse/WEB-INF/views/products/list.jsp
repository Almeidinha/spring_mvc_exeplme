<%@page import="org.webjars.WebJarAssetLocator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Books and Stuff</title>
	
	 <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>

	<h1>Lista de Produtos</h1>
	<table class="table">
		<thead>
			<tr>
				<td>Titulo</td>
				<td>Descrição</td>
				<td>Páginas</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ products }" var="product">
				<tr>
					<td>${ product.title }</td>
					<td>${ product.description }</td>
					<td>${ product.pages }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>