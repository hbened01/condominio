<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Roles */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="roles-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>
    
<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box">
                <div class="box-header with-border">
                    <h2 class="box-title"><strong>Operaciones</strong></h2>
                </div>
                <div class="box-body">
                        <?php
                            $opciones = \yii\helpers\ArrayHelper::map($tipoOperaciones, 'id', 'nombre');
                            echo $form->field($model, 'operaciones',[
                                                         'template' =>'<table class="table table-bordered">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th style="width: 10%">Id</th>
                                                                                        <th>Nombre</th>
                                                                                        <th style="width: 100px">Seleccione</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    {input}
                                                                                </tbody>
                                                                                <tfoot>
                                                                                    <tr>
                                                                                        <th>Id</th>
                                                                                        <th>Nombre</th>
                                                                                        <th style="width: 100px">Seleccione</th>
                                                                                    </tr>
                                                                                </tfoot>
                                                                            </table>'
                                            ])
                                             ->label(false)
                                             ->checkboxList($opciones, [
                                                                        'unselect'=>NULL,
                                                                        'tag' => false,
                                                                        'label' => false,
                                                                        'item' => function ($index, $label, $name, $checked, $value) {
                                                                            $checked = $checked ? 'checked' : '';
                                                                            return "<tr><td>{$value}</td><td>{$label}</td><td class='text-center'><input type='checkbox' {$checked} name='{$name}' value='{$value}'></td></tr>";
                                                                                },
                                                                        ]);
                        ?>
                </div>
            </div>
        </div>
    </div>
</section>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
