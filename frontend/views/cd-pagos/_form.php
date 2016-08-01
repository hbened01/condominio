<?php

use frontend\models\CdTiposPagos;
use frontend\models\CdTiposDocs;
use frontend\assets\CorlateAsset;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\jui\DatePicker;
use yii\widgets\MaskedInput;

$this->title = Yii::t('frontend', 'Payment Record');
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
            <h2><?= Html::encode(Yii::t('frontend', 'Register your payment according to data requested')) ?></h2>
            <p class="lead"><i class="glyphicons glyphicons-notes-2"></i><?= '&nbsp'.Html::encode(Yii::t('frontend', 'Note: "Default owner information that has started secion for registration payment be brought if the payment it has made another record this data as name, surname among others"')) ?></p>
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

                <?= $form->field($model, 'cod_factura')->dropdownList(ArrayHelper::map($data, 'id', 'descripcion'), ['prompt'=> Yii::t('frontend', 'Select...')]); ?>

                <?= $form->field($model, 'cod_tipo_pago')->dropdownList(CdTiposPagos::find()->select(['descrip_pago', 'cd_tipo_pago_pk'])->indexBy('cd_tipo_pago_pk')->column(), ['prompt'=> Yii::t('frontend', 'Select...')]); ?>
            
                <?= $form->field($model, 'nro_referencia')->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => Yii::t('frontend', 'Enter Number of Transfer or Deposit')])->label() ?>

                <?= $form->field($model,'fecha_pago')->widget(DatePicker::className(),[
                    'options' => ['placeholder' => Yii::t('frontend', 'Press to Access the Calendar ...'),
                    'class' => 'form-control'],
                    'language' => 'es', 
                    'clientOptions' => [
                        'defaultDate' => 'now', 
                        'dateFormat' => 'yy-mm-dd']
                    ])->label()
                 ?>

                 <?= $form->field($model, 'nota_pago')->textArea(['rows' => 5, 'placeholder' => Yii::t('frontend', 'Note Description Payment')])->label() ?>
        
            </div>

            <div class="col-sm-5">    

                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true, 'placeholder' => Yii::t('frontend', 'Name')])->label() ?>

                <?= $form->field($model, 'apellido')->textInput(['maxlength' => true, 'placeholder' => Yii::t('frontend', 'Last Name')])->label() ?>

                <?= $form->field($model, 'email')->widget(MaskedInput::className(), ['clientOptions' => ['alias' =>  'email']])->label() ?>

            </div>

            <div class="row-sm-5"> 

                <div class="col-sm-1"> 

                    <?= $form->field($model, 'cod_tipo_doc')->dropdownList(CdTiposDocs::find()->select(['tipo_doc' , 'cd_tipo_doc_pk'])->indexBy('cd_tipo_doc_pk')->column())->label(Yii::t('frontend', 'Doc.')); ?>

                </div>
                
                <div class="col-sm-4"> 
            
                    <?= $form->field($model, 'nro_cedula')->textInput(['autofocus' => true, 'class' => 'form-control', 'placeholder' => Yii::t('frontend', 'Identity Card')])->label() ?>

                </div>

            </div>

            <div class="col-sm-4 col-sm-offset-6">
                <br><br>
                <?= Html::submitButton($model->isNewRecord ? Yii::t('frontend', 'Payment Register') : Yii::t('frontend', 'Payment Update'), ['class' => $model->isNewRecord ? 'btn btn-danger' : 'btn btn-danger', 'data' => [
            'confirm' => Yii::t('frontend', 'It is sure that the data entered is correct? Check before continuing ...')]]) ?>
                <?= Html::a(Yii::t('frontend', 'Return'), ['cd-pagos/'], ['class' => 'btn btn-success']); ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->