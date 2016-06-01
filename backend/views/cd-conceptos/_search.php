<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConceptosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-conceptos-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cd_conceptos_pk') ?>

    <?= $form->field($model, 'descrip_concepto') ?>

    <?= $form->field($model, 'tipo') ?>

    <?= $form->field($model, 'frecuencia') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
