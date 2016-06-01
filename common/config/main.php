<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'extensions' => require(__DIR__ . '/../../vendor/yiisoft/extensions.php'),
    'modules' => [
        'admin' => [
            'class' => 'mdm\admin\Module',
            'layout' => 'left-menu', // defaults to null, using the application's layout without the menu
            /*'menus' => [
                'assignment' => [
                    'label' => 'Grant Access' // change label
                ],
                'route' => null, // disable menu
            ],*/
        ],
    ],
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
        ],
        'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
            'allowActions' => [
                 'admin/*', // add or remove allowed actions to this list
            ],
        ],
    ],    
];