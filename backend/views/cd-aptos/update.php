<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdAptos */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cd Aptos',
]) . $model->cd_aptos_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Aptos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_aptos_pk, 'url' => ['view', 'cd_aptos_pk' => $model->cd_aptos_pk, 'cod_edificio' => $model->cod_edificio]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cd-aptos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
