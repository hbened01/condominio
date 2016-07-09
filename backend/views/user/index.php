<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\controllers\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Usuarios');
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operacion = str_replace("/", "-", Yii::$app->controller->route);
$operaciones = $session->get('operaciones');

?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= (in_array($operacion,$operaciones)) ? Html::a(Yii::t('app', 'Crear Usuario'), ['create'], ['class' => 'btn btn-success']) : '' ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'username',
            //'auth_key',
            //'password_hash',
            //'password_reset_token',
            'email:email',
            // 'status',
            // 'created_at',
            // 'updated_at',
            //'rol_id',
            [
                'attribute' => 'rol',
                'label' => 'Rol',
                'value' => function($data){
                    return $data->rol($data->rol_id); 
                },
            ],
            //'Roles.name',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{ver}  {actualizar}  {eliminar}',
                'buttons' => [
                    'ver' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-view',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                        'title' => Yii::t('app', 'Ver'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'actualizar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                        'title' => Yii::t('app', 'Actualizar'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'eliminar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones')) && Yii::$app->user->identity->rol_id != $model->id) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('app', 'Eliminar'),
                                        'data-confirm' => '¿Seguro que desea eliminar el rol "'.$model->username.'"?'
                            ]);
                        }else{
                            return false;
                        }
                    },
                ],
                'urlCreator' => function ($action, $model, $key, $index) {
                    if ($action === 'ver') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/view?id='.$model->id;
                        return $url;
                    }
                    if ($action === 'actualizar') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/update?id='.$model->id;
                        return $url;
                    }
                    if ($action === 'eliminar') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/delete?id='.$model->id;
                        return $url;
                    }
                }
            ],
        ],
    ]); ?>
</div>
