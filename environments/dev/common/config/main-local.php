<?php
return [
    'components' => [
       /* 'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=yii2advanced',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],*/
       /* 'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'pgsql:host=161.196.12.244;dbname=condominio_db',
            'username' => 'postgres',
            'password' => '<zaq12wsx',
            'charset' => 'utf8',
        ],*/
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'pgsql:host=localhost;dbname=condominio_db',
            'username' => 'postgres',
            'password' => '<zaq12wsx',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
        ],
    ],
];
