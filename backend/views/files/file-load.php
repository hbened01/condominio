<?php

use yii\helpers\Html;
use kartik\file\FileInput;
use yii\helpers\Url;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\OperacionesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Load and Process File');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="operaciones-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <div class="row">
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-cloud-upload"></i>

              <h3 class="box-title">Upload Document</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php $form = ActiveForm::begin(['id' => 'FileLoadForm','options' => ['enctype' => 'multipart/form-data']]); ?>
                        <br>
                        <?php
                            echo FileInput::widget([
                                'name' => 'file',
                            ]);
                                echo $form->field($model, 'file')->widget(FileInput::classname(), [
                                    'options'=>['accept'=>'image/*'],
                                    'pluginOptions'=>['allowedFileExtensions'=>['cvs']
                                ]);
                        ?>
                        <br>
                <?php ActiveForm::end(); ?>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <i class="glyphicons glyphicons-restart"></i>

              <h3 class="box-title">Process File</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
    </div>

</div>