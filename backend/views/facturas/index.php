<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\FacturasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Facturas');
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="facturas-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'nr',
            'cod_apto',
            'edificio',
            'nombre',
            //'apellido',
            // 'alicuota',
            // 'nr',
            // 'fecha',
            // 'total_gastos_mes',
            // 'sub_total_alicuota',
            //'total_pagar_mes',
            [
                'attribute' =>'total_pagar_mes',
                'contentOptions' => ['style' => 'text-align:center'],
                'format'=>['decimal',0]
            ],
            // 'deuda_actual',
            // 'recibos',
            'estatus_factura:boolean',

            
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
                    // 'actualizar' => function ($url, $model) {
                    //     $session = Yii::$app->session;
                    //     if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones'))) {
                    //         return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                    //                     'title' => Yii::t('app', 'Actualizar'),
                    //         ]);
                    //     }else{
                    //         return false;
                    //     }
                    // },
                    // 'eliminar' => function ($url, $model) {
                    //     $session = Yii::$app->session;
                    //     if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones'))) {
                    //         return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                    //                     'title' => Yii::t('app', 'Eliminar'),
                    //                     'data-confirm' => '¿Seguro que desea eliminar "'.$model->nombre.' '.$model->apellido.'"?',
                    //                     'data-method' => 'POST'
                    //         ]);
                    //     }else{
                    //         return false;
                    //     }
                    // },
                ],
                'urlCreator' => function ($action, $model, $key, $index) {
                    if ($action === 'ver') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/view?id='.$model->cd_factura_pk;
                        return $url;
                    }
                    // if ($action === 'actualizar') {
                    //     $url = Url::base().'/'.Yii::$app->controller->id.'/update?id='.$model->cd_factura_pk;
                    //     return $url;
                    // }
                    // if ($action === 'eliminar') {
                    //     $url = Url::base().'/'.Yii::$app->controller->id.'/delete?id='.$model->cd_factura_pk;
                    //     return $url;
                    // }
                }
            ],
        ],
    ]); ?>
</div>
