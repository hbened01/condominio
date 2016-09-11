<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\Roles;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/* @var $form yii\widgets\ActiveForm */

if (Yii::$app->user->identity->rol_id == 1) {
	$where = '1 = 1';
}else{
	$where = 'id != 1';
}
?>

<div class="user-form">
    <div class="row">
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-edit"></i>

              <h3 class="box-title"><?= Yii::t('backend', 'Form') ?></h3>
            </div>

            <div class="box-body">

			    <?php $form = ActiveForm::begin(); ?>

			    <?= $form->field($model, 'username')->textInput()->label() ?>
			    <?= $form->field($model, 'email')->textInput()->label() ?>
			    <?=
					$form->field($model, 'rol_id')
					     ->dropDownList(
					            ArrayHelper::map(Roles::find()->where($where)->all(), 'id', 'nombre'),
					            ['prompt'=> Yii::t('backend', 'Select...')]
				            )
					     ->label()
				?>
				<br>
			    <div class="form-group">
			        <?= Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
			    </div>

			    <?php ActiveForm::end(); ?>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
    </div>

</div>
