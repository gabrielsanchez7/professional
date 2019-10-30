<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../layouts/header.jsp"/>

<div id="home-page">
	<div class="banner">
		<img src="${pageContext.request.contextPath}/resources/images/banner.jpg"/>
	</div>
	<h1>Servicios destacados</h1>
	<section class="lista-ofertas">
		<c:forEach items="${ofertas}" var="oferta">
			<article class="oferta">
				<div class="head">
					<img class="avatar" src="${oferta.usuario.avatar}" alt="${oferta.usuario.nombre}"/>
					<div class="proff">
						<span class="label">Profesional</span>
						<p class="name">${oferta.usuario.nombre} ${oferta.usuario.apellidos}</p>
					</div>
				</div>
				<p class="desc">${oferta.descripcion}</p>
				<div class="fot">
					<div class="precio">
						<span class="label">Precio por hora</span>
						<p class="precio">S/ ${oferta.precioHora}</p>
					</div>
					<button class="btn btn-on">Ver detalle</button>
				</div>
			</article>
		</c:forEach>
	</section>
</div>