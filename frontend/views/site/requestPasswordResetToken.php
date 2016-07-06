<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\PasswordResetRequestForm */

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Reset-Token';
LoginAsset::register($this);

?>
<div class="site-request-password-reset">
<div class="login-box">
    <div class="login-logo">
        <b><?= Html::encode($this->title) ?></b>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg"><i class="glyphicon glyphicon-pencil"></i>  Please fill out your email. A link to reset password will be sent there.</p>

        <?php $form = ActiveForm::begin(['id' => 'request-password-reset-form']); ?>

            <div class="form-group has-feedback">
                <?= $form->field($model, 'email', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Email-Personal'])->label(false)
                ?>
            </div>
            
            <div class="row">
                <div class="col-xs-8">
                    <br>
                    <?= Html::a('<i class="fa fa-arrow-circle-left"></i>  Volver...', ['site/login']) ?>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <?= Html::submitButton('Send', ['class' => 'btn btn-primary btn-block btn-flat']) ?>
                </div>
                <!-- /.col -->
            </div>

        <?php ActiveForm::end(); ?>        

    </div>
</div>
</div>
