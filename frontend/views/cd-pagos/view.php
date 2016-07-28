<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use frontend\assets\CorlateAsset;

/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = 'Vista de registro #'.$model->cd_pago_pk;
$asset = frontend\assets\CorlateAsset::register($this);
$baseUrl = $asset->baseUrl;
?>

<section id="pagos-view">
    <div class="container">
        <div class="center">
            <br><br><br> 
            <h2><span class="glyphicons glyphicons-exclamation-sign"></span>&nbsp<?= Html::encode('Vista de datos registrados') ?></h2>
        </div> 
        <div class="row contact-wrap"> 
    
            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
                    //'cd_pago_pk',
                    //'cod_factura',
                    'codFactura.nr',
                    'nombre',
                    'apellido',
                    //'cod_tipo_pago',
                    'codTipoPago.descrip_pago',
                    'nro_referencia',
                    'fecha_pago',
                    'descrip_pago',
                    'nro_cedula',
                    //'cod_tipo_doc',
                    'codTipoDoc.descrip_doc',
                    'email:email',
                    //'estatus_pago:boolean',
                ],
            ]) ?>

        <div class="row-sm-5">
                <?= Html::a(Yii::t('frontend', 'Update'), ['update', 'id' => $model->cd_pago_pk], ['class' => 'btn btn-warning']) ?>
                <?= Html::a(Yii::t('frontend', 'Delete'), ['delete', 'id' => $model->cd_pago_pk], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => Yii::t('frontend', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ]) ?>
                <?= Html::a(Yii::t('frontend', 'Exit'), ['site/index'], ['class' => 'btn btn-success']) ?>
        </div>  

        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->
