<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\OperacionesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Operations');

?>
<div class="operaciones-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('backend', 'Create Operation'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'filterSelector' => 'select[name="per-page"]',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nombre',
            'descripcion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <div class="row-sm-5" align="left">
        <b> <?= Yii::t('backend', Html::encode('Quantity per page')) ?>:&nbsp<?php echo \nterms\pagesize\PageSize::widget(
                [   
                    'defaultPageSize' => 10,
                    'sizes' => [5 => 5, 10 => 10, 15 => 15, 20 => 20, 25 => 25, 50 => 50],
                    'label' => Yii::t('backend', Html::encode('Records')),
                ]
            ); ?>
        </b>        
    </div>
</div>
