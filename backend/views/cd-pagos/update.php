<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => Yii::t('backend', 'Payment'),
]) . $model->cd_pago_pk;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');


?>
<p>
    <?= Html::a(Yii::t('backend', 'List of Payments'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->cd_pago_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('backend', 'Sure you want to delete the payment?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-pagos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
        'propietarios' => $propietarios, 
    ]) ?>

</div>
