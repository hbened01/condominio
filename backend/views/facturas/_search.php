<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\FacturasSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="facturas-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cd_factura_pk') ?>

    <?= $form->field($model, 'cod_apto') ?>

    <?= $form->field($model, 'edificio') ?>

    <?= $form->field($model, 'nombre') ?>

    <?= $form->field($model, 'apellido') ?>

    <?php // echo $form->field($model, 'alicuota') ?>

    <?php // echo $form->field($model, 'nr') ?>

    <?php // echo $form->field($model, 'fecha') ?>

    <?php // echo $form->field($model, 'total_gastos_mes') ?>

    <?php // echo $form->field($model, 'sub_total_alicuota') ?>

    <?php // echo $form->field($model, 'total_pagar_mes') ?>

    <?php // echo $form->field($model, 'deuda_actual') ?>

    <?php // echo $form->field($model, 'recibos') ?>

    <?php // echo $form->field($model, 'estatus_factura')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
