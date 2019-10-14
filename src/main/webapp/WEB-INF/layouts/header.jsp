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
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
<!-- 	<script src="https://apis.google.com/js/platform.js" async defer></script> -->
	<script src="https://apis.google.com/js/api:client.js"></script>
	
	<script type="text/javascript">
	  // Fb

	  (function(d, s, id) {                      // Load the SDK asynchronously
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	
	 
	  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	    });
	  }

	  var contextPath = '${pageContext.request.contextPath}';
	</script>
</head>
<body>
	<header>
		<img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" width="150"/>
		<div class="auth">
			<div class="initials"></div>
		</div>
	</header>
	
<!-- 	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script> -->
</body>
</html>