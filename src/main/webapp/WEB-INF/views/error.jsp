<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<!DOCTYPE html>

<html>
	<tags:pageTemplate title="Produto não encontrado!">
		<head>
		</head>
		<body>
		
			<section id="index-section" class="container middle">
				<h1>Ocorreu um erro!</h1>
				<h2>${ message }</h2>
			</section>
		
		</body>
	</tags:pageTemplate>
</html>

