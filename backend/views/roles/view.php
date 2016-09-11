<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Roles */

$this->title = Yii::t('backend', 'Data from {modelClass}: ', [
    'modelClass' => 'Rol',
]) . $model->nombre;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>

<p>
    <?= Html::a(Yii::t('backend', 'List of Roles'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-update',$operaciones) && Yii::$app->user->identity->rol_id != $model->id && $model->id != 3) ? Html::a(Yii::t('backend', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones) && Yii::$app->user->identity->rol_id != $model->id && $model->id != 3) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->id], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('backend', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="roles-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'nombre',
        ],
    ]) ?>
    
   <section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box">
                <div class="box-header with-border">
                    <h2 class="box-title"><strong><?= Yii::t('backend', 'Permitted operations') ?></strong></h2>
                </div>
                <div class="box-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 10%">Id</th>
                                <th><?= Yii::t('backend', 'Name') ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                foreach ($model->operacionesPermitidasList as $operacionPermitida) {
                                    echo "<tr><td>".$operacionPermitida['id'] . "</td><td>".$operacionPermitida['descripcion'] . "</td></tr>";
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
