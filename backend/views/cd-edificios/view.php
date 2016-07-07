<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */

$this->title = $model->cd_edificios_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Edificios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-edificios-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->cd_edificios_pk], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->cd_edificios_pk], [
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
            'cd_edificios_pk',
            'cod_conjunto',
            'nombre_edificio',
            'nombre_concerje',
            'telf_concerje',
            'porcentaje_nro1',
            'email_edificio:email',
            'porcentaje_nro2',
            'agua',
            'fondo_nro1',
            'fondo_nro2',
            'fondo_nro3',
            'fondo_nro4',
            'fondo_nro5',
            'fondo_nro6',
            'fondo_nro7',
            'fondo_nro8',
        ],
    ]) ?>

</div>
