<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = Yii::t('frontend', 'payment update');
?>
<div class="cd-pagos-update">

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
    ]) ?>

</div>
