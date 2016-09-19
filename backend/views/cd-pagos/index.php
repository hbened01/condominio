<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\jui\DatePicker;
use backend\models\CdTiposPagos;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdPagosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'List of Payments');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-pagos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('backend', 'Create Payment'), ['create'], ['class' => 'btn btn-success']) ?>
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
        'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('backend', 'THERE IS NO DATA').')</span>',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbsp'.Yii::t('backend', 'No-Approved').'', '<span class="glyphicon glyphicon-ok"></span> &nbsp'.Yii::t('backend', 'Approved').''],
                    'dateFormat' => 'dd-MM-Y',
                ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_pago_pk',
            'nro_referencia',

            [
               'label' => Yii::t('backend', 'Payment Date'),
               'attribute'=>'fecha_pago',
               'value' => 'fecha_pago',
               'format' => 'date',
               'filterInputOptions' => [
                'class'       => 'form-control',
                'placeholder' => Yii::t('backend', 'Press...'),
                ]
            ],
            [
               'label' => Yii::t('backend', 'Payment Status'),
               'attribute' => 'estatus_pago',
               'value' => 'estatus_pago',
               'format' => 'boolean',
               'filter'=> Html::activeDropDownList($searchModel, 'estatus_pago', array('0' => Yii::t('backend', 'No-Approved'), '1' => Yii::t('backend', 'Approved')), ['class'=>'form-control', 'prompt' => Yii::t('backend', 'Select...')]),
            ],
            //'estatus_pago:boolean',
            // 'nota_pago',
            // 'nombre',
            // 'apellido',
            // 'nro_cedula',
            // 'cod_tipo_doc',
            // 'email:email',
            // 'estatus_pago:boolean',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{ver}  {actualizar}  {eliminar}  {pay-approved}',
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
                        if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones')) && !$model->estatus_pago) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                        'title' => Yii::t('backend', 'Update'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'eliminar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones')) && !$model->estatus_pago) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('backend', 'Delete'),
                                        'data-confirm' => Yii::t('backend', 'Sure you want to delete the payment?'),
                                        'data-method' => 'POST'
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'pay-approved' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-pay-approved',$session->get('operaciones')) && !$model->estatus_pago) {
                            return Html::a('<span class="glyphicons glyphicons-check"></span>', $url, [
                                        'title' => Yii::t('backend', 'Approve Payment'),
                                        'data-confirm' => Yii::t('backend', 'Sure you want to approve payment?'),
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
                    if ($action === 'pay-approved') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/pay-approved?id='.$model->cd_pago_pk;
                        return $url;
                    }
                }
            ],
        ],
    ]); ?>
</div>
