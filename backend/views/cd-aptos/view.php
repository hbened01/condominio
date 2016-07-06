<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdAptos */

$this->title = $model->cd_aptos_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Aptos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-aptos-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'cd_aptos_pk' => $model->cd_aptos_pk, 'cod_edificio' => $model->cod_edificio], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'cd_aptos_pk' => $model->cd_aptos_pk, 'cod_edificio' => $model->cod_edificio], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_aptos_pk',
            'cod_propietario',
            'cod_edificio',
        ],
    ]) ?>

</div>
