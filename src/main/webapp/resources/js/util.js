var regexEmpty = /(?!^$|\s+)/;
var regexDni = /^[0-9]{8}$/;
var regexPhone = /^[0-9]{7,9}$/;
var regexDirection = /^([A-Za-záéíóúÁÉÍÓÚñÑüÜ0-9\-\.\,\#\/ ]){1,130}$/;
var regexUsername = /^([A-Za-záéíóúÁÉÍÓÚñÑüÜ ]){1,250}$/;
var regexEmail = /^[-\w.%+]{1,64}@(?:[A-Za-z0-9-]{1,63}\.){1,125}[A-Za-z]{2,63}$/;
var regexPassword = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-\.]).{8,}$/;

$(document).ready(function(){
	getInitials();
	focusField();
	dropdown();
	closeModal();
});

function userLogued(){
	var user = sessionStorage.getItem('userLogued');
	if(user != null) {
		user = JSON.parse(user);
	}
	return user;
}

function getInitials(){
	var user = userLogued();
	if(user != null) {
		var initials = (user.nombre.charAt(0) + user.apellidos.charAt(0)).toUpperCase();
		$('header .initials').text(initials);
	}
	else {
		$('header .auth').hide();
	}
}

function focusField(){
	$('input[type="text"]:not(.drop-button), input[type="password"], textarea').focusin(function(ev){
		var t = $(ev.target);
		var content = t.val();
		t.closest('label').addClass('focused');
		if(t.is('#precio')) t.siblings('.prefix-precio').show();
	});
	
	$('input[type="text"]:not(.drop-button), input[type="password"], textarea').focusout(function(ev){
		var t = $(ev.target);
		var content = t.val();
		
		if(content == ""){
			t.closest('label').removeClass('focused');
		}
		
		if(t.is('#precio') && content == "") t.siblings('.prefix-precio').hide();
	});
}

function validationFields(form){
	var fields = $(form).find('[data-validate]');
	$('.inline-error').remove();
	
	$.each(fields, function(index, value){
		var v = $(value);
		var type = v.attr('data-type');
		var errorMessage = v.attr('data-message');
		var entry = v.val();
		var regex;
		var label = v.closest('label');
		
		type == 'email' && (regex = regexEmail);
		type == 'password' && (regex = regexPassword);
		type == 'name' && (regex = regexUsername);
		
		if(regex.test(entry)){
			label.removeClass('error');
			v.attr('data-validate', true);
		}
		else {
			label.addClass('error');
			label.append('<span class="inline-error">' + errorMessage + '</span>');
			v.attr('data-validate', false);
		}
		
	});
	
	fields = $(form).find("[data-validate='false']");
	return fields.length == 0;
}

var opened = false;
function dropdown() {
	$('.drop').click(function(ev){
		var t = $(ev.target);
		t = (!t.is('label')) ? t.closest('label') : t;
		
		if(!opened){
			t.find('.drop-list').slideDown('fast', function(){
				opened = true;
			});
		}
		else {
			t.find('.drop-list').slideUp('fast', function(){
				opened = false;
			});
		}
		return false;
	});
	
	$('.drop-item').click(function(ev){
		var t = $(ev.target);
		var id = t.attr('data-id');
		var text = t.text();
		
		t.closest('label').find('input:text').val(text);
		t.closest('label').find('input:hidden').val(id);
		
		t.closest('label').addClass('focused');
	});
}

function openModal(modal){
	$(modal).fadeIn('fast', function() {
		$(modal).find('.modal').css({transform: 'translateY(0)'});
	}).css({display: 'flex'});
}

function closeModal(){
	$('.close-modal').click(function(ev){
		var t = $(ev.target);
		t.closest('.modal').removeAttr('style');
		setTimeout(function(){
			t.closest('.back-modal').fadeOut('fast');
		}, 150);
	});
}




















