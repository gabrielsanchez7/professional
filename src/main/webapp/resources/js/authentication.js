function Authentication(){
	this.tipoIngreso = "";
}

Authentication.prototype.init = function(){
	this.link();
	this.submitForms();
}

Authentication.prototype.link = function(){
	var auth = this;
	
	$('.linkup').click(function(ev){
		var t = $(ev.target);
		var data = t.attr('data-link');
		
		switch(data){
			case "client":
				auth.tipoIngreso = "client";
				t.closest('.authentication').fadeOut('fast', function(){
					$('.login').fadeIn('fast');
				});
				break;
			case "proff":
				auth.tipoIngreso = "proff";
				t.closest('.authentication').fadeOut('fast', function(){
					$('.login').fadeIn('fast');
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

Authentication.prototype.submitForms = function(){
	var auth = this;
	
	$('button[type="submit"]').click(function(ev){
		var t = $(ev.target);
		var form = t.closest('.form');
		var object = {};
		object.tipoIngreso = auth.tipoIngreso;
		
		if(validationFields(t.closest('.form'))) {
			if(form.is('.login')) {
				object.email = $('#logEmail').val();
				object.password = $('#logPassword').val();
			}
			else {
				object.name = $('#name').val();
				object.surname = $('#surname').val();
				object.email = $('#email').val();
				object.password = $('#password').val();
			}
			
			console.log('Object :: ', object);
		}
		
	});
	
}