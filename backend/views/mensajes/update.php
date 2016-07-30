<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Mensajes */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Mensajes',
]) . $model->cd_mensajes_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Mensajes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_mensajes_pk, 'url' => ['view', 'id' => $model->cd_mensajes_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="mensajes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
