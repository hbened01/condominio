<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cd Edificios',
]) . $model->cd_edificios_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Edificios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_edificios_pk, 'url' => ['view', 'id' => $model->cd_edificios_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cd-edificios-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>