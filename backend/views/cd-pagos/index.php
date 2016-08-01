<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdPagosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Cd Pagos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Cd Pagos'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'cd_pago_pk',
            'cod_factura',
            'cod_tipo_pago',
            'nro_referencia',
            'fecha_pago',
            // 'nota_pago',
            // 'nombre',
            // 'apellido',
            // 'nro_cedula',
            // 'cod_tipo_doc',
            // 'email:email',
            // 'estatus_pago:boolean',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
