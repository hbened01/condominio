<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\CdAguas */

$this->title = $model->cd_aguas_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Aguas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-aguas-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->cd_aguas_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->cd_aguas_pk], [
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
            'cd_aguas_pk',
            'cod_apto',
            'cod_conjunto',
            'cod_edificio',
            'lect_ant',
            'lect_post',
        ],
    ]) ?>

</div>
