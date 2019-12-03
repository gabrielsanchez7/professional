function Authentication(){
	this.tipoIngreso = "";
}

Authentication.prototype.init = function(){
	this.handler();
	this.link();
	this.submitForms();
	this.googleLogin();
	this.authenticate();
}

Authentication.prototype.handler = function(){
	$('header').hide();
	$('.back').click(function(){
		$(this).hide();
		$('#logreg').fadeOut('fast', function(){
			$('.authentication').fadeIn('fast');
		});
	});
	
	$('#login').click(function(ev){
		var t = $(ev.target);
		t.closest('.authentication').fadeOut('fast', function(){
			$('#logreg').fadeIn('fast');
			$('.back').css({display: 'flex'});
			$('#logreg').find('h2').text('Ingresar');
			$('#logreg').find('.social span').text('Ingresar');
			$('#gSignInWrapper').find('.change').text('Ingresar');
		});
	});
	
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope': 'profile email',
			'width': 240,
			'height': 50,
			'longtitle': true,
			'theme': 'dark',
			'onsuccess': onSuccess,
			'onfailure': onFailure
		});
	}
}

Authentication.prototype.link = function(){
	var auth = this;
	
	$('.linkup').click(function(ev){
		var t = $(ev.target);
		var data = t.attr('data-link');
		
		$('#logreg').find('.social span').text('Registrar');
		$('#gSignInWrapper').find('.change').text('Registrar');

		switch(data){
			case "client":
				auth.tipoIngreso = "client";
				t.closest('.authentication').fadeOut('fast', function(){
					$('#logreg').fadeIn('fast');
					$('.back').css({display: 'flex'});
				});
				break;
			case "proff":
				auth.tipoIngreso = "proff";
				t.closest('.authentication').fadeOut('fast', function(){
					$('#logreg').fadeIn('fast');
					$('.back').css({display: 'flex'});
				});
				break;
			case "login":
				t.closest('.register').fadeOut('fast', function(){
					$('.login').fadeIn('fast');
				});
				break;
			case "register":
				t.closest('.login').fadeOut('fast', function(){
					$('.register').fadeIn('fast');
				});
				break;
		}
	});
}

Authentication.prototype.googleLogin = function(){
	var googleUser = {};
	var startApp = function() {
		gapi.load('auth2', function() {
			auth2 = gapi.auth2.init({
				client_id : '936368267028-pfhrrvmvefckhv2bpb7nj4rl3n83vnkr.apps.googleusercontent.com',
				cookiepolicy : 'single_host_origin'
			});
			attachSignin(document.getElementById('customBtn'));
		});
	};

	function attachSignin(element) {
		auth2.attachClickHandler(element, {}, function(googleUser) {
			console.log('Logued: ', googleUser);
			var usuario = {};
			usuario.idLogin = googleUser.El;
			usuario.nombre = googleUser.w3.ofa;
			usuario.apellidos = googleUser.w3.wea;
			usuario.email = googleUser.w3.U3;
			usuario.avatar = googleUser.w3.Paa;
			usuario.tipoLogin = "facebook";
			$.ajax({
				url: contextPath + "/usuario/registro",
				data: JSON.stringify(usuario),
				contentType: "application/json; charset=utf-8",
				type: 'POST',
				dataType: 'json',
				success: function(data){
					sessionStorage.setItem('userLogued', JSON.stringify(data.result));
					location.href = contextPath + "/usuario/config";
				},
				error: function(err){
					console.log('Error en registro: ' + err);
				}
			});
		}, function(error) {
			console.log(error);
		});
	}

	startApp();
}

Authentication.prototype.submitForms = function(){
	var auth = this;
	
	$('.social').click(function(ev){
		var t = $(ev.target);
		var social = t.attr('id');
		var object = {};
		object.role = auth.tipoIngreso;
		object.social = social;
		
		if(social == 'google') {
			function onSignIn(googleUser) {
				var profile = googleUser.getBasicProfile();
				console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
				console.log('Name: ' + profile.getName());
				console.log('Image URL: ' + profile.getImageUrl());
				console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			}
		}
		
	});
	
}

