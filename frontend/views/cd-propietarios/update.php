<?php

use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\widgets\MaskedInput;

$this->title = 'actualización usuario';
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
            <h2><?= Html::encode(Yii::t('frontend', 'Register your Personal Data')) ?></h2>
            <p class="lead"><i class="glyphicons glyphicons-notes-2"></i><?= '&nbsp'.Html::encode(Yii::t('frontend', 'Note: "Make sure the data entered is correct, since after saving can not perform this action again"')) ?></p>
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

                <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'nro_cedula')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'telf_local')->widget(MaskedInput::className(), ['mask' => '(9999)-999-99-99']) ?>

                <?= $form->field($model, 'telf_celular')->widget(MaskedInput::className(), ['mask' => '(9999)-999-99-99']) ?>
        
            </div>

            <div class="col-sm-5">

                <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'nro_piso')->textInput([/*'style'=>"display:none",*/ 'maxlength' => true]) ?>
               
                <?= $form->field($model, 'quien_vive')->radioList(array(true => '<span class="glyphicon glyphicon-ok"></span>&nbsp'.Yii::t('frontend', 'YES, I AM LIVING IN THIS PROPERTY').'.', false => '<span class="glyphicon glyphicon-remove"></span>&nbsp'.Yii::t('frontend', 'NO, CURRENTLY I LIVE IN ANOTHER PROPERTY').'.'))->label(Yii::t('frontend', 'You Reside?')); ?>

                <div id="address" style="display:none">

                    <?= $form->field($model, 'direccion')->textArea(['rows' => 3]) ?>

                    <?= $form->field($model, 'direccion_cobro')->textArea(['rows' => 3]) ?>
                
                </div>

            </div>

            <div class="col-sm-4 col-sm-offset-5">
                <br><br>
                <?= Html::submitButton(Yii::t('frontend', 'Update Data'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'data' => [
            'confirm' => Yii::t('frontend', 'It is sure that the data entered is correct? Check before continuing ...')]]) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->