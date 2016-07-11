<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = Yii::t('app', 'Actualizar {modelClass}: ', [
    'modelClass' => 'Propietario',
]) . $model->nombre.' '.$model->apellido;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Propietarios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_propietarios_pk, 'url' => ['view', 'id' => $model->cd_propietarios_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Propietarios'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_propietarios_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-propietarios-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
