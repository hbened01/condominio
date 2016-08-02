<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
            // Configuration Yii2-User Backend //
            // 'user' => [
            //     'class' => 'dektrium\user\Module',
            //     'enableFlashMessages' => false,
            //     'enableRegistration' => false,
            //     'enableUnconfirmedLogin' => false,
            //     'confirmWithin' => 21600,
            //     'cost' => 12,
            //     'admins' => ['admin']
            // ],
    ],
    'components' => [
        /*'user' => [
            'identityClass' => 'common\models\User', //PARAMETROS ORIGINALES DEL FRAMEWORK
            'enableAutoLogin' => true,
        ],*/
        //SE AGREGA SESION DISTINTA EN EL BACKEND
        //INICIO
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => [
                'name' => '_backendUser', // unique for backend
                'path'=>'/backend/web'  // correct path for the backend app.
            ]
        ],
        'session' => [
            'name' => '_backendSessionId', // unique for backend
            'savePath' => __DIR__ . '/../runtime', // a temporary folder on backend
        ],
        //FIN
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
    ],
    'params' => $params,
];
