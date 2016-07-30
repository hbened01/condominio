<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Operaciones */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="operaciones-form">
    <div class="row">
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-edit"></i>

              <h3 class="box-title">Formulario</h3>
            </div>

            <div class="box-body">

			    <?php $form = ActiveForm::begin(); ?>

			    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>
			    <?= $form->field($model, 'descripcion')->textInput(['maxlength' => true]) ?>
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
