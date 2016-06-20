<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\Roles;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput()->label('Nombre de Usuario') ?>
    <?= $form->field($model, 'email')->textInput()->label('Correo Electrónico') ?>
    <?= $form->field($model, 'password')->passwordInput()->label('Password') ?>
    <?=
		$form->field($model, 'rol_id')
		     ->dropDownList(
		            ArrayHelper::map(Roles::find()->all(), 'id', 'nombre'),
		            ['prompt'=>'...']
	            )
		     ->label('Rol')
	?>
	<br>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Crear') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
