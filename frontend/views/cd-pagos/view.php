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
        </div> 
        <div class="row contact-wrap"> 

            <section>
                <h3><span class="glyphicons glyphicons-notes"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'Bill')) ?>(s):</h3>
                <table id="descrip_factura" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><center>Número de Factura (S) </center></th>
                            <th><center>Apartamento </center></th>
                            <th><center>Edificio </center></th>
                            <th><center>Fecha Emisión de Factura </center></th>              
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($table as $key => $value): ?>
                            <tr>
                                <td><center><?php print_r($value['nr']); ?></center></td>
                                <td><center><?php print_r($value['cod_apto']); ?></center></td>
                                <td><center><?php print_r($value['edificio']); ?></center></td>
                                <td><center><?php print_r($value['fecha']); ?></center></td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </section>  
            <h3><span class="glyphicons glyphicons-small-payments"></span>&nbsp<?= Html::encode(Yii::t('frontend', 'Details of the payment made')) ?>:</h3>
            <?= DetailView::widget([
                'model' => $model,
                'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('frontend', 'THERE IS NO DATA').')</span>',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbspNoVerificado-PorAdministración', '<span class="glyphicon glyphicon-ok"></span> &nbspVerificado-PorAdministración'],
                    'decimalSeparator' => ',',
                    'thousandSeparator' => '.',
                    'currencyCode' => 'Bs ',
                ],
                'attributes' => [
                    'nombre',
                    'apellido',
                    'codTipoPago.descrip_pago',
                    'codBanco.nombre',
                    'nro_referencia',
                    'monto:currency',
                    'fecha_pago',
                    'nota_pago:html',
                    'nro_cedula',
                    'codTipoDoc.descrip_doc',
                    'email:email',
                    'estatus_pago:boolean',
                ],
            ]) ?>

        <div class="row-sm-5">
            <?php if (!$model->estatus_pago) { ?>
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
