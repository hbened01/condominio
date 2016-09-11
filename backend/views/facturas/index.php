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
            [
                'attribute' =>'total_pagar_mes',
                'contentOptions' => ['style' => 'text-align:center'],
                'format'=>['decimal',0]
            ],
            [
                'attribute'=>'status_bill',
                'header'=> Yii::t('frontend', 'Invoice Status'),
                'filter'=> Html::activeDropDownList($searchModel, 'status_bill', array('1' => Yii::t('frontend', 'Successfully Canceled'), '2' => Yii::t('frontend', 'Partially Canceled'), '0' => Yii::t('frontend', 'Uncancelled')), ['class'=>'form-control', 'prompt' => Yii::t('frontend', 'Select...')]),
                'format'=>'raw',   
                'value' => function($model, $key, $index)
                    {   
                        if($model->estatus_factura == true && $model->total_deducible == 0)
                        {
                            return '<span class="glyphicon glyphicon-ok"></span>&nbspTotalmente Cancelada';
                        }
                        else if($model->estatus_factura == true && $model->total_deducible !== 0)
                        {   
                            return '<span class="glyphicons glyphicons-ok-circle"></span>&nbspParcialmente Cancelada';
                        }
                        else if($model->estatus_factura == false)
                        {
                            return '<span class="glyphicon glyphicon-remove"></span>&nbspNo Cancelada';
                        }
                    },
             ],
            //'estatus_factura:boolean',
            // 'deuda_actual',
            // 'recibos',
            //'apellido',
            // 'alicuota',
            // 'nr',
            // 'fecha',
            // 'total_gastos_mes',
            // 'sub_total_alicuota',
            //'total_pagar_mes',
            
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{ver}  {factura-pdf}  {eliminar}',
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
                    'factura-pdf' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-factura-pdf',$session->get('operaciones'))) {
                            return Html::a('<span class="fa fa-download"></span>', $url, [
                                        'title' => Yii::t('backend', 'Download Invoice'), 'target' =>'_blan',
                            ]);
                        }else{
                            return false;
                        }
                    },
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
                }
            ],
        ],
    ]); ?>
</div>
