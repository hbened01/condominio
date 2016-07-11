<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificiosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-edificios-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cd_edificios_pk') ?>

    <?= $form->field($model, 'cod_conjunto') ?>

    <?= $form->field($model, 'nombre_edificio') ?>

    <?= $form->field($model, 'nombre_concerje') ?>

    <?= $form->field($model, 'telf_concerje') ?>

    <?php // echo $form->field($model, 'porcentaje_nro1') ?>

    <?php // echo $form->field($model, 'email_edificio') ?>

    <?php // echo $form->field($model, 'porcentaje_nro2') ?>

    <?php // echo $form->field($model, 'agua') ?>

    <?php // echo $form->field($model, 'fondo_nro1') ?>

    <?php // echo $form->field($model, 'fondo_nro2') ?>

    <?php // echo $form->field($model, 'fondo_nro3') ?>

    <?php // echo $form->field($model, 'fondo_nro4') ?>

    <?php // echo $form->field($model, 'fondo_nro5') ?>

    <?php // echo $form->field($model, 'fondo_nro6') ?>

    <?php // echo $form->field($model, 'fondo_nro7') ?>

    <?php // echo $form->field($model, 'fondo_nro8') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
