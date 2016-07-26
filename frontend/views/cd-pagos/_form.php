<?php

//use yii\widgets\ActiveForm;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\jui\DatePicker;
use yii\widgets\MaskedInput;



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

                <?= $form->field($model, 'cod_factura')->textInput(['placeholder' => Yii::t('frontend', 'Seleccione...')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">1</i></span>&nbsp'.Yii::t('frontend', 'Billing Code')) ?>

                <?= $form->field($model, 'cod_edificio')->textInput(['placeholder' => Yii::t('frontend', 'Seleccione...')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">2</i></span>&nbsp'.Yii::t('frontend', 'Building')) ?>

                <?= $form->field($model, 'cod_apto')->textInput(['placeholder' => Yii::t('frontend', 'Seleccione...')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">3</i></span>&nbsp'.Yii::t('frontend', 'Apartment')) ?>

                <?= $form->field($model, 'cod_tipo_pago')->textInput(['placeholder' => Yii::t('frontend', 'Seleccione...')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">4</i></span>&nbsp'.Yii::t('frontend', 'Payment Type')) ?>

                <?= $form->field($model, 'nro_transferencia_referencia')->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Introduzca número de transferencia ó depósito'])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">5</i></span>&nbsp'.Yii::t('frontend', 'Transfer or Reference Number')) ?>

                <?= $form->field($model,'fecha_pago')->widget(DatePicker::className(),[
                    'options' => ['placeholder' => 'Pulse para acceder al calendario...',
                    'class' => 'form-control'],
                    'language' => 'es', 
                    'clientOptions' => [
                        'defaultDate' => 'now', 
                        'dateFormat' => 'yy-mm-dd']
                    ])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">6</i></span>&nbsp'.Yii::t('frontend', 'Payment Date'))
                 ?>
        
            </div>

            <div class="col-sm-5">    

                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true, 'placeholder' => Yii::t('frontend', 'Name')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">7</i></span>&nbsp'.Yii::t('frontend', 'Name')) ?>

                <?= $form->field($model, 'apellido')->textInput(['maxlength' => true, 'placeholder' => Yii::t('frontend', 'Last Name')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">8</i></span>&nbsp'.Yii::t('frontend', 'Last Name')) ?>

                <?= $form->field($model, 'nro_cedula')->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => Yii::t('frontend', 'Identity Card')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">9</i></span>&nbsp'.Yii::t('frontend', 'Identity Card')) ?>

                <?= $form->field($model, 'cod_tipo_doc')->textInput(['placeholder' => Yii::t('frontend', 'Document Type')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">10</i></span>&nbsp'.Yii::t('frontend', 'Document Type')) ?>

                <?= $form->field($model, 'email')->widget(MaskedInput::className(), ['clientOptions' => ['alias' =>  'email']])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">11</i></span>&nbsp'.Yii::t('frontend', 'Email')) ?>

                <?= $form->field($model, 'nota_descrip_pago')->textArea(['rows' => 5, 'placeholder' => Yii::t('frontend', 'Note Description Payment')])->label('<span class="fa-stack"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-inverse fa-stack-1x">12</i></span>&nbsp'.Yii::t('frontend', 'Note Description Payment')) ?>

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