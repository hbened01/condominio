<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\ArrayHelper;
use frontend\assets\CorlateAsset;

$this->title = Html::encode(Yii::t('frontend', 'log view')).'#'.$model->cd_pago_pk;
$asset = frontend\assets\CorlateAsset::register($this);
$baseUrl = $asset->baseUrl;
/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */
?>

<section id="pagos-view">
    <div class="container">
        <div class="center">
            <br><br>
            <h2><span class="glyphicons glyphicons-exclamation-sign"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'View Registered Payment')) ?></h2>
            <h3><span class="glyphicons glyphicons-notes"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'Bill')) ?>&nbsp:&nbsp<?php print_r(ArrayHelper::getValue($factura, 'descripcion')) ?></h3>
        </div> 
        <div class="row contact-wrap"> 
    
            <?= DetailView::widget([
                'model' => $model,
                'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('frontend', 'THERE IS NO DATA').')</span>',
                    // 'dateFormat' => 'medium',
                    // 'timeFormat' => 'medium',
                    // 'datetimeFormat' => 'medium',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbspNoVerificado', '<span class="glyphicon glyphicon-ok"></span> &nbspVerificado']
                ],
                'attributes' => [
                    //'cd_pago_pk',
                    //'cod_factura',
                    //'estatus_pago:boolean',
                    'codFactura.nr',
                    'codFactura.cod_apto',
                    'codFactura.edificio',
                    'nombre',
                    'apellido',
                    'codTipoPago.descrip_pago',
                    'nro_referencia',
                    'fecha_pago',
                    'nota_pago',
                    'nro_cedula',
                    'codTipoDoc.descrip_doc',
                    'email:email',
                    'estatus_pago:boolean',
                ],
            ]) ?>

        <div class="row-sm-5">
            <?php if (empty(ArrayHelper::getValue($factura, 'status'))) { ?>
                <?= Html::a(Yii::t('frontend', 'Update'), ['update', 'id' => $model->cd_pago_pk], ['class' => 'btn btn-warning']); ?>
                <?= Html::a(Yii::t('frontend', 'Delete'), ['delete', 'id' => $model->cd_pago_pk], [
                            'class' => 'btn btn-danger',
                            'data' => [
                                'confirm' => Yii::t('frontend', 'Are you sure you want to delete this item?'),
                                'method' => 'post',
                            ],
                        ]);
                ?>
                <?= Html::a(Yii::t('frontend', 'Return'), ['cd-pagos/'], ['class' => 'btn btn-success']); ?>
            <?php } else { ?> 
                <?= Html::a(Yii::t('frontend', 'Return'), ['cd-pagos/'], ['class' => 'btn btn-success']); ?>
            <?php } ?> 
        </div>  

        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->
