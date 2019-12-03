<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
<!-- 	<meta name="google-signin-client_id" content="936368267028-pfhrrvmvefckhv2bpb7nj4rl3n83vnkr.apps.googleusercontent.com"> -->
	<title>Professional</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,700&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/datepicker.min.css" rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
	<script src="https://apis.google.com/js/api:client.js"></script>
	
	<script type="text/javascript">
	  // Fb

// 	  (function(d, s, id) {                      // Load the SDK asynchronously
// 	    var js, fjs = d.getElementsByTagName(s)[0];
// 	    if (d.getElementById(id)) return;
// 	    js = d.createElement(s); js.id = id;
// 	    js.src = "https://connect.facebook.net/en_US/sdk.js";
// 	    fjs.parentNode.insertBefore(js, fjs);
// 	  }(document, 'script', 'facebook-jssdk'));
	
	 
// 	  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
// 	    console.log('Welcome!  Fetching your information.... ');
// 	    FB.api('/me', function(response) {
// 	      console.log('Successful login for: ' + response.name);
// 	      document.getElementById('status').innerHTML =
// 	        'Thanks for logging in, ' + response.name + '!';
// 	    });
// 	  }

	  var contextPath = '${pageContext.request.contextPath}';
	</script>
</head>
<body>
	<header>
		<img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" width="150"/>
		<div class="auth">
			<a href="${pageContext.request.contextPath}/home">Inicio</a>
			<a href="${pageContext.request.contextPath}/reservas">Mis reservas</a>
			<a href="${pageContext.request.contextPath}/usuario/config">Mi cuenta</a>
			<a href="${pageContext.request.contextPath}/usuario/cerrar-sesion">Cerrar sesi&oacute;n</a>
			<div class="initials"></div>
		</div>
	</header>
	
<!-- 	<script> (function(b,c){var e=document.createElement('link');e.rel='stylesheet',e.type='text/css',e.href='https://chatboxlive.blahbox.net/static/css/main.css',document.getElementsByTagName('head')[0].appendChild(e); var f=document.createElement('script');f.onload=function(){var g;if(c)g='previewInit';else{var h=document.createElement('div');g='cbinit',h.id='cbinit',document.body.append(h)} console.log(document.querySelector('#'+g)),chatbox.initChat(document.querySelector('#'+g),b,c)},f.src='https://chatboxlive.blahbox.net/static/js/chat-lib.js',document.getElementsByTagName('head')[0].appendChild(f)}) ('7f0b860aa9b08934adc5c773e400ee85', 0); </script> -->
<!-- 	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script> -->
</body>
</html>