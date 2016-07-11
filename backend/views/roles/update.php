<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Roles */

$this->title = Yii::t('app', 'Actualizar {modelClass}: ', [
    'modelClass' => 'Rol',
]) . $model->nombre;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Roles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Roles'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones) && Yii::$app->user->identity->rol_id != $model->id) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->id], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="roles-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'tipoOperaciones' => $tipoOperaciones
    ]) ?>

</div>
