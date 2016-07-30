<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Mensajes */

$this->title = 'Mensaje N° '.$model->cd_mensajes_pk;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Mensajes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="mensajes-view">

    <p>
        <?= Html::a(Yii::t('app', 'Lista de Mensajes'), ['index'], ['class' => 'btn btn-info']) ?>
        <?= (in_array(Yii::$app->controller->id.'-update',$operaciones)) ? Html::a(Yii::t('app', 'Actualizar'), ['update', 'id' => $model->cd_mensajes_pk], ['class' => 'btn btn-primary']) : '' ?>
        <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_mensajes_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', '¿Está seguro(a) de elimanar este mensaje?'),
                'method' => 'post',
            ],
        ]) : '' ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_mensajes_pk',
            'texto:ntext',
            'msn_default:boolean',
        ],
    ]) ?>

</div>
