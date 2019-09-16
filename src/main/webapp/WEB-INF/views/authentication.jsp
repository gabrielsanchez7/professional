<jsp:include page="../layouts/header.jsp"/>

<div id="choosePage">
	<div class="authentication">
		<h1>Bienvenido <br> Por favor, elige el modo en que deseas registrarte:</h1>
		
		<div class="options">
			<a class="option linkup" data-link="proff" href="javascript:void(0)">Quiero ofrecer mis servicios profesionales</a>
			<a class="option linkup" data-link="client" href="javascript:void(0)">Quiero contratar a un profesional</a>
		</div>
	</div>
	<div class="register form">
		<p class="link">&iquest;Ya tienes una cuenta? <a href="javascript:void(0)" class="linkup" data-link="login">Ingresa desde aqu&iacute;</a></p>
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
		<label>
			<input type="password" id="password" autocomplete="off" data-validate="false" data-message="Ingrese una contrase&ntilde;a v&aacute;lida" data-type="password"/>
			<span class="placeholder">Contrase&ntilde;a</span>
			<i class="fas fa-key"></i>
		</label>
		
		<button type="submit">Registrar</button>
		
		<p class="or">O reg&iacute;strate con</p>
		
		<div class="social">
			<a id="facebook" href="#"><i class="fab fa-facebook-f"></i>Facebook</a>
			<a id="google" href="#"><i class="fab fa-google"></i>Google</a>
		</div>
	</div>
	
	<div class="login form">
		<p class="link">&iquest;A&uacute; no tienes una cuenta? <a href="javascript:void(0)" class="linkup" data-link="register">Reg&iacute;strate desde aqu&iacute;</a></p>
		<label>
			<input type="text" id="logEmail" autocomplete="off" data-validate="false" data-message="Ingrese un correo electr&oacute;nico v&aacute;lido" data-type="email"/>
			<span class="placeholder">Correo electr&oacute;nico</span>
			<i class="fas fa-at"></i>
		</label>
		<label>
			<input type="password" id="logPassword" autocomplete="off" data-validate="false" data-message="Ingrese una contrase&ntilde;a v&aacute;lida" data-type="password"/>
			<span class="placeholder">Contrase&ntilde;a</span>
			<i class="fas fa-key"></i>
		</label>
		
		<button type="submit">Ingresar</button>
		
		<p class="or">O ingresa con</p>
		
		<div class="social">
			<a id="facebook" href="#"><i class="fab fa-facebook-f"></i>Facebook</a>
			<a id="google" href="#"><i class="fab fa-google"></i>Google</a>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var auth = new Authentication();
		auth.init();
	});
</script>






