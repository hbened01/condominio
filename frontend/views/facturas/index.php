<?php

use frontend\assets\CorlateAsset;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\jui\DatePicker;
CorlateAsset::register($this);

CorlateAsset::register($this);

$this->title = Yii::t('frontend', 'invoice history');
/* @var $this yii\web\View */
/* @var $searchModel frontend\models\FacturasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<section id="facturass-index">
    <div class="container">
        <div class="center">
            <br><br><br> 
            <h2><span class="glyphicons glyphicons-history"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'Invoice History')) ?></h2>
        </div> 
        <div class="row contact-wrap"> 
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'showFooter'=>true,
                'showHeader' => true,
                'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('frontend', 'THERE IS NO DATA').')</span>',
                    // 'dateFormat' => 'medium',
                    // 'timeFormat' => 'medium',
                    // 'datetimeFormat' => 'medium',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbspNo Cancelada', '<span class="glyphicon glyphicon-ok"></span> &nbspCancelada Exitosamente']
                ],
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    'nr',
                    'cod_apto',
                    'edificio',
                    'nombre',
                    [
                       'label' => Yii::t('frontend', 'Date'),
                       'value' => 'fecha', //esta es la data de la tabla
                       'filter' => \yii\jui\DatePicker::widget([
                        'model'=>$searchModel,
                        'attribute'=>'fecha',
                        'options' => ['placeholder' => Yii::t('frontend', 'Press...'),
                        'class' => 'form-control'],
                        'language' => 'es', 
                        'clientOptions' => [
                            'defaultDate' => 'now', 
                            'dateFormat' => 'MM yy']
                        ]),
                    ],
                    [
                       'label' => Yii::t('frontend', 'Invoice Status'),
                       'attribute' => 'estatus_factura',
                       'value' => 'estatus_factura',
                       'format' => 'boolean',
                       'filter'=> Html::activeDropDownList($searchModel, 'estatus_factura', array('0' => Yii::t('frontend', 'Uncancelled'), '1' => Yii::t('frontend', 'Successfully Canceled')), ['class'=>'form-control', 'prompt' => Yii::t('frontend', 'Select...')]),
                    ],
                    // 'apellido',
                    // 'cd_factura_pk',
                    // 'alicuota',
                    // 'total_gastos_mes',
                    // 'sub_total_alicuota',
                    // 'total_pagar_mes',
                    // 'deuda_actual',
                    // 'recibos',
                    

                    ['class' => 'yii\grid\ActionColumn',
                    'header'=>'Ver',
                    'headerOptions' => ['width' => '20'],
                    'template' => '{ver}  {factura-pdf}',
                    'buttons' => [
                        'factura-pdf' => function ($url, $model) {
                                    return Html::a('<span class="fa fa-download"></span>', $url, [
                                                'title' => Yii::t('app', 'Descargar Factura'),'target' =>'_blan',
                                    ]);
                        },
                    ],
                    'urlCreator' => function ($action, $model, $key, $index) {
                            if ($action === 'factura-pdf') {
                                $url = Url::base().'/'.Yii::$app->controller->id.'/factura-pdf?id='.$model->cd_factura_pk;
                                return $url;
                            }
                    }
                    ],
                ],
            ]); ?>
            <div class="row-sm-5">
                <?= Html::a(Yii::t('frontend', 'Exit'), ['site/index'], ['class' => 'btn btn-danger']) ?>
            </div>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->