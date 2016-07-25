<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-pagos-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cd_pago_pk') ?>

    <?= $form->field($model, 'cod_edificio') ?>

    <?= $form->field($model, 'cod_apto') ?>

    <?= $form->field($model, 'cod_tipo_pago') ?>

    <?= $form->field($model, 'nro_transferencia_referencia') ?>

    <?php // echo $form->field($model, 'fecha_pago') ?>

    <?php // echo $form->field($model, 'nota_descrip_pago') ?>

    <?php // echo $form->field($model, 'nombre') ?>

    <?php // echo $form->field($model, 'apellido') ?>

    <?php // echo $form->field($model, 'nro_cedula') ?>

    <?php // echo $form->field($model, 'cod_tipo_doc') ?>

    <?php // echo $form->field($model, 'email') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
