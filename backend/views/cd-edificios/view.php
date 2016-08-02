<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */

$this->title = 'Edificio: '.$model->nombre_edificio;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Vista Edificio'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>

<p>
    <?= Html::a(Yii::t('app', 'Lista de Edificios'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-update',$operaciones)) ? Html::a(Yii::t('app', 'Actualizar'), ['update', 'id' => $model->cd_edificios_pk], ['class' => 'btn btn-primary']) : '' ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_edificios_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-edificios-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_edificios_pk',
            [
                'attribute' => 'conjunto',
                'label' => 'Conjunto',
                'value' => $model->conjunto($model->cod_conjunto)
            ],
            'nombre_edificio',
            'nombre_concerje',
            'telf_concerje',
            // 'porcentaje_nro1',
            'email_edificio:email',
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
        ],
    ]) ?>

</div>
