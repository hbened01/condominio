<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-edificios-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cod_conjunto')->textInput() ?>

    <?= $form->field($model, 'nombre_edificio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nombre_concerje')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telf_concerje')->textInput() ?>

    <?= $form->field($model, 'porcentaje_nro1')->textInput() ?>

    <?= $form->field($model, 'email_edificio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'porcentaje_nro2')->textInput() ?>

    <?= $form->field($model, 'agua')->textInput() ?>

    <?= $form->field($model, 'fondo_nro1')->textInput() ?>

    <?= $form->field($model, 'fondo_nro2')->textInput() ?>

    <?= $form->field($model, 'fondo_nro3')->textInput() ?>

    <?= $form->field($model, 'fondo_nro4')->textInput() ?>

    <?= $form->field($model, 'fondo_nro5')->textInput() ?>

    <?= $form->field($model, 'fondo_nro6')->textInput() ?>

    <?= $form->field($model, 'fondo_nro7')->textInput() ?>

    <?= $form->field($model, 'fondo_nro8')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
