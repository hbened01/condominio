<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = Yii::t('frontend', 'create payment');
?>
<div class="cd-pagos-create">

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
    ]) ?>

</div>
