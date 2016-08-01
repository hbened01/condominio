<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Facturas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="facturas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cod_apto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'edificio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alicuota')->textInput() ?>

    <?= $form->field($model, 'nr')->textInput() ?>

    <?= $form->field($model, 'fecha')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'total_gastos_mes')->textInput() ?>

    <?= $form->field($model, 'sub_total_alicuota')->textInput() ?>

    <?= $form->field($model, 'total_pagar_mes')->textInput() ?>

    <?= $form->field($model, 'deuda_actual')->textInput() ?>

    <?= $form->field($model, 'recibos')->textInput() ?>

    <?= $form->field($model, 'estatus_factura')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
