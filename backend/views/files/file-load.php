<?php

use yii\helpers\Html;
use kartik\file\FileInput;
use yii\helpers\Url;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\OperacionesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Carga y Procesamiento de Facturas');
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="operaciones-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <div class="row">
        <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-cloud-upload"></i>

              <h3 class="box-title">Carga del Archivo de Facturas</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php $form = ActiveForm::begin(['id' => 'FileLoadForm','options' => ['enctype' => 'multipart/form-data']]); ?>
                        <label class="control-label">Selecione archivo</label>
                        <?php   
                                echo $form->field($model, 'file')->widget(FileInput::classname(), [ 
                                      'options' => ['multiple' => true],
                                      'pluginOptions' => [
                                                  'browseIcon' => '<i class="glyphicons glyphicons-file-import"></i> ',
                                                  'showPreview' => true,
                                                  'showCaption' => true,
                                                  'showRemove' => true,
                                                  'showUpload' => true,
                                                  'filename'=>'copiacondc',
                                                  'browseLabel' =>  'Buscar Archivo',
                                                  'uploadUrl' => Url::to(['files/file-process']),
                                                  'allowedFileExtensions'=>['csv'],
                                                  'language' => 'es',
                                                  'maxFileCount' => 5
                                                  ]
                                      ]
                                )->label(false);
                        ?>
                <?php ActiveForm::end(); ?>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <?php if (in_array('files-load-invoices',$operaciones)): ?>
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-restart"></i>

              <h3 class="box-title">Process File</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <br><br>
                  <!-- <button type="button" class="btn btn-block btn-primary btn-lg col-md-4">Procesar Archivo</button> -->
                  <?= Html::a(Yii::t('app', 'Procesar Archivo'), ['load-invoices'], ['class' => 'btn btn-block btn-primary btn-lg col-md-4']) ?>
                <br><br><br><br>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <?php endif; ?>
    </div>

</div>