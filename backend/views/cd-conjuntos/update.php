<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConjuntos */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cd Conjuntos',
]) . $model->cd_conjuntos_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Conjuntos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_conjuntos_pk, 'url' => ['view', 'id' => $model->cd_conjuntos_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cd-conjuntos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
