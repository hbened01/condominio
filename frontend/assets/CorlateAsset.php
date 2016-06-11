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
    ];
    public $js = [
        'js/jquery.js',
        'js/bootstrap.min.js',
        'js/jquery.prettyPhoto.js',
        'js/jquery.isotope.min.js',
        'js/main.js',
        'js/wow.min.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}