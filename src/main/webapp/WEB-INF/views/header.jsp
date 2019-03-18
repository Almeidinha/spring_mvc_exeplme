
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

	<body>
	
		<header id="layout-header">
			<div class="clearfix container">
				<a href="${ s:mvcUrl('HC#index').build() }" id="logo"> </a>
				<div id="header-content">
					<nav id="main-nav">
	
						<ul class="clearfix">
							<li>
								<a href="${ s:mvcUrl('SCC#itens').build() }" rel="nofollow">
									<fmt:message key="menu.cart">
										<fmt:param  value="${ shopCart.amount }" />
									</fmt:message>
									<!--<s:message code="menu.cart" arguments="${ shopCart.amount }"></s:message>-->
								</a>
							</li>
							<li>
								<a href="#" rel="nofollow">
									<fmt:message key="menu.about" />
								</a>
							</li>
							<li>
								<a href="?locale=pt" rel="nofollow">
									<fmt:message key="menu.pt" />
								</a>
							</li>
							<li>
								<a href="?locale=en_US" rel="nofollow">
									<fmt:message key="menu.en" />
								</a>
							</li>
							<!-- <li>
								<a href="/pages/perguntas-frequentes" rel="nofollow">
									<fmt:message key="menu.questions" />
								</a>
							</li>  -->
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<nav class="categories-nav">
			<ul class="container">
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.home" /></a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.agile" /> </a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.front_end" /></a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.games" /></a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.java" /></a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.mobile" /></a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.web" /></a></li>
				<li class="category"><a href="#"><fmt:message key="navegation.categoty.others" /></a></li>
			</ul>
		</nav>
	</body>
</html>