<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConceptos */

$this->title = $model->descrip_concepto;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-conceptos-view">

    <p>
        <?= Html::a(Yii::t('backend', 'List of Concepts'), ['index'], ['class' => 'btn btn-info']) ?>
        <?= (in_array(Yii::$app->controller->id.'-update',$operaciones)) ? Html::a(Yii::t('backend', 'Update'), ['update', 'id' => $model->cd_conceptos_pk], ['class' => 'btn btn-primary']) : '' ?>
        <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->cd_conceptos_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('backend', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) : '' ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_conceptos_pk',
            'descrip_concepto',
            'tipo',
            'frecuencia',
        ],
    ]) ?>

</div>
