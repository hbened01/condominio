<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConjuntos */

$this->title = $model->cd_conjuntos_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Conjuntos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-conjuntos-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->cd_conjuntos_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->cd_conjuntos_pk], [
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
            'cd_conjuntos_pk',
            'nombre',
            'direccion',
        ],
    ]) ?>

</div>
