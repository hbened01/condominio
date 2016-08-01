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
                'template' => '{ver}  {factura-pdf}  {eliminar}',
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
                    'factura-pdf' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-factura-pdf',$session->get('operaciones'))) {
                            return Html::a('<span class="fa fa-download"></span>', $url, [
                                        'title' => Yii::t('app', 'Descargar Factura'),'target' =>'_blan',
                            ]);
                        }else{
                            return false;
                        }
                    },
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
                    if ($action === 'factura-pdf') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/factura-pdf?id='.$model->cd_factura_pk;
                        return $url;
                    }
                    // if ($action === 'eliminar') {
                    //     $url = Url::base().'/'.Yii::$app->controller->id.'/delete?id='.$model->cd_factura_pk;
                    //     return $url;
                    // }
                }
            ],
        ],
    ]); ?>
</div>
