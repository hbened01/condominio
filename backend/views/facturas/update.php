<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Facturas */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => Yii::t('backend', 'Invoice'),
]) . $model->cd_factura_pk;
?>
<div class="facturas-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
