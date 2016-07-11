<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConjuntos */

$this->title = 'Actualizar Conjuntos: ' . $model->nombre;
$this->params['breadcrumbs'][] = ['label' => 'Conjuntos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_conjuntos_pk, 'url' => ['view', 'id' => $model->cd_conjuntos_pk]];
$this->params['breadcrumbs'][] = 'Actualizar';

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Conjuntos'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_conjuntos_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>

<div class="cd-conjuntos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