Authentication.prototype.authenticate = function(){
	$('#registroForm').click(function(){
		var obj = {
			nombre: $('#name').val(),
			apellidos: $('#surname').val(),
			email: $('#email').val(),
			contrasena: $('#password').val(),
			tipoLogin: 'normal'
		};
		
		$.ajax({
			url: contextPath + "/usuario/registro",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			type: 'POST',
			dataType: 'json',
			success: function(data){
				sessionStorage.setItem('userLogued', JSON.stringify(data.result));
				location.href = contextPath + "/usuario/config";
			},
			error: function(err){
				console.log('Error en registro: ' + err);
			}
		});
	});
	
	$('#loginForm').click(function(){
		var obj = {
			email: $('#logEmail').val(),
			contrasena: $('#logPassword').val()
		};
		
		$.ajax({
			url: contextPath + "/usuario/login",
			data: obj,
			contentType: "application/json; charset=utf-8",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				console.log('Success> ', data);
				sessionStorage.setItem('userLogued', JSON.stringify(data.result));
				location.href = contextPath + "/usuario/config";
			},
			error: function(err){
				console.log('Error en logueo: ' + err);
			}
		});
	});
}

function ConfigUser() {
	
}

ConfigUser.prototype.init = function(){
	this.handler();
	this.setData();
	this.updateUser();
	this.nuevaOferta();
	this.editarOferta();
	this.elegirUbigeo();
	this.atenderReserva();
}

ConfigUser.prototype.handler = function(){
	$('.change-config').click(function(ev){
		var t = $(ev.target);
		var option = t.attr('data-option');
		$('.form.active').fadeOut('fast', function(){
			$(this).removeClass('active');
			t.addClass('active').siblings().removeClass('active');
			$('.form[data-form="' + option + '"]').addClass('active');
			$('.form[data-form="' + option + '"]').fadeIn('fast');
		});
	});
	
	$('#birth').datepicker({
		autoHide: true,
		language: 'es-ES',
		format: 'dd-MM-yyyy',
		months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octobre', 'Noviembre', 'Diciembre'],
        daysMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        pick: function(ev){
        	$('#birth').parent('label').addClass('focused');
        }
	});
	
	$('#precio').focusin(function(ev){
		var t = $(ev.target);
		
	});
}

ConfigUser.prototype.setData = function(){
	$.each($('input:text, textarea'), function(index, value){
		var text = $(value).val();
		if(text != '') $(value).parent('label').addClass('focused');
	});
}

ConfigUser.prototype.updateUser = function(){
	var logued = userLogued();
	$('#actualizar-info-personal').click(function(){
		var user = {};
		user.idLogin = logued.idLogin;
		user.nombre = $('#name').val();
		user.apellidos = $('#surname').val();
		user.email = $('#email').val();
		user.fechaNacimiento = moment($('#birth').val(), 'DD-MM-YYYY');
		user.celular = $('#phone').val();
		user.ubigeo = {idUbigeo: $('#distrito').val()};
		
		updateRequest(user);
	});
	
	$('#actualizar-rol').click(function(){
		var obj = {};
		obj.idUsuario = logued.idUsuario;
		obj.rol = "proff";
		
		updateRequest(obj);
	});
	
	function updateRequest(object){
		$.ajax({
			url: contextPath + "/usuario/actualizar",
			data: JSON.stringify(object),
			contentType: "application/json; charset=utf-8",
			type: 'POST',
			dataType: 'json',
			success: function(data){
				sessionStorage.setItem('userLogued', JSON.stringify(data.result));
				location.reload();
			},
			error: function(err){
				console.log('Error en registro: ' + err);
			}
		});
	}
}

ConfigUser.prototype.nuevaOferta = function(){
	$('#nueva-oferta').click(function(ev){
		openModal('#modal-nueva-oferta');
	});
	
	$('#crear-nueva-oferta').click(function(){
		var obj = {
			precioHora: $('#precio').val(),
			descripcion: $('#descripcion-oferta').val(),
			especialidad: {idEspecialidad: $('#especialidad').val()}
		};
		
		$.ajax({
			url: contextPath + "/oferta/registrar",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			type: 'POST',
			dataType: 'json',
			success: function(data){
				location.reload();
			},
			error: function(err){
				console.log('Error en registro de oferta: ' + err);
			}
		});
	});
}

