<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\controllers\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Users');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= (in_array(Yii::$app->controller->id.'-create',$operaciones)) ? Html::a(Yii::t('backend', 'Create User'), ['create'], ['class' => 'btn btn-success']) : '' ?>
    </p>
    <div class="row-sm-5" align="right">
        <b> <?= Yii::t('backend', Html::encode('Quantity per page')) ?>:&nbsp<?php echo \nterms\pagesize\PageSize::widget(
                [   
                    'defaultPageSize' => 10,
                    'sizes' => [5 => 5, 10 => 10, 15 => 15, 20 => 20, 25 => 25, 50 => 50],
                    'label' => Yii::t('backend', Html::encode('Records')),
                ]
            ); ?>
        </b>        
    </div>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'filterSelector' => 'select[name="per-page"]',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
  
            'username', 
            'email:email',
            [
                'attribute' => 'rol',
                'label' => 'Rol',
                'value' => function($data){
                    return $data->rol($data->rol_id); 
                },
            ],
            //'id',
            //'auth_key',
            //'password_hash',
            //'password_reset_token',
            // 'status',
            // 'created_at',
            // 'updated_at',
            //'rol_id',
            //'Roles.name',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{ver}  {actualizar}  {eliminar}',
                'buttons' => [
                    'ver' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-view',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                        'title' => Yii::t('backend', 'See'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'actualizar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                        'title' => Yii::t('backend', 'Update'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'eliminar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones')) && Yii::$app->user->identity->rol_id != $model->id) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('backend', 'Delete'),
                                        'data-confirm' => Yii::t('backend', 'Are you sure you want to delete the user').'"'.$model->username.'"?',
                                        'data-method' => 'POST'
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
