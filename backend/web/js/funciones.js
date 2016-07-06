$(document).ready(function(){
        $("#btn-passwd").click(function(){
                $("#modal-passwd").modal();
        });

        $("#btn-asignar-pass").click(function(){
                $("#btn-model").addClass('hide');
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
                                                        $(location).attr('href', 'view?id=' + data.id);
    		  	}
    	});
        });
});