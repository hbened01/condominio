<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-pagos-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cod_factura')->textInput() ?>

    <?= $form->field($model, 'cod_tipo_pago')->textInput() ?>

    <?= $form->field($model, 'nro_referencia')->textInput() ?>

    <?= $form->field($model, 'fecha_pago')->textInput() ?>

    <?= $form->field($model, 'nota_pago')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nro_cedula')->textInput() ?>

    <?= $form->field($model, 'cod_tipo_doc')->textInput() ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'estatus_pago')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
