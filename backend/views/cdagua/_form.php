<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CdAguas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-aguas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cod_apto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cod_conjunto')->textInput() ?>

    <?= $form->field($model, 'cod_edificio')->textInput() ?>

    <?= $form->field($model, 'lect_ant')->textInput() ?>

    <?= $form->field($model, 'lect_post')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
