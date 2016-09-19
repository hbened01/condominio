<?php

use frontend\assets\CorlateAsset;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
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
            <div class="row-sm-5" align="right">
                <b> <?= Yii::t('frontend', Html::encode('Quantity per page')) ?>:&nbsp<?php echo \nterms\pagesize\PageSize::widget(
                        [
                            'sizes' => [5 => 5, 10 => 10, 15 => 15, 20 => 20, 25 => 25, 50 => 50],
                            'label' => Yii::t('frontend', Html::encode('Records')),
                            'defaultPageSize' => 10
                        ]
                    ); ?>
                </b>        
            </div>
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'filterSelector' => 'select[name="per-page"]',
                'showFooter'=>true,
                'showHeader' => true,
                'formatter' => [
                    // 'dateFormat' => 'medium',
                    // 'timeFormat' => 'medium',
                    // 'datetimeFormat' => 'medium',
                    //'dateFormat' => 'dd.MM.yyyy',
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('frontend', 'THERE IS NO DATA').')</span>',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbspNoVerificado-PorAdministración', '<span class="glyphicon glyphicon-ok"></span> &nbspVerificado-PorAdministración'],
                    'decimalSeparator' => ',',
                    'thousandSeparator' => '.',
                    'currencyCode' => 'Bs ',
                ],
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
                    
                    //'nombre',
                    //'apellido',
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
                        'attribute' => 'monto',
                        'format' => 'currency'
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
                    'header'=>'Acciones',
                    'headerOptions' => ['width' => '20'],
                    'template' => '{ver}  {actualizar}  {eliminar}',
                    'buttons' => [
                        'ver' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                            'title' => Yii::t('frontend', 'See'),
                                ]);
                        },
                        'actualizar' => function ($url, $model) {
                            if (!$model->estatus_pago) {
                                return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                            'title' => Yii::t('frontend', 'Update'),
                                ]);
                            }else{
                                return false;
                            }
                        },
                        'eliminar' => function ($url, $model) {
                            if (!$model->estatus_pago) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                            'title' => Yii::t('frontend', 'Delete'),
                                            'data-confirm' => Yii::t('frontend', 'Sure you want to delete the payment?'),
                                            'data-method' => 'POST'
                                ]);
                            }else{
                                return false;
                            }
                        },
                    ],
                    'urlCreator' => function ($action, $model, $key, $index) {
                        if ($action === 'ver') {
                            $url = Url::base().'/'.Yii::$app->controller->id.'/view?id='.$model->cd_pago_pk;
                            return $url;
                        }
                        if ($action === 'actualizar') {
                            $url = Url::base().'/'.Yii::$app->controller->id.'/update?id='.$model->cd_pago_pk;
                            return $url;
                        }
                        if ($action === 'eliminar') {
                            $url = Url::base().'/'.Yii::$app->controller->id.'/delete?id='.$model->cd_pago_pk;
                            return $url;
                        }
                    }
                ],],
            ]); ?>

            <div class="row-sm-5">
                <?= Html::a(Yii::t('frontend', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
                <?= Html::a(Yii::t('frontend', 'Exit'), ['facturas/index'], ['class' => 'btn btn-danger']) ?>
            </div>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->
