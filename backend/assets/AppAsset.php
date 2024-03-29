<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{  
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        //'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css',
        //'https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css',
        'css/bootstrap.min.css',
        'css/font-awesome.css',
        'css/ionicons.min.css',
        'css/AdminLTE.min.css',
        'css/skins/_all-skins.min.css',
        'css/flat/blue.css',
        'css/morris.css',
        'css/jquery-jvectormap-1.2.2.css',
        'css/datepicker3.css',
        'css/dataTables.bootstrap.css',
        'css/daterangepicker-bs3.css',
        'css/bootstrap3-wysihtml5.min.css',
        'css/site.css',
        'css/glyphicons.css',
        'css/fileinput.min.css',
        'css/select2.min.css',
    ];
    public $js = [
        //'https://code.jquery.com/ui/1.11.4/jquery-ui.min.js',
        //'https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js',
        //'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js',
        //'js/jQuery-2.2.0.min.js',
        //'js/morris.min.js',
        'js/dashboard.js',
        'js/jquery-ui.min.js',
        'js/bootstrap.min.js',
        'js/raphael-min.js',
        'js/jquery.sparkline.min.js',
        'js/jquery-jvectormap-1.2.2.min.js',
        'js/jquery-jvectormap-world-mill-en.js',
        'js/jquery.knob.js',
        'js/moment.min.js',
        'js/jquery.dataTables.min.js',
        'js/dataTables.bootstrap.min.js',
        'js/daterangepicker.js',
        'js/bootstrap-datepicker.js',
        'js/bootstrap3-wysihtml5.all.min.js',
        'js/jquery.slimscroll.min.js',
        'js/fastclick.js',
        'js/app.min.js',
        'js/icheck.min.js',
        'js/funciones.js',
        'js/fileinput.min.js',
        'js/es.js',
        'https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js',
        'js/select2.min.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}