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
		</ul>
		<div class="form active" id="personal-info" data-form="personal">
			<h2>Informaci&oacute;n general</h2>
			<div>
				<div class="avatar">
					<img src="${pageContext.request.contextPath}/resources/images/male-icon.png" alt="User avatar"/>
					<div class="choose-photo">
						<span><i class="fas fa-paperclip"></i>Elegir una foto</span>
					</div>
				</div>
				<div class="fields">
					<label>
						<input type="text" id="name" autocomplete="off" data-validate="false" data-message="Ingrese un nombre v&aacute;lido" data-type="name"/>
						<span class="placeholder">Nombre</span>
						<i class="fas fa-user"></i>
					</label>
					<label>
						<input type="text" id="surname" autocomplete="off" data-validate="false" data-message="Ingrese apellidos v&aacute;lidos" data-type="name"/>
						<span class="placeholder">Apellidos</span>
						<i class="far fa-user"></i>
					</label>
					<label>
						<input type="text" id="email" autocomplete="off" data-validate="false" data-message="Ingrese un correo electr&oacute;nico v&aacute;lido" data-type="email"/>
						<span class="placeholder">Correo electr&oacute;nico</span>
						<i class="fas fa-at"></i>
					</label>
					<div class="group-label">
						<label>
							<input type="text" id="birth" autocomplete="off" data-validate="false" data-message="Ingrese una fecha v&aacute;lida" data-type="date"/>
							<span class="placeholder">Fecha de nacimiento</span>
							<i class="far fa-calendar"></i>
						</label>
						<label>
							<input type="text" id="phone" autocomplete="off" data-validate="false" data-message="Ingrese un n&uacute;mero de celular v&aacute;lido" data-type="phone"/>
							<span class="placeholder">Nro. de celular</span>
							<i class="fas fa-mobile-alt"></i>
						</label>
					</div>
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
					<span>Electricidad</span>
					<span>Carpinter&iacute;a</span>
					<span>Gasfiter&iacute;a</span>
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
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var config = new ConfigUser();
	config.init();
});
</script>