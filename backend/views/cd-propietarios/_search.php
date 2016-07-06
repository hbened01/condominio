<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietariosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-propietarios-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'cd_propietarios_pk') ?>

    <?= $form->field($model, 'cod_user') ?>

    <?= $form->field($model, 'nro_piso') ?>

    <?= $form->field($model, 'nombre') ?>

    <?= $form->field($model, 'apellido') ?>

    <?php // echo $form->field($model, 'nro_cedula') ?>

    <?php // echo $form->field($model, 'telf_local') ?>

    <?php // echo $form->field($model, 'telf_celular') ?>

    <?php // echo $form->field($model, 'fax') ?>

    <?php // echo $form->field($model, 'alicuota') ?>

    <?php // echo $form->field($model, 'quien_vive') ?>

    <?php // echo $form->field($model, 'direccion') ?>

    <?php // echo $form->field($model, 'direccion_cobro') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
