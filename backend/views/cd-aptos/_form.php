<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdAptos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-aptos-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cd_aptos_pk')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cod_propietario')->textInput() ?>

    <?= $form->field($model, 'cod_edificio')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
