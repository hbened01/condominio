<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Roles */

$this->title = Yii::t('app', 'Datos del {modelClass}: ', [
    'modelClass' => 'Rol',
]) . $model->nombre;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Roles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

    <p>
        <?= Html::a(Yii::t('app', 'Lista de Roles'), ['index'], ['class' => 'btn btn-info']); ?>
        <?= Html::a(Yii::t('app', 'Actualizar Rol'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Eliminar Rol'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
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
    
    <h2>Operaciones Permitidas</h2>
    <?php
 
        foreach ($model->operacionesPermitidasList as $operacionPermitida) {
            echo $operacionPermitida['nombre'] . "<br>";
        }
 
    ?>

</div>
