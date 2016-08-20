<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\CdTiposPagos;
use backend\models\Facturas;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */
/* @var $form yii\widgets\ActiveForm */
?>


<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box">
                <div class="box-header with-border">
                    <h2 class="box-title"><strong>Operaciones</strong></h2>
                </div>
                <div class="box-body">

                    <?php $form = ActiveForm::begin(); ?>

                    <?= $form->field($model, 'cod_factura')->dropdownList(ArrayHelper::map($data, 'id', 'descripcion'), ['prompt'=> Yii::t('backend', 'Select...')]); ?>

                    <?=
                        $form->field($model, 'cod_tipo_pago')
                             ->dropDownList(
                                    ArrayHelper::map(CdTiposPagos::find()->all(), 'cd_tipo_pago_pk', 'descrip_pago'),
                                    ['prompt'=>'...']
                                )
                             ->label('Tipos de Pagos')
                    ?>

                    <?= $form->field($model, 'nro_referencia')->textInput() ?>

                    <?= $form->field($model, 'fecha_pago')->textInput() ?>

                    <?= $form->field($model, 'nota_pago')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'nro_cedula')->textInput() ?>

                    <?= $form->field($model, 'cod_tipo_doc')->textInput() ?>

                    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
                        <br>
                    <div class="form-group">
                        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>


                </div>
            </div>
        </div>
    </div>
</section>
