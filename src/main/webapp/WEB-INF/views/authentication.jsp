<jsp:include page="../layouts/header.jsp"/>

<div id="choosePage">

	<div class="back"><i class="fas fa-arrow-circle-left"></i> Regresar</div>

	<img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" width="150"/>
	
<!-- 	<div class="authentication"> -->
<!-- 		<h1>Bienvenido, por favor elige el modo en que deseas registrarte:</h1> -->
		
<!-- 		<div class="options"> -->
<!-- 			<a class="option linkup" data-link="proff" href="javascript:void(0)">Quiero ofrecer mis servicios profesionales</a> -->
<!-- 			<a class="option linkup" data-link="client" href="javascript:void(0)">Quiero contratar a un profesional</a> -->
<!-- 		</div> -->
		
<!-- 		<div class="go-login"> -->
<!-- 			<p>&iquest;Ya est&aacute;s registrado? <a href="javascript:void(0)" id="login">Ingresa aqu&iacute;</a></p> -->
<!-- 		</div> -->
		
<!-- 	</div> -->
	
 	<!-- <div id="logreg">
		<h2>Ingresar</h2>
		<a class="social" id="facebook" href="#"><i class="fab fa-facebook-f"></i><span>Ingresar</span> con Facebook</a>

		<div id="gSignInWrapper">
			<div id="customBtn" class="customGPlusSignIn">
				<span class="icon fab fa-google"></span><span class="buttonText"><span class="change">Ingresar</span> con Google</span>
			</div>
		</div>
	</div> -->
	
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
		
		<button id="registroForm" type="submit">Registrar</button>
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
		
		<button id="loginForm" type="submit">Ingresar</button>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var auth = new Authentication();
		auth.init();

		  // FB
		  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
		    console.log('statusChangeCallback');
		    console.log(response);                   // The current login status of the person.
		    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
		      testAPI();  
		    } else {                                 // Not logged into your webpage or we are unable to tell.
// 		      document.getElementById('status').innerHTML = 'Please log ' +
// 		        'into this webpage.';
		    }
		  }


		  function checkLoginState() {               // Called when a person is finished with the Login Button.
		    FB.getLoginStatus(function(response) {   // See the onlogin handler
		      statusChangeCallback(response);
		    });
		  }


		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '1213967098774976',
		      cookie     : true,                     // Enable cookies to allow the server to access the session.
		      xfbml      : true,                     // Parse social plugins on this webpage.
		      version    : 'v4.0'           // Use this Graph API version for this call.
		    });


		    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
		      statusChangeCallback(response);        // Returns the login status.
		    });
		  };

// 		  function fb_login(){
		$('#facebook').click(function(){
		    FB.login(function(response) {

		        if (response.authResponse) {
		            console.log('Welcome!  Fetching your information.... ');
		            //console.log(response); // dump complete info
		            access_token = response.authResponse.accessToken; //get access token
		            user_id = response.authResponse.userID; //get FB UID

		            FB.api('/me', function(response) {
		                user_email = response.email; //get user email
		          // you can store this data into your database             
		            });

		        } else {
		            //user hit cancel button
		            console.log('User cancelled login or did not fully authorize.');

		        }
		    }, {
		        scope: 'publish_stream,email'
		    });
		});
// 		}
	});
</script>






