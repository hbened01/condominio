<?php
/* @var $this yii\web\View */
/* @var $searchModel frontend\models\CdPagosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

use frontend\assets\CorlateAsset;
use yii\helpers\Html;
use yii\grid\GridView;

CorlateAsset::register($this);

$this->title = 'Cd Pagos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php //var_dump($dataProvider->getModels()); ?>

    <p>
        <?= Html::a(Yii::t('frontend', 'Create Cd Pagos'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

               'cd_pago_pk',
               'cod_edificio',
               'cod_apto',
               'cod_factura', 
               'cod_tipo_pago',
               'nro_transferencia_referencia',
               // 'nro_transferencia_referencia',
               // 'fecha_pago',
               // 'nota_descrip_pago',
               // 'nombre',
     
               // 'nro_cedula',
               // 'cod_tipo_doc',
               // 'email:email',
               // 'estatus_pago:boolean', 

            ['class' => 'yii\grid\ActionColumn',
            'template' => '{view} {update}'],
        ],
    ]); ?>
</div>
