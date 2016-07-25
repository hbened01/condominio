<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = $model->cd_pago_pk;
$this->params['breadcrumbs'][] = ['label' => 'Cd Pagos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->cd_pago_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->cd_pago_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_pago_pk',
            'cod_edificio',
            'cod_apto',
            'cod_tipo_pago',
            'nro_transferencia_referencia',
            'fecha_pago',
            'nota_descrip_pago',
            'nombre',
            'apellido',
            'nro_cedula',
            'cod_tipo_doc',
            'email:email',
        ],
    ]) ?>

</div>
