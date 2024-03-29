<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class CorlateAsset extends AssetBundle
{   
    //public $sourcePath = '@bower/corlate/';
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'css/bootstrap.min.css',
        'css/font-awesome.css',
        'css/animate.min.css',
        'css/prettyPhoto.css',
        'css/main.css',
        'css/responsive.css',
        'css/glyphicons.css',
        'css/dataTables.bootstrap.css',
        'css/bootstrap3-wysihtml5.css',
    ];
    public $js = [
        'js/jquery.js',
        'js/bootstrap.min.js',
        'js/jquery.prettyPhoto.js',
        'js/jquery.isotope.min.js',
        'js/main.js',
        'js/wow.min.js',
        'js/funciones.js',
        'js/jquery.dataTables.js',
        'js/bootstrap3-wysihtml5.all.js',
        'js/bootstrap-wysihtml5.es-ES.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}