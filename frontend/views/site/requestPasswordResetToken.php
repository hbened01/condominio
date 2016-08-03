<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\PasswordResetRequestForm */

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = (Yii::t('frontend', 'Password Reset'));
LoginAsset::register($this);

?>
<div class="site-request-password-reset">
<div class="login-box">
    <br><br><br><br>
    <div class="login-logo" style ="line-height: 30px;">
        <b><?= Html::encode($this->title) ?></b>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg"><i class="glyphicons glyphicons-pencil"></i>&nbsp<?= (Yii::t('frontend', 'Please fill out your email. A link to reset password will be sent there')); ?>.</p>

        <?php $form = ActiveForm::begin(['id' => 'request-password-reset-form']); ?>
            
            <div class="form-group has-feedback">
                <?= $form->field($model, 'email', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' =>Yii::t('frontend', 'Personal Email')])->label(false)
                ?>
            </div>
            
            <div class="row">
                <div class="col-xs-8">
                    <br>
                    <?= Html::a('<i class="fa fa-arrow-circle-left"></i>&nbsp'.Yii::t('frontend', 'Return').'...', ['site/login']) ?>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <?= Html::submitButton(Yii::t('frontend', 'Send'), ['class' => 'btn btn-primary btn-block btn-flat']) ?>
                </div>
                <!-- /.col -->
            </div>
            

        <?php ActiveForm::end(); ?>        
        <br><br><br><br>
    </div>
</div>
</div>
