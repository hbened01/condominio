<?php

use frontend\assets\CorlateAsset;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\jui\DatePicker;
use frontend\models\CdTiposPagos;
use frontend\models\CdPagos;
use frontend\models\CdTiposDocs;

CorlateAsset::register($this);

$this->title = Yii::t('frontend', 'payment history');
/* @var $this yii\web\View */
/* @var $searchModel frontend\models\CdPagosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>

<section id="pagos-index">
    <div class="container">
        <div class="center">
            <br><br><br> 
            <h2><span class="glyphicons glyphicons-history"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'Payment History Registered')) ?></h2>
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
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbspNoVerificado', '<span class="glyphicon glyphicon-ok"></span> &nbspVerificado']

                ],
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
                    
                    'nombre',
                    'apellido',
                    [
                       'label' => Yii::t('frontend', 'Payment Type'),
                       'attribute' => 'cod_tipo_pago',
                       'value' => 'codTipoPago.descrip_pago', //esta es la data de la tabla
                       'filter' => Html::activeDropDownList($searchModel, 'cod_tipo_pago', ArrayHelper::map(CdTiposPagos::find()->asArray()->all(), 'cd_tipo_pago_pk', 'descrip_pago'), ['class'=>'form-control', 'prompt' => Yii::t('frontend', 'Select...')]),
                    ],
                    'nro_referencia',
                    [
                       'label' => Yii::t('frontend', 'Payment Date'),
                       'value' => 'fecha_pago', //esta es la data de la tabla
                       'filter' => \yii\jui\DatePicker::widget([
                        'model'=>$searchModel,
                        'attribute'=>'fecha_pago',
                        'options' => ['placeholder' => Yii::t('frontend', 'Press...'),
                        'class' => 'form-control'],
                        'language' => 'es', 
                        'clientOptions' => [
                            'defaultDate' => 'now', 
                            'dateFormat' => 'yy-mm-dd']
                        ]),
                    ],
                    [
                       'label' => Yii::t('frontend', 'Payment Status'),
                       'attribute' => 'estatus_pago',
                       'value' => 'estatus_pago',
                       'format' => 'boolean',
                       'filter'=> Html::activeDropDownList($searchModel, 'estatus_pago', array('0' => Yii::t('frontend', 'NoVerified'), '1' => Yii::t('frontend', 'Verified')), ['class'=>'form-control', 'prompt' => Yii::t('frontend', 'Select...')]),
                    ],

                    // 'nota_pago',
                    // 'cd_pago_pk',
                    // 'cod_factura',
                    // 'nro_cedula',
                    // 'cod_tipo_doc',
                    // 'email:email',
                    // 'estatus_pago:boolean',
                    
                    ['class' => 'yii\grid\ActionColumn',
                    'header'=>'Ver',
                    'headerOptions' => ['width' => '20'],
                    'template' => '{view}'],
                ],
            ]); ?>
            <div class="row-sm-5">
                <?= Html::a(Yii::t('frontend', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
                <?= Html::a(Yii::t('frontend', 'Exit'), ['site/index'], ['class' => 'btn btn-danger']) ?>
            </div>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->
