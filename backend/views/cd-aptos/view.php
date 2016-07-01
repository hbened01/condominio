<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdAptos */

$this->title = $model->cd_aptos_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Aptos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-aptos-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->cd_aptos_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->cd_aptos_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_aptos_pk',
            'cod_propietario',
        ],
    ]) ?>

</div>
