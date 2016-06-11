<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

$this->title = 'Signup';
$this->params['breadcrumbs'][] = $this->title;

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

LoginAsset::register($this);

?>
<div class="site-signup">
<div class="login-box">
    <div class="login-logo">
        <b><?= Html::a(Html::encode($this->title), ['site/signup'],['data' => ['method' => 'post']]) ?></b>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg"><i class="glyphicon glyphicon-pencil"></i>  Para registrarse en el sistema llene el siguiente formulario</p>
        <?php $form = ActiveForm::begin(['id' => 'form-signup']); ?>

            <div class="form-group has-feedback">
                <?= $form->field($model, 'username', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Username'])->label(false)
                ?>
            </div>

            <div class="form-group has-feedback">
                <?= $form->field($model, 'email', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Email'])->label(false)
                ?>
            </div>
            
            <div class="form-group has-feedback">
                <?= $form->field($model, 'password', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span></div>'])->passwordInput(['class' => 'form-control', 'placeholder' => 'Password'])->label(false)
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
                <br>
                    <?= Html::a('<i class="fa fa-arrow-circle-left"></i>  Volver...', ['site/login']) ?>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <?= Html::submitButton('Signup', ['class' => 'btn btn-primary btn-block btn-flat', 'name' => 'signup-button']) ?>
                </div>
                <!-- /.col -->
            </div>

        <?php ActiveForm::end(); ?>        

    </div>
</div>
</div>


