<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../layouts/header.jsp"/>

<div id="reservas-page">
	<h1>Mis reservas</h1>
	<section>
		<c:forEach items="${reservas}" var="reserva">
			<article>
				<p>Id reserva: ${reserva.idReserva}</p>
				<p>Profesional contratado: ${reserva.usuario.nombre} ${reserva.usuario.apellidos}</p>
				<p>Reserva para el: ${reserva.fecha}</p>
				<p>Direccion: ${reserva.direccion}</p>
				<p>Precio final: S/ ${reserva.precio}</p>
			</article>
		</c:forEach>
	</section>
</div>