<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-propietarios-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cod_conjunto')->textInput() ?>

    <?= $form->field($model, 'cod_edificio')->textInput() ?>

    <?= $form->field($model, 'nro_piso')->textInput() ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telf_local')->textInput() ?>

    <?= $form->field($model, 'telf_celular')->textInput() ?>

    <?= $form->field($model, 'fax')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alicuota')->textInput() ?>

    <?= $form->field($model, 'quien_vive')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'direccion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'direccion_cobro')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
