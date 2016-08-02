<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */

$this->title = Yii::t('app', 'Actualizar {modelClass}: ', [
    'modelClass' => 'Edificio',
]) . $model->nombre_edificio;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Edificios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_edificios_pk, 'url' => ['view', 'id' => $model->cd_edificios_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Edificios'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_edificios_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', '¿Está seguro que desar eliminar el edificio?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-edificios-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
