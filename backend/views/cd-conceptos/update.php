<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdConceptos */

$this->title = Yii::t('backend', 'Update Concept').' : '.$model->descrip_concepto;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('backend', 'List of Concepts'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->cd_conceptos_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('backend', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-conceptos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
