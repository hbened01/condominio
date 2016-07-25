<?php

use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\widgets\MaskedInput;

$this->title = 'Actualización usuario';
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
            <h2><?= Html::encode('Registre sus Datos Personales') ?></h2>
            <p class="lead"><i class="glyphicons glyphicons-notes-2"></i><?= '&nbsp'.Html::encode('  Nota: "Asegurese que la data introducida es correcta, ya que luego de guardar no podrá realizar de nuevo esta acción"') ?></p>
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

                <?= $form->field($model, 'nro_piso')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'quien_vive')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'direccion')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'direccion_cobro')->textInput(['maxlength' => true]) ?>

            </div>

            <div class="col-sm-4 col-sm-offset-5">
                <br><br>
                <?= Html::submitButton('Actualizar Datos', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'data' => [
            'confirm' => Yii::t('frontend', 'Está seguro de que los datos introducidos son correctos? Verificar antes de continuar ...')]]) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div><!--/.row-->
        <br>
        <br>
        <br>
    </div><!--/.container-->
</section><!--/#contact-page-->