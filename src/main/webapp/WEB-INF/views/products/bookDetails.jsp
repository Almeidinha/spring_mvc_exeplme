<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<!DOCTYPE html>
<c:url value="/" var="contextPath" />
<html>
	<tags:pageTemplate title="Detalhes do Livro">
	<head>
	</head>
	<body>
		<article id="livro-css-eficiente">
			<header id="product-highlight" class="clearfix">
				<div id="product-overview" class="container">
					<img width="280px" height="395px" src="${ contextPath.concat(product.sumaryPath) }"
						class="product-featured-image" />
					<h1 class="product-title">${ product.title }</h1>
					<p class="product-author">
						<span class="product-author-link"> </span>
					</p>
					<p class="book-description">${ product.description }</p>
				</div>
			</header>
	
			<section class="buy-options clearfix">
				<form:form servletRelativeAction="/shopCart/add" method="post" cssClass="container">
					<input type="hidden" value="${ product.id }" name="productId" >
					<ul id="variants" class="clearfix">
						<c:forEach items="${ product.prices }" var="prices">
							<li class="buy-option">
								<input type="radio" name="priceType" class="variant-radio" id="priceType" value="${ prices.type }" checked="checked" /> 
								<label class="variant-label" >${ prices.type }</label> 
								<small class="compare-at-price">R$ 39,90</small>
								<p class="variant-price">${ prices.value }</p>
							</li>
						</c:forEach>
					</ul>
					<button type="submit" class="submit-image icon-basket-alt" alt="Compre Agora" title="Compre Agora ${product.title }"></button>				
				</form:form>
			</section>
	
			<div class="container">
				<section class="summary">
					<ul>
						<li>
							<h3>E muito mais... <a href='#'>veja o sumário</a>.</h3>
						</li>
					</ul>
				</section>
	
				<section class="data product-detail">
					<h2 class="section-title">Dados do livro:</h2>
					<p>
						Número de páginas: <span>${product.pages}</span>
					</p>
					<p></p>
					<p>Data de publicação: 
						<fmt:formatDate pattern="dd/MM/yyyy" value="${product.releaseDate.time }"/>
					</p>
					<p>
						Encontrou um erro? <a href='#' target='_blank'>Submeta uma errata</a>
					</p>
				</section>
			</div>
		</article>
		
	</body>
	</tags:pageTemplate>
</html>