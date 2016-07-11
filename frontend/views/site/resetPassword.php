<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ResetPasswordForm */

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Reset-Password';
LoginAsset::register($this);

?>
<div class="site-reset-password">
<div class="login-box">
    <div class="login-logo">
        <b><?= Html::encode($this->title) ?></b>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg"><i class="glyphicons glyphicons-pencil"></i> Introduzca nueva contraseña</p>
        
        <?php $form = ActiveForm::begin(['id' => 'reset-password-form']); ?>

            <div class="form-group has-feedback">
                <?= $form->field($model, 'username', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Usuario', 'prompt'=>'Select'])->label(false)->hint(false)
                ?>
            </div>
            
            <div class="form-group has-feedback">
                <?= $form->field($model, 'password', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicons glyphicons-keys"></i></span></div>'])->passwordInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Password'])->label(false)->hint(false)
                ?>
            </div>

            <p class="lead"><i class="glyphicons glyphicons-notes-2"></i><?= '&nbsp'.Html::encode('  Nota: "No llenar campo usuario si no desea cambiarlo"') ?></p>
            
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
