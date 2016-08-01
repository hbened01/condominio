<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cd Pagos',
]) . $model->cd_pago_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Pagos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_pago_pk, 'url' => ['view', 'id' => $model->cd_pago_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cd-pagos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
