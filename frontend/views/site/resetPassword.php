<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ResetPasswordForm */

$this->title = 'Reset password';
$this->params['breadcrumbs'][] = $this->title;

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

LoginAsset::register($this);

?>
<div class="site-reset-password">
<div class="login-box">
    <div class="login-logo">
        <b><?= Html::encode($this->title) ?></b>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg"><i class="glyphicon glyphicon-pencil"></i>  Introduzca nueva contraseña</p>
        <?php $form = ActiveForm::begin(['id' => 'reset-password-form']); ?>
            
            <div class="form-group has-feedback">
                <?= $form->field($model, 'password', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span></div>'])->passwordInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Password'])->label(false)
                ?>
            </div>
            
            <div class="row">
                <div class="col-xs-8">
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <?= Html::submitButton('Save', ['class' => 'btn btn-primary btn-block btn-flat']) ?>
                </div>
                <!-- /.col -->
            </div>

        <?php ActiveForm::end(); ?>        

    </div>
</div>
</div>
