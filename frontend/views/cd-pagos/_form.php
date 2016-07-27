<?php

//use yii\widgets\ActiveForm;
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\jui\DatePicker;
use yii\widgets\MaskedInput;
use kartik\widgets\FileInput;
use yii\helpers\ArrayHelper;
use frontend\models\CdTiposPagos;

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

                <?= $form->field($model, 'cod_factura')->textInput(['placeholder' => Yii::t('frontend', 'Seleccione...')])->label() ?>

                <?= $form->field($model, 'cod_tipo_pago')->textInput(['placeholder' => Yii::t('frontend', 'Seleccione...')])->label() ?>
                
                <?= Html::activeLabel($model, 'cod_tipo_pago'); ?>
                <?= Html::activeDropDownList($model, 'cod_tipo_pago', ArrayHelper::map(CdTiposPagos::find()->all(), 'cd_tipo_pago_pk', 'descrip_pago'), ['autofocus' => true, 'class' => 'form-control', 'prompt' => Yii::t('frontend', 'Seleccione...'), 'label' => 'Tipo de Pago']) ?>
                <?= Html::error($model, 'cod_tipo_pago'); ?>
            
                <?= $form->field($model, 'nro_referencia')->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => 'Introduzca número de transferencia ó depósito'])->label() ?>

                <?= $form->field($model,'fecha_pago')->widget(DatePicker::className(),[
                    'options' => ['placeholder' => 'Pulse para acceder al calendario...',
                    'class' => 'form-control'],
                    'language' => 'es', 
                    'clientOptions' => [
                        'defaultDate' => 'now', 
                        'dateFormat' => 'yy-mm-dd']
                    ])->label()
                 ?>

                 <?= $form->field($model, 'descrip_pago')->textArea(['rows' => 5, 'placeholder' => Yii::t('frontend', 'Note Description Payment')])->label() ?>
        
            </div>

            <div class="col-sm-5">    

                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true, 'placeholder' => Yii::t('frontend', 'Name')])->label() ?>

                <?= $form->field($model, 'apellido')->textInput(['maxlength' => true, 'placeholder' => Yii::t('frontend', 'Last Name')])->label() ?>

                <?= $form->field($model, 'nro_cedula')->input('number', ['autofocus' => true, 'class' => 'form-control', 'placeholder' => Yii::t('frontend', 'Identity Card')])->label() ?>

                <?= $form->field($model, 'cod_tipo_doc')->textInput(['placeholder' => Yii::t('frontend', 'Document Type')])->label() ?>

                <?= $form->field($model, 'email')->widget(MaskedInput::className(), ['clientOptions' => ['alias' =>  'email']])->label() ?>

            </div>

            <div class="col-sm-4 col-sm-offset-6">
                <br><br>
                <?= Html::submitButton($model->isNewRecord ? Yii::t('frontend', 'Registrar Pago') : Yii::t('frontend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'data' => [
            'confirm' => Yii::t('frontend', 'Está seguro de que los datos introducidos son correctos? Verificar antes de continuar ...')]]) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->