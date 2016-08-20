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
            "color": true, // Button to change color of font
            "blockquote": true, // Blockquote
        },
        locale: 'es-ES',
    });

});