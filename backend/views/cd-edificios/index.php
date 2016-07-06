<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdEdificiosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Cd Edificios');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-edificios-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Cd Edificios'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_edificios_pk',
            'cod_conjunto',
            'nombre_edificio',
            'nombre_concerje',
            'telf_concerje',
            // 'porcentaje_nro1',
            // 'email_edificio:email',
            // 'porcentaje_nro2',
            // 'agua',
            // 'fondo_nro1',
            // 'fondo_nro2',
            // 'fondo_nro3',
            // 'fondo_nro4',
            // 'fondo_nro5',
            // 'fondo_nro6',
            // 'fondo_nro7',
            // 'fondo_nro8',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
