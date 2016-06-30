$(document).ready(function(){
    $("#btn-passwd").click(function(){
        $("#modal-passwd").modal();
    });

    $("#btn-asignar-pass").click(function(){
        var formData = new FormData($('#form-pass')[0]);
        var url = 'set-password'

        $.ajax({
		  	type: "POST",
		  	url: url,
		  	data: formData,
		  	dataType: 'json',
		    processData: false,
		    contentType: false,
		  	success: function(data){
		  		alert(data.search);
		  	}
		});
    });
});