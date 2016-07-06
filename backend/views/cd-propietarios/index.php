<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdPropietariosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Cd Propietarios');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-propietarios-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Cd Propietarios'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_propietarios_pk',
            'cod_user',
            'nro_piso',
            'nombre',
            'apellido',
            // 'nro_cedula',
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
