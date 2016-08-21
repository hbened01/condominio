<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Facturas */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Facturas',
]) . $model->cd_factura_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Facturas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_factura_pk, 'url' => ['view', 'id' => $model->cd_factura_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="facturas-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
