<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdPropietariosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cd Propietarios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-propietarios-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cd Propietarios', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_propietarios_pk',
            'cod_conjunto',
            'cod_edificio',
            'nro_piso',
            'nombre',
            // 'apellido',
            // 'telf_local',
            // 'telf_celular',
            // 'fax',
            // 'alicuota',
            // 'quien_vive',
            // 'direccion',
            // 'direccion_cobro',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
