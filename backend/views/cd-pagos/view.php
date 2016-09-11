<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\ArrayHelper;

$this->title = Html::encode(Yii::t('backend', 'View Payment')).' #'.$model->cd_pago_pk;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>

<p>
    <?= Html::a(Yii::t('backend', 'List of Payments'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-update',$operaciones) && !$model->estatus_pago) ? Html::a(Yii::t('backend', 'Update'), ['update', 'id' => $model->cd_pago_pk], ['class' => 'btn btn-primary']) : '' ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones) && !$model->estatus_pago) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->cd_pago_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('backend', 'Sure you want to delete the payment?'),
            'method' => 'post',
        ],
    ]) : '' ?>
    <?= (in_array(Yii::$app->controller->id.'-pay-approved',$operaciones) && !$model->estatus_pago) ? Html::a(Yii::t('backend', 'Approve'), ['pay-approved', 'id' => $model->cd_pago_pk], [
        'class' => 'btn btn-warning',
        'data' => [
            'confirm' => Yii::t('backend', 'Sure you want to approve payment?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<section id="pagos-view">
    <div class="container">
        <div class="center">
            <h2><?= Html::encode(Yii::t('backend', 'View Registered Payment')) ?></h2>
        </div> 
        <br>
        <div class="row contact-wrap"> 
    
            <?= DetailView::widget([
                'model' => $model,
                'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('backend', 'THERE IS NO DATA').')</span>',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbsp'.Yii::t('backend', 'No-Approved').'', '<span class="glyphicon glyphicon-ok"></span> &nbsp'.Yii::t('backend', 'No-Approved').''],
                ],
                'attributes' => [
                    //'cd_pago_pk',
                    //'cod_factura',
                    //'estatus_pago:boolean',
                    //'codFactura.nr',
                    //'codFactura.cod_apto',
                    //'codFactura.edificio',
                    'nombre',
                    'apellido',
                    'codTipoPago.descrip_pago',
                    'codBancos.nombre',
                    'nro_referencia',
                    [
                        'label' => 'Fecha del pago',
                        'value' => date('d-m-Y',strtotime($model->fecha_pago)),
                    ],
                    [
                        'label' => 'Monto del pago',
                        'value' => number_format($model->monto,2,',','.'),
                    ],
                    'codTipoDoc.descrip_doc',
                    'nro_cedula',
                    'email:email',
                    'nota_pago:html',
                    'estatus_pago:boolean',
                ],
            ]) ?>

        </div><!--/.row-->

        <div class="text-center">
            <div class="center">
                <h2><?= Html::encode(Yii::t('backend', 'Related bills Payment')) ?></h2>
            </div> 
            <table class="table table-bordered">
                <thead>
                    
                </thead>
                <tbody>
                    <?php 
                        if (!empty($model->facturas)) {
                            foreach ($model->facturas as $key => $value) {

                                $string = "Apto.: ".$value->cod_apto." - Edif.: ".$value->edificio." - Nombre: ".$value->nombre." - Monto: ".number_format($value->total_pagar_mes,2,',','.');

                                echo "<tr><td>";
                                if (in_array('facturas-view',$operaciones)) {
                                    echo Html::a($string, ['facturas/view','id' => $value->cd_factura_pk], ['class' => 'btn btn-default']);
                                }else{
                                    echo $string;
                                }
                                echo "</td></tr>";
                            }
                        }
                    ?>
                </tbody>
            </table>
        </div>
        <br>
        <br>
        <br>
    </div><!--/.container-->

</section><!--/#contact-page-->
