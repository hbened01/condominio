<?php
namespace backend\controllers;

use Yii;
//use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use backend\models\CdPropietarios;
use common\models\User;
use backend\models\Facturas;
use backend\models\CdPagos;

/**
 * Site controller
 */
class SiteController extends BaseController
{
    
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
        return $this->render('index',[
                'cant_propietarios' => CdPropietarios::find()->count(),
                'cant_users' => User::find()->where(['rol_id' => 3])->count(),
                'cant_facturas' => Facturas::find()->where(['estatus_factura' => false])->count(),
                'cant_pagos' => CdPagos::find()->where(['estatus_pago' => false])->count(),
            ]);
    }

    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            $session = Yii::$app->session;
            $session->set('operaciones', $model->permittedOperations());
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();
        $session = Yii::$app->session;
        $session->remove('operaciones');
        return $this->goHome();
    }

    public function actionDeneid()
    {
        return $this->deneid();
    }
}
