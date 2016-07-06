<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConceptos */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cd Conceptos',
]) . $model->cd_conceptos_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Conceptos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_conceptos_pk, 'url' => ['view', 'id' => $model->cd_conceptos_pk]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cd-conceptos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
