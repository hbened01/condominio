<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Operaciones */

$this->title = Yii::t('app', 'Actualizar {modelClass}: ', [
    'modelClass' => 'Operación',
]) . $model->nombre;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Operaciones'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Operaciones'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->id], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', '¿Está seguro que desea eliminar la operación?'),
            'method' => 'post',
        ],
    ]) ?>
</p>
<div class="operaciones-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
