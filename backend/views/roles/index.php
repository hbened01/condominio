<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\RolesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Roles');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="roles-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= (in_array(Yii::$app->controller->id.'-create',$operaciones)) ? Html::a(Yii::t('backend', 'Create Rol'), ['create'], ['class' => 'btn btn-success']): '' ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nombre',

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
                        if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones')) && (Yii::$app->user->identity->rol_id != $model->id || Yii::$app->user->identity->rol_id == 1) && $model->id != 3) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                        'title' => Yii::t('backend', 'Update'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'eliminar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones')) && Yii::$app->user->identity->rol_id != $model->id && $model->id != 3) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('app', 'Eliminar'),
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
