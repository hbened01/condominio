<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */

$this->title = Yii::t('backend', 'Create Payment');

?>

<p>
    <?= Html::a(Yii::t('backend', 'List of Payments'), ['index'], ['class' => 'btn btn-info']); ?>
</p>

<div class="cd-pagos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
        'propietarios' => $propietarios, 
    ]) ?>

</div>
