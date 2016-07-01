<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdAptos */

$this->title = 'Update Cd Aptos: ' . $model->cd_aptos_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Aptos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_aptos_pk, 'url' => ['view', 'id' => $model->cd_aptos_pk]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cd-aptos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
