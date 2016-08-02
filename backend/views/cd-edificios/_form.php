<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\CdConjuntos;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cd-edificios-form">
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
                    $form->field($model, 'cod_conjunto')
                         ->dropDownList(
                                ArrayHelper::map(CdConjuntos::find()->select(['cd_conjuntos_pk','CONCAT(nombre,\' - \',direccion) as nombre'])->all(), 'cd_conjuntos_pk', 'nombre'),
                                ['prompt'=>'...']
                            )
                         ->label('Conjunto')
                ?>

                <?= $form->field($model, 'nombre_edificio')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'nombre_concerje')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'telf_concerje')->textInput() ?>

                <?= $form->field($model, 'email_edificio')->textInput(['maxlength' => true]) ?>

                <br>
                <div class="form-group">
                    <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Crear') : Yii::t('app', 'Actualizar'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
    </div>

</div>
