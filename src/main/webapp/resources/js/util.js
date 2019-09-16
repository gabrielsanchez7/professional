var regexEmpty = /(?!^$|\s+)/;
var regexDni = /^[0-9]{8}$/;
var regexPhone = /^[0-9]{7,9}$/;
var regexDirection = /^([A-Za-záéíóúÁÉÍÓÚñÑüÜ0-9\-\.\,\#\/ ]){1,130}$/;
var regexUsername = /^([A-Za-záéíóúÁÉÍÓÚñÑüÜ ]){1,250}$/;
var regexEmail = /^[-\w.%+]{1,64}@(?:[A-Za-z0-9-]{1,63}\.){1,125}[A-Za-z]{2,63}$/;
var regexPassword = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-\.]).{8,}$/;

$(document).ready(function(){
	focusField();
});

function focusField(){
	$('input[type="text"], input[type="password"]').focusin(function(ev){
		var t = $(ev.target);
		var content = t.val();
		t.closest('label').addClass('focused');
	});
	
	$('input[type="text"], input[type="password"]').focusout(function(ev){
		var t = $(ev.target);
		var content = t.val();
		
		if(content == ""){
			t.closest('label').removeClass('focused');
		}
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