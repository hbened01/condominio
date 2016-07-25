<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = 'Update Cd Pagos: ' . $model->cd_pago_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Pagos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_pago_pk, 'url' => ['view', 'id' => $model->cd_pago_pk]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cd-pagos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
