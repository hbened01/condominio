<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Mensajes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mensajes-form">

    <?php $form = ActiveForm::begin(); ?>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">Mensaje
                <small>Escriba el mensaje que tendrán todas las copias de las facturas</small>
              </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
                    <!-- <textarea id="editor" name="editor" rows="10" cols="80"> -->
                    <!-- </textarea> -->
				    <?= $form->field($model, 'texto')->textarea(['rows' => 10,'cols' => 80, 'id' => 'editor'])->label(false) ?>
				    <?= $form->field($model, 'msn_default')->checkbox() ?>

				    <div class="form-group">
				        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Crear') : Yii::t('app', 'Actualizar'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
				    </div>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>

    <?php ActiveForm::end(); ?>

</div>
