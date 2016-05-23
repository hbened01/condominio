<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CdConjuntosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cd Conjuntos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-conjuntos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cd Conjuntos', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_conjuntos_pk',
            'nombre',
            'direccion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
