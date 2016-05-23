<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CdAguasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cd Aguas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-aguas-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cd Aguas', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_aguas_pk',
            'cod_apto',
            'cod_conjunto',
            'cod_edificio',
            'lect_ant',
            // 'lect_post',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
