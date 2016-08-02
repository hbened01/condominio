<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdEdificiosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Lista de Edificios');
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-edificios-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= (in_array(Yii::$app->controller->id.'-create',$operaciones)) ? Html::a('Crear Edificio', ['create'], ['class' => 'btn btn-success']) : '' ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_edificios_pk',
            [
                'attribute' => 'conjunto',
                'label' => 'Conjunto',
                'value' => function($data){
                    return $data->conjunto($data->cod_conjunto); 
                },
            ],
            'nombre_edificio',
            // 'nombre_concerje',
            // 'telf_concerje',
            // 'porcentaje_nro1',
            'email_edificio:email',
            // 'porcentaje_nro2',
            // 'agua',
            // 'fondo_nro1',
            // 'fondo_nro2',
            // 'fondo_nro3',
            // 'fondo_nro4',
            // 'fondo_nro5',
            // 'fondo_nro6',
            // 'fondo_nro7',
            // 'fondo_nro8',

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
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('app', 'Eliminar'),
                                        'data-confirm' => '¿Seguro que desea eliminar el edificio "'.$model->nombre_edificio.'"?',
                                        'data-method' => 'POST'
                            ]);
                        }else{
                            return false;
                        }
                    },
                ],
                'urlCreator' => function ($action, $model, $key, $index) {
                    if ($action === 'ver') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/view?id='.$model->cd_edificios_pk;
                        return $url;
                    }
                    if ($action === 'actualizar') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/update?id='.$model->cd_edificios_pk;
                        return $url;
                    }
                    if ($action === 'eliminar') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/delete?id='.$model->cd_edificios_pk;
                        return $url;
                    }
                }
            ],
        ],
    ]); ?>
</div>
