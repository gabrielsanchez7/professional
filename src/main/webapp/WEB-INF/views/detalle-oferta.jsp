<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../layouts/header.jsp"/>

<div id="detalle-oferta">
	<div class="head-detalle">
		<span class="initials">${initials}</span>
		<p>
			<span>Especialidad: ${oferta.especialidad.descripcion}</span>
			<span>${oferta.usuario.nombre} ${oferta.usuario.apellidos}</span>
		</p>
	</div>
	
	<div class="body-detalle">
		<div class="desc">
			<span>Descripci&oacute;n</span>
			<p>${oferta.descripcion}</p>
			<span>Zona de trabajo</span>
			<p>${oferta.usuario.ubigeo.distrito} / ${oferta.usuario.ubigeo.provincia} / ${oferta.usuario.ubigeo.ciudad}</p>
		</div>
		<div class="reserva">
			<p>Escoge el d&iacute;a para la reserva:</p>
			<input type="date" id="fecha" placeholder="Fecha"/>
			<p>Escoge la hora en que deseas reservar:</p>
			<select id="cboFecha">
				<option>07:00 am</option>
				<option>08:00 am</option>
				<option>09:00 am</option>
				<option>10:00 am</option>
				<option>11:00 am</option>
				<option>12:00 pm</option>
				<option>01:00 pm</option>
				<option>02:00 pm</option>
				<option>03:00 pm</option>
				<option>04:00 pm</option>
				<option>05:00 pm</option>
				<option>06:00 pm</option>
				<option>07:00 pm</option>
				<option>08:00 pm</option>
				<option>09:00 pm</option>
			</select>
			<p>Ingresa la cantidad de horas:</p>
			<input type="number" id="horas" placeholder="Horas"/>
			<p>Ingresa tu direcci&oacute;n:</p>
			<input type="text" id="direccion" placeholder="Direcci&oacute;n"/>
			
			<div class="precio">
				<p>Total a pagar: <b>S/${oferta.precioHora}</b></p>
			</div>
			<div class="cont-button">
				<button type="button" id="reservar">Reservar</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('#fecha').datepicker({
			autoHide: true,
			language: 'es-ES',
			format: 'yyyy-MM-dd',
			months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octobre', 'Noviembre', 'Diciembre'],
	        daysMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
	        pick: function(ev){
	        	$('#cboFecha option').removeAttr('disabled');
		        setTimeout(function(){
			        var obj = {idOferta: '${oferta.idOferta}', fecha: $('#fecha').val()};
		        	$.ajax({
						url: 'listar-horarios',
						type: 'GET',
						dataType: 'json',
						contentType: "application/json; charset=utf-8",
						data: obj,
						success: function(data){
							var disabled = [];
							$.each(data.result, function(index, value) {
								if(value != null){
									$.each($('#cboFecha option'), function(i, v) {
										var cont = $(v).val();
										if(cont == value[0]) {
											for(var j = 1; j <= value[1]; j++) {
												disabled.push(i++);
											}
										}
									});
								}
							});

							$.each(disabled, function(index, value){
								$('#cboFecha option').eq(value).attr({disabled: true});
							});
						},
						error: function(){
							console.log(error);
						}
					});
		        });
	        }
		});
		
		$('#reservar').click(function(){
			var obj = {
				oferta: { idOferta: '${oferta.idOferta}' },
				precio: parseInt('${oferta.precioHora}') * parseInt($('#horas').val()),
				direccion: $('#direccion').val(),
				fecha: $('#fecha').val(),
				hora: $('#cboFecha').val(),
				cantidadHoras: $('#horas').val()
			};
			console.log('Reservar ::: ', obj);
			$.ajax({
				url: 'reserva',
				type: 'POST',
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(obj),
				success: function(data){
					console.log('Success', data);
					location.href = "../reservas";
				},
				error: function(){
					console.log(error);
				}
			});
		});
	});
</script>











