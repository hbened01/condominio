<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */

$this->title = $model->cd_pago_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Pagos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->cd_pago_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->cd_pago_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_pago_pk',
            'cod_factura',
            'cod_tipo_pago',
            'nro_referencia',
            'fecha_pago',
            'nota_pago',
            'nombre',
            'apellido',
            'nro_cedula',
            'cod_tipo_doc',
            'email:email',
            'estatus_pago:boolean',
        ],
    ]) ?>

</div>
