<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\ArrayHelper;
use frontend\assets\CorlateAsset;

$this->title = Html::encode(Yii::t('frontend', 'log view')).'#'.$model->cd_factura_pk;
$asset = frontend\assets\CorlateAsset::register($this);
$baseUrl = $asset->baseUrl;

/* @var $this yii\web\View */
/* @var $model frontend\models\Facturas */
?>
<section id="facturas-view">
    <div class="container">
        <div class="center">
            <br><br>
            <h2><span class="glyphicons glyphicons-exclamation-sign"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'Detailed view of Invoice')) ?></h2>
        </div> 
        <div class="row contact-wrap"> 

            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
                    'cod_apto',
                    'edificio',
                    'nombre',
                    'apellido',
                    'alicuota',
                    'nr',
                    'fecha',
                    'total_gastos_mes',
                    'sub_total_alicuota',
                    'total_pagar_mes',
                    'deuda_actual',
                    'recibos',
                    // 'cd_factura_pk',
                    // 'estatus_factura:boolean',
                ],
            ]) ?>

        <div class="row-sm-5">

                <?= Html::a(Yii::t('frontend', 'Return'), ['facturas/'], ['class' => 'btn btn-success']); ?>

        </div>  

        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->
