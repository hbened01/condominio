<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */

$this->title = Yii::t('app', 'Actualizar {modelClass}: ', [
    'modelClass' => 'Pago ',
]) . $model->cd_pago_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Pagos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_pago_pk, 'url' => ['view', 'id' => $model->cd_pago_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Pagos'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_pago_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', '¿Está seguro que desar eliminar el pago?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-pagos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
        'propietarios' => $propietarios, 
    ]) ?>

</div>
