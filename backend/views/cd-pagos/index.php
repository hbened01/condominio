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

$this->title = Yii::t('app', 'Lista de Pagos');
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-pagos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Crear Pago'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_pago_pk',
           // 'codFactura.nr',
            //  [
            //            'label' => Yii::t('frontend', 'Invoice'),
            //            'attribute' => 'cod_factura',
            //            'value' => 'codFactura.nr', //esta es la data de la tabla
            //           // 'filter' => ,
            // ],
            //'cod_tipo_pago',
            //  [
            //            'label' => Yii::t('frontend', 'Payment Type'),
            //            'attribute' => 'cod_tipo_pago',
            //            'value' => 'codTipoPago.descrip_pago', //esta es la data de la tabla
            //            'filter' => Html::activeDropDownList($searchModel, 'cod_tipo_pago', ArrayHelper::map(CdTiposPagos::find()->asArray()->all(), 'cd_tipo_pago_pk', 'descrip_pago'), ['class'=>'form-control', 'prompt' => Yii::t('frontend', 'Select...')]),
            // ],
            'nro_referencia',
            [
               'label' => Yii::t('frontend', 'Payment Date'),
               'value' => 'fecha_pago', //esta es la data de la tabla
               'filter' => DatePicker::widget([
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
                                        'title' => Yii::t('app', 'Ver'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'actualizar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones')) && !$model->estatus_pago) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                        'title' => Yii::t('app', 'Actualizar'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'eliminar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones')) && !$model->estatus_pago) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('app', 'Eliminar'),
                                        'data-confirm' => '¿Seguro que desea eliminar el pago"?',
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
                                        'title' => Yii::t('app', 'Aprobar Pago'),
                                        'data-confirm' => '¿Seguro que desea aprobar el pago"?',
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
