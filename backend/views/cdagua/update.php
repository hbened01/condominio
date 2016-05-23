<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\CdAguas */

$this->title = 'Update Cd Aguas: ' . $model->cd_aguas_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Aguas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_aguas_pk, 'url' => ['view', 'id' => $model->cd_aguas_pk]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cd-aguas-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
