<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Login';
LoginAsset::register($this);

?>
<div class="site-login">
<div class="login-box">
    <div class="login-logo">
        <b><?= Html::a(Html::encode($this->title), ['site/login'],['data' => ['method' => 'post']]) ?></b>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg"><i class="glyphicon glyphicon-pencil"></i>  Introduce tus datos para entrar al sistema</p>
        <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

            <div class="form-group has-feedback">
                <?= $form->field($model, 'username', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Username'])->label(false)
                ?>
            </div>
            
            <div class="form-group has-feedback">
                <?= $form->field($model, 'password', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicons glyphicons-keys"></i></span></div>'])->passwordInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Password'])->label(false)
                ?>
            </div>

            <div class="form-group has-feedback">
            <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                    'template' => '<div class="row"><div class="col-lg-5">{image}</div><div class="col-lg-7"><div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-qrcode"></i></span></div></div></div>',
                    'options' => ['placeholder' => 'Captcha Code', 'class' => 'form-control'],
                    ])->label(false) ?>
            </div>
            
            <div class="row">
                <div class="col-xs-8">
                    <div align="left" class="checkbox icheck">
                        <label>
                            <?= $form->field($model, 'rememberMe')->checkbox() ?>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <?= Html::submitButton('Login', ['class' => 'btn btn-primary btn-block btn-flat','name' => 'login-button']) ?>
                </div>
                <!-- /.col -->
            </div>

        <?php ActiveForm::end(); ?>        
            <div class="row">
                <div class="col-xs-0">
                </div>
                <div class="col-xs-12">
                <br><br>
                    <?= Html::a('<i class="fa fa-question-circle-o"></i> &nbspOlvid&eacute; mi contraseña !', ['site/request-password-reset']) ?><br>
                    <?= Html::a('<i class="fa fa-user-plus"></i>  Registrar nuevo usuario.', ['site/signup']) ?>
                <br>
                </div>
            </div>
    </div>
</div>
</div>