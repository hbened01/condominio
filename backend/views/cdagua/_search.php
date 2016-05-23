<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CdAguasSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-aguas-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cd_aguas_pk') ?>

    <?= $form->field($model, 'cod_apto') ?>

    <?= $form->field($model, 'cod_conjunto') ?>

    <?= $form->field($model, 'cod_edificio') ?>

    <?= $form->field($model, 'lect_ant') ?>

    <?php // echo $form->field($model, 'lect_post') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
