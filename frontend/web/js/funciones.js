$(document).ready(function(){
//datatables
$('#descrip_factura').DataTable({
      "paging": false,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": false,
      "autoWidth": false,
    });

//bootstrap WYSIHTML5 - text editor
    $("#cdpagos-nota_pago").wysihtml5({
        toolbar: {
            "font-styles": true, // Font styling, e.g. h1, h2, etc.
            "emphasis": true, // Italics, bold, etc.
            "lists": true, // (Un)ordered lists, e.g. Bullets, Numbers.
            "html": false, // Button which allows you to edit the generated HTML.
            "link": false, // Button to insert a link.
            "image": false, // Button to insert an image.
            "color": false, // Button to change color of font
            "blockquote": false, // Blockquote
        },
        locale: 'es-ES',
    });

    $("#cdpropietarios-quien_vive").click(function(){
      if ($("input[name='CdPropietarios[quien_vive]']:checked").val() == 0) {
        // $('label[for="cdpropietarios-direccion"]').css('display', 'block'); //oculta label
        document.getElementById('address').style.display='block';
      }else{
        // $('label[for="cdpropietarios-direccion"]').css('display', 'none');
        document.getElementById('address').style.display='none';
      }
    });

});