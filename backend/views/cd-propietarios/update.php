<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = 'Update Cd Propietarios: ' . $model->cd_propietarios_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Propietarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cd_propietarios_pk, 'url' => ['view', 'id' => $model->cd_propietarios_pk]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cd-propietarios-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
