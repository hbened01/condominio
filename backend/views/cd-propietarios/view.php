<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = $model->cd_propietarios_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Propietarios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-propietarios-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->cd_propietarios_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->cd_propietarios_pk], [
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
            'cd_propietarios_pk',
            'cod_user',
            'nro_piso',
            'nombre',
            'apellido',
            'nro_cedula',
            'telf_local',
            'telf_celular',
            'fax',
            'alicuota',
            'quien_vive',
            'direccion',
            'direccion_cobro',
        ],
    ]) ?>

</div>
