$(document).ready(function(){
    $("#btn-passwd").click(function(){
        $("#modal-passwd").modal();
    });

    $("#btn-asignar-pass").click(function(){
    	$("#msn-error").remove();
	    $("#btn-model").addClass('hide');
	    $(".close").addClass('hide');
	    $("#img-loading").removeClass('hide');

	    var formData = new FormData($('#form-pass')[0]);
	    var url = 'set-password';

	    $.ajax({
		  	type: "POST",
		  	url: url,
		  	data: formData,
		  	dataType: 'json', 
	        processData: false,
	        contentType: false,
		  	success: function(data){
		  		if(data.save){
	            	$(location).attr('href', 'view?id=' + data.id);
		  		}else{
		  			$("#btn-model").removeClass('hide');
				    $(".close").removeClass('hide');
				    $("#img-loading").addClass('hide');
				    $("#userform-password").val('');
		  			$(".field-userform-password").append('<p id="msn-error" class="text-red">' + data.msn_error.password + '</p>');
		  		}
		  	}
		});
    });

    var url = window.location.href;
    if (url.indexOf("/mensajes/create") != -1 || url.indexOf("/mensajes/update") != -1 ) {
	    CKEDITOR.replace('editor');
	    // bootstrap WYSIHTML5 - text editor
	    $(".textarea").wysihtml5();
    }

    $(".select2").select2();

    $.fn.datepicker.dates['es'] = {
	    days: ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"],
	    daysShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"],
	    daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do"],
	    months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
	    monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
	    today: "Hoy"
	};

    $("#cdpagos-fecha_pago").datepicker({
    	format:'dd-mm-yyyy',
    	clearBtn:true,
    	language:'es'
    });

    $("#cdpagos-id_propietario").change(function(){
    	//alert($("#cdpagos-id_propietario").val());
	    var datos = "id=" + $("#cdpagos-id_propietario").val();
	    var url = 'options-select-facturas';

	    $.ajax({
		  	type: "GET",
		  	url: url,
		  	data: datos,
		  	dataType: 'json',
		  	success: function(data){
		  		//alert(data.options);
		  		$("#cdpagos-cod_factura").html(data.options);
		  	}
		});
    });
});