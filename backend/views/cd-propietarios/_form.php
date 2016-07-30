<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\User;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-propietarios-form">
    <div class="row">
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-edit"></i>

              <h3 class="box-title">Formulario</h3>
            </div>

            <div class="box-body">

                <?php $form = ActiveForm::begin(); ?>

                <?=
                    $form->field($model, 'cod_user')
                         ->dropDownList(
                                ArrayHelper::map(User::find()->all(), 'id', 'username'),
                                ['prompt'=>'...']
                            )
                         ->label('Usuerio')
                ?>

                <?= $form->field($model, 'nro_piso')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'nro_cedula')->textInput() ?>

                <?= $form->field($model, 'telf_local')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'telf_celular')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'alicuota')->textInput() ?>

                <?= $form->field($model, 'quien_vive')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'direccion')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'direccion_cobro')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'update_usr')->checkbox() ?>

                <div class="form-group">
                    <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
    </div>

</div>
