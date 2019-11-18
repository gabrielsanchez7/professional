<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../layouts/header.jsp"/>

<div id="home-page">
	<div class="banner">
		<img src="${pageContext.request.contextPath}/resources/images/banner.jpg"/>
	</div>
	<h1>Servicios destacados</h1>
	<div class="container">
		<div class="filtros">
			<div class="filtro-especialidad">
				<p>Filtrar por especialidad</p>
				<c:forEach items="${especialidades}" var="especialidad">
					<label>
						<input class="ipt-filtro" name="especialidad" type="radio" value="${especialidad.idEspecialidad}"/>
						<span>${especialidad.descripcion}</span>
					</label>
				</c:forEach>
				<button type="button" class="btn btn-on limpiar">Limpiar</button>
			</div>
			<div class="filtro-precio">
				<p>Filtrar por precio</p>
				<div>
					<input type="text" id="menor-precio" placeholder="Menor precio"/>
					<span>-</span>
					<input type="text" id="mayor-precio" placeholder="Mayor precio"/>
				</div>
				<button type="button" class="btn btn-on aplicar-precio">Aplicar</button>
			</div>
		</div>
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
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('.ipt-filtro').click(function(ev){
		var t = $(ev.target);
		var id = t.val();
		var data = {idEspecialidad: id};
		getOfertas(data);
	});

	$('.limpiar').click(function(){
		$('input:radio').removeAttr('checked');
		getOfertas(0);
	});

	$('.aplicar-precio').click(function(){
		var menor = $('#menor-precio').val();
		var mayor = $('#mayor-precio').val();
		var data = {menorPrecio: menor, mayorPrecio: mayor};
		$('input:radio').removeAttr('checked');
		getOfertas(data);
	});

	function getOfertas(data){
		$.getJSON('oferta/lista-ofertas', data, function(data){
			$('.lista-ofertas').html('');
			$.each(data, function(index, value){
				drawOferta(value);
			});
		});
	}
	
	function drawOferta(data){
		var html = '<article class="oferta">' +
			'<div class="head">' +
				'<img class="avatar" src="' + data.usuario.avatar + '" alt="' + data.usuario.nombre + '"/>' +
				'<div class="proff">' +
					'<span class="label">Profesional</span>' +
					'<p class="name">' + data.usuario.nombre + ' ' + data.usuario.apellidos + '</p>' +
				'</div>' +
			'</div>' +
			'<p class="desc">' + data.descripcion + '</p>' +
			'<div class="fot">' +
				'<div class="precio">' +
					'<span class="label">Precio por hora</span>' +
					'<p class="precio">S/ ' + data.precioHora + '</p>' +
				'</div>' +
				'<button class="btn btn-on">Ver detalle</button>' +
			'</div>' +
		'</article>';
		$('.lista-ofertas').append(html);
	}
});
</script>