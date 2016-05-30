<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b><?= Html::encode($this->title) ?></b></a>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg">Introduce tus datos para entrar al sistema</p>
        <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
            <div class="form-group has-feedback">
                <?= $form->field($model, 'username')->textInput(['autofocus' => true,'class' => 'form-control','placeholder' => 'Email'])->label(false) ?>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            
            <div class="form-group has-feedback">
                <?= $form->field($model, 'password')->passwordInput(['class' => 'form-control','placeholder' => 'Password'])->label(false) ?>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <?= $form->field($model, 'rememberMe')->checkbox() ?>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <?= Html::submitButton('Login', ['class' => 'btn btn-primary btn-block btn-flat']) ?>
                </div>
                <!-- /.col -->
            </div>

        <?php ActiveForm::end(); ?>

        <a href="#">Olvid&eacute; mi contraseña</a><br>
        <a href="#" class="text-center">Registrar nuevo usuario</a>
    </div>
</div>

