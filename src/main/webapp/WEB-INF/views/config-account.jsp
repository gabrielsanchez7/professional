<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../layouts/header.jsp"/>

<div id="config-account-page">
	<a class="omit" href="#">Omitir</a>
	<h1>Configuraci&oacute;n de cuenta</h1>
	<div class="content-forms">
		<ul class="config-menu">
			<li class="change-config active" data-option="personal"><i class="fas fa-user"></i>Informaci&oacute;n personal</li>
			<li class="change-config" data-option="interest"><i class="fas fa-briefcase"></i>&Aacute;reas de inter&eacute;s</li>
			<li class="change-config" data-option="password"><i class="fas fa-key"></i>Contrase&ntilde;a</li>
			<li class="change-config" data-option="cards"><i class="fas fa-dollar-sign"></i>Tarjetas</li>
			<li class="change-config" data-option="security"><i class="fas fa-shield-alt"></i>Seguridad</li>
			<li class="divider"></li>
			<c:if test="${usuario.rol != 'proff'}">
				<li class="change-config" data-option="work"><i class="fas fa-briefcase"></i>Quiero trabajar</li>
			</c:if>
			<c:if test="${usuario.rol == 'proff'}">
				<li class="change-config" data-option="working"><i class="fas fa-briefcase"></i>Mis ofertas de trabajo</li>
			</c:if>
		</ul>
		<div class="form active" id="personal-info" data-form="personal">
			<h2>Informaci&oacute;n general</h2>
			<div>
				<div class="avatar">
					<c:choose>
						<c:when test="${usuario.avatar}"><img src="${pageContext.request.contextPath}/resources/images/male-icon.png" alt="User avatar"/></c:when>
						<c:otherwise><img src="${usuario.avatar}" alt="User avatar"/></c:otherwise>
					</c:choose>
					
					<div class="choose-photo">
						<span><i class="fas fa-paperclip"></i>Elegir una foto</span>
					</div>
				</div>
				<div class="fields">
					<label>
						<input value="${usuario.nombre}" type="text" id="name" autocomplete="off" data-validate="false" data-message="Ingrese un nombre v&aacute;lido" data-type="name"/>
						<span class="placeholder">Nombre</span>
						<i class="fas fa-user"></i>
					</label>
					<label>
						<input value="${usuario.apellidos}" type="text" id="surname" autocomplete="off" data-validate="false" data-message="Ingrese apellidos v&aacute;lidos" data-type="name"/>
						<span class="placeholder">Apellidos</span>
						<i class="far fa-user"></i>
					</label>
					<label>
						<input value="${usuario.email}" type="text" id="email" autocomplete="off" data-validate="false" data-message="Ingrese un correo electr&oacute;nico v&aacute;lido" data-type="email"/>
						<span class="placeholder">Correo electr&oacute;nico</span>
						<i class="fas fa-at"></i>
					</label>
					<div class="group-label">
						<label>
							<input value="${usuario.fechaNacimiento}" type="text" id="birth" autocomplete="off" data-validate="false" data-message="Ingrese una fecha v&aacute;lida" data-type="date"/>
							<span class="placeholder">Fecha de nacimiento</span>
							<i class="far fa-calendar"></i>
						</label>
						<label>
							<input value="${usuario.celular}" type="text" id="phone" autocomplete="off" data-validate="false" data-message="Ingrese un n&uacute;mero de celular v&aacute;lido" data-type="phone"/>
							<span class="placeholder">Nro. de celular</span>
							<i class="fas fa-mobile-alt"></i>
						</label>
					</div>
					<label>
						<textarea rows="6" id="presentacion" data-validate="false" data-message="Ingrese una presentaci&oacute;n v&aacute;lida" data-type="text">${usuario.presentacion}</textarea>
						<span class="placeholder">Presentaci&oacute;n</span>
						<i class="fas fa-comment-dots"></i>
					</label>
					<div class="buttons">
						<button class="btn btn-off" type="button">Cancelar</button>
						<button id="actualizar-info-personal" class="btn btn-on" type="button">Guardar</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="form" id="interest" data-form="interest">
			<h2>&Aacute;reas de inter&eacute;s</h2>
			<p>Escoge que tipo de servicio profesional ofrecer&aacute;s a tus clientes. Puedes escoger varios.</p>
			<div>
				<div class="selected">
					<span>Electricidad<i class="fas fa-times"></i></span>
					<span>Carpinter&iacute;a<i class="fas fa-times"></i></span>
					<span>Gasfiter&iacute;a<i class="fas fa-times"></i></span>
				</div>
				<div class="categories">
					<c:forEach items="${especialidades}" var="especialidad">
						<span data-id="${especialidad.idEspecialidad}">${especialidad.descripcion}</span>
					</c:forEach>
				</div>
			</div>
			<div class="buttons">
				<button class="btn btn-off" type="button">Cancelar</button>
				<button class="btn btn-on" type="button">Guardar</button>
			</div>
		</div>
		
		<div class="form" id="password" data-form="password">
			<h2>Cambiar contrase&ntilde;a</h2>
			<label>
				<input type="password" id="current-password" autocomplete="off" data-validate="false" data-message="Ingrese una contrase&ntilde;a v&aacute;lida" data-type="password"/>
				<span class="placeholder">Contrase&ntilde;a actual</span>
				<i class="fas fa-key"></i>
			</label>
			<div class="group-label">
				<label>
					<input type="password" id="new-password" autocomplete="off" data-validate="false" data-message="Ingrese una contrase&ntilde;a v&aacute;lida" data-type="password"/>
					<span class="placeholder">Nueva contrase&ntilde;a</span>
					<i class="fas fa-key"></i>
				</label>
				<label>
					<input type="password" id="new-password2" autocomplete="off" data-validate="false" data-message="Las contrase&ntilde;as no coinciden" data-type="password"/>
					<span class="placeholder">Confirmar contrase&ntilde;a</span>
					<i class="fas fa-key"></i>
				</label>
			</div>
			<div class="buttons">
				<button class="btn btn-off" type="button">Cancelar</button>
				<button class="btn btn-on" type="button">Guardar</button>
			</div>
		</div>
		
		<div class="form" id="cards" data-form="cards">
			<h2>Tarjetas</h2>
			<p>Las tarjetas que agregues aqu&iacute; servir&aacute;n para recibir tus cobros por los servicios profesionales ofrecidos.</p>
			<div class="no-cards">
				<p>A&uacute;n no tienes tarjetas registradas.</p>
				<button type="button" class="btn btn-off"><i class="fas fa-plus"></i>Agregar una tarjeta</button>
			</div>
		</div>
		
		<div class="form" id="security" data-form="security">
			<h2>Cerrar cuenta</h2>
			<div class="sure">
				<p>&iquest;Est&aacute;s seguro de cerrar tu cuenta?</p>
				<p>Si cierras tu cuenta, no podr&aacute; ingresar al sitio ni recibir ofertas de trabajo. Si cierras tu cuenta, todos los trabajos que hayas realizado ser&aacute;n borrados de nuestra base de datos y no podr&aacute;s recuperarlos.</p>
			</div>
			<button type="button" class="btn btn-on">Si, cerrar mi cuenta</button>
		</div>
		
		<div class="form" id="work" data-form="work">
			<h2>Quiero trabajar</h2>
			<p>&iquest;Quieres ofrecer tus servicios profesionales y ganar un dinero extra en tus tiempos libres? Est&aacute;s a solo un paso de lograrlo.</p>
			<button id="actualizar-rol" type="button" class="btn btn-on">Empezar ahora</button>
		</div>
		
		<div class="form" id="working" data-form="working">
			<h2>Mis ofertas de trabajo</h2>
			<c:choose>
				<c:when test="${fn:length(ofertas) eq 0}">
					<p>A&uacute;n no has publicado ninguna oferta de trabajo, empieza ahora.</p>
					<button id="nueva-oferta" type="button" class="btn btn-on"><i class="fas fa-plus"></i> Nueva oferta</button>
				</c:when>
				<c:otherwise>
					<p>Las ofertas que registres aqu&iacute; se visualizar&aacute;n en la p&aacute;gina principal para que los usuarios que requieran contratar servicios vean tus ofertas.</p>
					<button id="nueva-oferta" type="button" class="btn btn-on"><i class="fas fa-plus"></i> Nueva oferta</button>
					<section id="lista-ofertas">
						<c:forEach items="${ofertas}" var="oferta">
							<article class="oferta">
								<div class="options">
									<p class="id"><span class="label">C&oacute;digo:</span> ${oferta.idOferta}</p>
									<div class="buttons">
										<button data-id="${oferta.idOferta}" class="editar-oferta" type="button"><i class="fas fa-edit"></i></button>
										<button data-id="${oferta.idOferta}" class="eliminar-oferta" type="button"><i class="fas fa-trash"></i></button>
									</div>
								</div>
								<p class="descripcion"><span class="label">Descripci&oacute;n:</span>${oferta.descripcion}</p>
								<p class="especialidad"><span class="label">Especialidad:</span>${oferta.especialidad.descripcion}</p>
								<p class="precio"><span class="label">Precio:</span>S/ ${oferta.precioHora}</p>
							</article>
						</c:forEach>
					</section>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<div class="back-modal" id="modal-nueva-oferta">
	<div class="modal">
		<div>
			<i class="fas fa-times close-modal"></i>
			<h3>Nueva oferta</h3>
			<div class="group-label">
				<label class="drop">
					<input class="drop-button" type="text" readonly autocomplete="off" data-validate="false" data-message="Seleccione una opci&oacute;n" data-type="option"/>
					<input type="hidden" id="especialidad"/>
					<span class="placeholder">Especialidad</span>
					<i class="fas fa-sort-down"></i>
					<ul class="drop-list">
						<c:forEach items="${especialidades}" var="especialidad">
							<li class="drop-item" data-id="${especialidad.idEspecialidad}">${especialidad.descripcion}</li>
						</c:forEach>
					</ul>
				</label>
				<label>
					<span class="prefix-precio">S/ </span>
					<input type="text" id="precio" autocomplete="off" data-validate="false" data-message="Seleccione una opci&oacute;n" data-type="text"/>
					<span class="placeholder">Precio por hora</span>
					<i class="fas fa-dollar-sign"></i>
				</label>
			</div>
			<label>
				<textarea rows="6" id="descripcion-oferta" data-validate="false" data-message="Ingrese una descripci&oacute;n v&aacute;lida" data-type="text"></textarea>
				<span class="placeholder">Descripci&oacute;n</span>
				<i class="fas fa-keyboard"></i>
			</label>
		</div>
		<div class="buttons">
			<button class="btn btn-off close-modal" type="button">Cancelar</button>
			<button id="crear-nueva-oferta" class="btn btn-on" type="button">Crear</button>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var config = new ConfigUser();
	config.init();
});
</script>