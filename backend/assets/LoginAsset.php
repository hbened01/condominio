<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class LoginAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        //'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css',
        //'https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css',
        'css/bootstrap.min.css',
        'css/font-awesome.css',
        'css/ionicons.min.css'
        'css/AdminLTE.min.css',
        'css/skins/_all-skins.min.css',
        'css/flat/blue.css'
    ];
    public $js = [
        'js/jQuery-2.2.0.min.js',
        'js/bootstrap.min.js',
        'js/icheck.min.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}