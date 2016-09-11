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
              <h3 class="box-title"><?= Yii::t('backend', 'Message') ?>
                <small><?= Yii::t('backend', 'Type the message that will all copies of invoices') ?></small>
              </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">

  				    <?= $form->field($model, 'texto')->textarea(['rows' => 10,'cols' => 80, 'id' => 'editor'])->label(false) ?>
  				    <?= $form->field($model, 'msn_default')->checkbox() ?>

				    <div class="form-group">
				        <?= Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
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
