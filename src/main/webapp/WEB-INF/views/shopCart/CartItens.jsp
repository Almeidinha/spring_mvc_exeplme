<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="contextPath" />
<title>- Casa do Código</title>
</head>
<body>
	<tags:pageTemplate title="Livros de Java, Android, IOS e muito mais!">
		
		<jsp:attribute name="extraScripts">
			<script>
				$(function() {
					$("#checkout").click(functiob() {
						_gap.push(['trackPageview', '/checkout/finalize']);
					});

					$(".book-suggest").click(function() {
						var book = $(this).data('book');
						_gap.push(['_trackEvent', 'Recomendação', 'Livro', book]);
					});
				});
			</script>
		</jsp:attribute>
		
		<jsp:body>
			<section class="container middle">
				<h2 id="cart-title">Seu carrinho de compras</h2>
				<table id="cart-table">
					<colgroup>
						<col class="item-col" />
						<col class="item-price-col" />
						<col class="item-quantity-col" />
						<col class="line-price-col" />
						<col class="delete-col" />
					</colgroup>
					<thead>
						<tr>
							<th class="cart-img-col"></th>
							<th width="65%">Item</th>
							<th width="10%">Preço</th>
							<th width="10%">Quantidade</th>
							<th width="10%">Total</th>
							<th width="5%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ shopCart.itens }" var="item">
							<tr>
								<td class="cart-img-col"><img
									src="${contextPath.concat('/').concat(item.product.sumaryPath) }"
									width="71px" height="100px" /></td>
								<td class="item-title">${ item.product.title }</td>
								<td class="numeric-cell">${ item.price }</td>
								<td class="quantity-input-cell"><input type="number" min="0"
									id="quantidade" name="quantidade"
									value="${ shopCart.getAmount(item) }" /></td>
								<td class="numeric-cell">${ shopCart.getTotal(item) }</td>
								<td class="remove-item">
									<form:form
										 action="${ s:mvcUrl('SCC#remove').arg(0, item.product.id).arg(1, item.priceType).build() }"
										 method="POST">
										<input type="image"
											src="${contextPath }/resources/imagens/excluir.png"
											alt="Excluir" title="Excluir" />
									</form:form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<form:form action="${ s:mvcUrl('PC#finalize').build() }" method="POST">
							<td colspan="3"><input type="submit" class="checkout" id="checkout"
								name="checkout" value="Finalizar compra" /></td>
							</form:form>
							<td class="numeric-cell">${ shopCart.total }</td>
							<td></td>
						</tr>
					</tfoot>
				</table>
	
				<h2>Você já conhece os outros livros da Casa do Código?</h2>
				<ul id="collection" class="related-books">
					<li class="col-left"><a href="#"
						class="block clearfix book-suggest"
						data-book="PL/SQL: Domine a linguagem do banco de dados Oracle">
							<img width="113px" height="160px"
							src="http:////cdn.shopify.com/s/files/1/0155/7645/products/plsql-featured_compact.png?v=1434740236"
							alt="PL/SQL: Domine a linguagem do banco de dados Oracle" />
					</a></li>
				</ul>
	
				<h2>
					<a href="#">Veja todos os livros que
						publicamos!</a>
				</h2>
			</section>
	
			<footer id="layout-footer">
				<div class="clearfix container">
					<div id="collections-footer">
						<!-- cdc-footer -->
						<p class="footer-title">Coleções de Programação</p>
						<ul class="footer-text-links">
							<li><a href="/collections/livros-de-java">Java</a></li>
							<li><a href="/collections/livros-desenvolvimento-web">Desenvolvimento
									Web</a></li>
							<li><a href="/collections/livros-de-mobile">Mobile</a></li>
							<li><a href="/collections/games">Games</a></li>
							<li><a href="/collections/livros-de-front-end">Front End</a></li>
						</ul>
						<p class="footer-title">Outros Assuntos</p>
						<ul class="footer-text-links">
							<li><a href="/collections/livros-de-agile">Agile</a></li>
							<li><a href="/collections/outros">e outros...</a></li>
						</ul>
					</div>
					<div id="social-footer">
						<!-- books-footer -->
						<p class="footer-title">Links da Casa do Código</p>
						<ul class="footer-text-links">
							<li><a href="http://livros.casadocodigo.com.br"
								rel="nofollow">Meus E-books</a></li>
							<li><a href="/pages/sobre-a-casa-do-codigo">Sobre a Casa
									do Código</a></li>
							<li><a href="/pages/perguntas-frequentes">Perguntas
									Frequentes</a></li>
							<li><a href="https://www.caelum.com.br">Caelum - Ensino e
									Inovação</a></li>
							<li><a href="http://www.codecrushing.com/" rel="nofollow">Code
									Crushing</a></li>
							<li><a
								href="http://www.casadocodigo.com.br/pages/politica-de-privacidade"
								rel="nofollow">Política de Privacidade</a></li>
						</ul>
						<p class="footer-title">Redes Sociais</p>
						<ul>
							<li class="social-links"><a
								href="http://www.twitter.com/casadocodigo" target="_blank"
								id="twitter" rel="nofollow">Facebook</a> <a
								href="http://www.facebook.com/casadocodigo" target="_blank"
								id="facebook" rel="nofollow">Twitter</a></li>
						</ul>
					</div>
					<div id="newsletter-footer">
						<!-- social-footer -->
						<p class="footer-title">Receba as Novidades e Lançamentos</p>
						<div id="form-newsletter">
							<form action="" method="POST" id="ss-form" class="form-newsletter">
								<ul>
									<li><input type="hidden" name="pageNumber" value="0" /><input
										type="hidden" name="backupCache" value="" /><input
										type="email" name="entry.0.single" value="" class="ss-q-short"
										id="entry_0" placeholder="seu@email.com" /></li>
									<li><input type="submit" name="submit"
										value="Quero Receber!" id="submit-newsletter" /></li>
								</ul>
							</form>
							<ul>
								<li class="ie8"><a href="" rel="nofollow">Receba as
										Novidades e Lançamentos</a></li>
							</ul>
						</div>
						<ul class="footer-payments">
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</footer>
		</jsp:body>
	</tags:pageTemplate>
</body>
</html>