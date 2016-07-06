<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use frontend\assets\LoginAsset;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Registro de Nuevo Usuario';
LoginAsset::register($this);

?>
    <section id="contact-page">
        <div class="container">
            <div class="center">
                <br><br><br>  
                <h2><?= Html::a(Html::encode($this->title).':', ['site/signup'],['data' => ['method' => 'post']]) ?></h2>
                <p class="login-box-msg"><i class="glyphicon glyphicon-pencil"></i>  Para registrarse en el sistema llene el siguiente formulario</p>
            </div> 
            <div class="row contact-wrap"> 
                
                <?php $form = ActiveForm::begin(
                    ['id' => 'form-signup',  
                        'fieldConfig' => [
                            'template' => "<div id='main-contact-form' class='contact-form'><div class='form-group'>{label}\n{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}</div></div>",
                            'horizontalCssClasses' => [
                                'label' => 'col-sm-5',
                                'offset' => 'col-sm-offset-1',
                                'wrapper' => 'col-sm-8',
                                'error' => '',
                                'hint' => '',
                            ],
                        ],
                    ]); 
                ?>

                <div class="col-sm-5 col-sm-offset-1">

                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'username', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Usuario'])->label(false)
                        ?>
                    </div>

                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'email', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span></div>'])->input('email',['autofocus' => true, 'class' => 'form-control', 'placeholder' => '1.- Email-Personal'])->label(false)
                        ?>
                    </div>

                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'email_edificio', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="fa fa-envelope"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => '2.- Email-Edificio'])->label(false)
                        ?>
                    </div>
            
                </div>

                <div class="col-sm-5">

                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'nro_apto', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicons glyphicons-door"></i></span></div>'])->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'N° Apartamento'])->label(false)
                        ?>
                    </div>

                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'nro_cedula', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicons glyphicons-nameplate"></i></span></div>'])->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'N° Cédula'])->label(false)
                        ?>
                    </div>

                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'password', ['inputTemplate' => '<div class="input-group">{input}<span class="input-group-addon"><i class="glyphicons glyphicons-keys"></i></span></div>'])->passwordInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Password'])->label(false)
                        ?>
                    </div>

                </div>

                <div class="col-sm-4 col-sm-offset-4">
                    <div class="form-group has-feedback">
                        <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                            'template' => '<div class="row"><div class="col-lg-5">{image}</div><div class="col-lg-7"><div class="input-group">{input}<span class="input-group-addon"><i class="glyphicon glyphicon-qrcode"></i></span></div></div></div>',
                            'options' => ['placeholder' => 'Captcha Code', 'class' => 'form-control'],])->label(false)
                        ?>
                    </div>
                    
                    <?= Html::submitButton('Guardar', ['class' => 'btn btn-primary btn-block btn-flat', 'name' => 'signup-button']) ?>
                <div class="col-sm-4 col-sm-offset-4">
                    <p><br><?= Html::a('<i class="fa fa-arrow-circle-left fa-2x"></i>  Volver...', ['site/login']) ?></p>
                </div>
                </div>

                <?php ActiveForm::end(); ?>
        
            </div><!--/.row-->
            <br>
            <br>
            <br>
        </div><!--/.container-->
    </section><!--/#contact-page-->


