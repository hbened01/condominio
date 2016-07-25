<?php
use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\grid\GridView;

CorlateAsset::register($this);
/* @var $this yii\web\View */
/* @var $searchModel frontend\models\CdPagosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cd Pagos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Cd Pagos', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_pago_pk',
            'cod_edificio',
            'cod_apto',
            'cod_tipo_pago',
            'nro_transferencia_referencia',
            // 'fecha_pago',
            // 'nota_descrip_pago',
            // 'nombre',
            // 'apellido',
            // 'nro_cedula',
            // 'cod_tipo_doc',
            // 'email:email',

            ['class' => 'yii\grid\ActionColumn',
            'template' => '{view} {update}'],
        ],
    ]); ?>
</div>
