<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => Yii::t('backend', 'Owner'),
]) . $model->nombre.' '.$model->apellido;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<p>
    <?= Html::a(Yii::t('backend', 'Owners list'), ['index'], ['class' => 'btn btn-info']); ?>
    <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->cd_propietarios_pk], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => Yii::t('backend', 'Are you sure you want to delete this item?'),
            'method' => 'post',
        ],
    ]) : '' ?>
</p>
<div class="cd-propietarios-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
