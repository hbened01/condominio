<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cd Propietarios',
]) . $model->cd_propietarios_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Propietarios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_propietarios_pk, 'url' => ['view', 'id' => $model->cd_propietarios_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cd-propietarios-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
