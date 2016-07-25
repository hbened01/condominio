<?php

use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
//use yii\widgets\ActiveForm;
use yii\jui\DatePicker;



$this->title = 'Registro de pago';
$asset = frontend\assets\CorlateAsset::register($this);
$baseUrl = $asset->baseUrl;

/* @var $this yii\web\View */
/* @var $model frontend\models\CdPropietarios */
/* @var $form yii\widgets\ActiveForm */
?>
<section id="contact-page">
    <div class="container">
        <div class="center">
            <br><br><br> 
            <h2><?= Html::encode('Registre su pago de acuerdo a los datos solicitados') ?></h2>
            <p class="lead"><i class="glyphicons glyphicons-notes-2"></i><?= '&nbsp'.Html::encode('  Nota: "Por defecto se traerá la información del propietario que ha iniciado seción para el registro de pago, en caso que el pago lo haya realizado otra persona registrar los datos de esta"') ?></p>
        </div> 
        <div class="row contact-wrap"> 
            
            <?php $form = ActiveForm::begin(
                ['fieldConfig' => [
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

            <div class="col-sm-5 col-sm-offset-2">

                <?= $form->field($model, 'cod_edificio')->textInput() ?>

                <?= $form->field($model, 'cod_apto')->textInput() ?>

                <?= $form->field($model, 'cod_tipo_pago')->textInput() ?>

                <?= $form->field($model, 'nro_transferencia_referencia', ['inputTemplate' => '<div class="input-group"><span class="input-group-addon">#&nbsp</span>{input}</div>'])->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Introduzca número de transferencia ó depósito']) ?>

                <?= $form->field($model,'fecha_pago', ['inputTemplate' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>{input}</div>'])->widget(DatePicker::className(),[
                    'options' => ['placeholder' => 'Pulse para acceder al calendario...',
                    'class' => 'form-control'],
                    'language' => 'es', 
                    'clientOptions' => [
                        'defaultDate' => 'now', 
                        'dateFormat' => 'dd-mm-yy']
                    ])
                 ?>

                <?= $form->field($model, 'nota_descrip_pago')->textInput(['maxlength' => true]) ?>
        
            </div>

            <div class="col-sm-5">

                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'nro_cedula', ['inputTemplate' => '<div class="input-group"><span class="input-group-addon"><i class="glyphicons glyphicons-nameplate"></i></span>{input}</div>'])->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Nro. de Cédula']) ?>

                <?= $form->field($model, 'cod_tipo_doc')->textInput() ?>

                <?= $form->field($model, 'email', ['inputTemplate' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span>{input}</div>'])->textInput(['maxlength' => true, 'class' => 'form-control', 'placeholder' => 'Email depósito']) ?>

            </div>

            <div class="col-sm-4 col-sm-offset-5">
                <br><br>
                <?= Html::submitButton($model->isNewRecord ? Yii::t('frontend', 'Create') : Yii::t('frontend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'data' => [
            'confirm' => Yii::t('frontend', 'Está seguro de que los datos introducidos son correctos? Verificar antes de continuar ...')]]) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->