ConfigUser.prototype.editarOferta = function(){
	var ob = this;
	
	$('.editar-oferta').click(function(ev){
		var id = $(ev.target).attr('data-id');
		var obj = {idOferta: id};
		
		$.ajax({
			url: contextPath + "/oferta/listar",
			data: obj,
			contentType: "application/json; charset=utf-8",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				openModal('#modal-nueva-oferta');
				var oferta = data.result[0];
				$('#descripcion-oferta').val(oferta.descripcion);
				$('#especialidad').val(oferta.especialidad.idEspecialidad);
				$('#especialidad').prev('input:text').val(oferta.especialidad.descripcion);
				$('#precio').val(oferta.precioHora);
				$('#precio').siblings('.prefix-precio').show();
				ob.setData();
			},
			error: function(err){
				console.log('Error al obtener la ofertas: ' + err);
			}
		});
	});
}

ConfigUser.prototype.elegirUbigeo = function(){
	var ob = this;
	
	$('.drop-ciudad li').click(function(ev){
		var obj = {ciudad: $(ev.target).text()};
		$('.drop-provincia, .drop-distrito').html('');
		$('.drop-provincia, .drop-distrito').siblings('.drop-button').val('');
		$('.drop-provincia, .drop-distrito').siblings('input:hidden').val('');
		$('.drop-provincia, .drop-distrito').parent('.drop').removeClass('focused');
		callAjax(obj, 'provincia');
	});
	
	function callAjax(obj, llenar){
		$.ajax({
			url: contextPath + "/usuario/ubigeo",
			data: obj,
			contentType: "application/json; charset=utf-8",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				$.each(data.result, function(index, value){
					var field = llenar == "provincia" ? value.provincia : value.distrito;
					$('.drop-' + llenar).append('<li class="drop-item" data-id="' + (llenar == 'provincia' ? field : value.idUbigeo) + '">' + field + '</li>');
				});
				dropdown();
				
				console.log(llenar);
				if(llenar == 'provincia'){
					$('.drop-provincia li').click(function(ev){
						var obj = {ciudad: $('.drop-ciudad').siblings('.drop-button').val(), provincia: $(ev.target).text()};
						$('.drop-distrito').html('');
						$('.drop-distrito').siblings('.drop-button').html('');
						$('.drop-distrito').siblings('input:hidden').html('');
						$('.drop-distrito').parent('.drop').removeClass('focused');
						console.log('ajax');
						callAjax(obj, 'distrito');
					});
				}
			},
			error: function(err){
				console.log('Error al obtener ubigeo: ' + err);
			}
		})
	}
}

ConfigUser.prototype.atenderReserva = function(){
	$('body').on('click', '.atender-oferta', function(ev){
		var t = $(ev.target);
		var code = t.attr('data-id');
		var obj = {idReserva: code};
		$.ajax({
			url: contextPath + "/reserva/atender",
			data: obj,
			contentType: "application/json; charset=utf-8",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				location.reload();
			},
			error: function(err){
				console.log('Error al atender la reserva: ' + err);
			}
		})
	});
}

ConfigUser.prototype.editarOferta = function(){
	var logued = userLogued();
	var ob = this;
	$('.editar-oferta').click(function(ev){
		var t = $(ev.target);
		var id = t.attr('data-id');
		
		var content = t.closest('.oferta');
		
		$('#crear-nueva-oferta').hide();
		$('#editar-oferta').show();
		$('#editar-oferta').attr('data-id', id)
		
		openModal('#modal-nueva-oferta');
		
		$('#especialidad').val(content.find('#getEspecialidad').text());
		$('#drop-especialidad').val(content.find('#getEspecialidad').text());
		$('#descripcion-oferta').val(content.find('#getDescripcion').text());
		$('#precio').val(content.find('#getPrecioHora').text());
		
		ob.setData();
		
	});
	
	$('#editar-oferta').click(function(ev){
		var t = $(ev.target);
		var id = t.attr('data-id');
		
		var obj = { 
			idOferta: parseInt(id),
  			usuario: { idUsuario: logued.idUsuario },
			especialidad: { idEspecialidad: parseInt($('#especialidad').val()) },
			descripcion: $('#descripcion-oferta').val(),
			precioHora: $('#precio').val()
		};
		
		console.log(obj);
		
		$.ajax({
			url: contextPath + "/oferta/actualizar",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			type: 'POST',
			dataType: 'json',
			success: function(data){
				location.reload();
			},
			error: function(err){
				console.log('Error al actualizar la oferta: ' + err);
			}
		})
	});
}






















