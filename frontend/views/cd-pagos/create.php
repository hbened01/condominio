<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = Yii::t('frontend', 'Create Cd Pagos');
$this->params['breadcrumbs'][] = ['label' => Yii::t('frontend', 'Cd Pagos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
    ]) ?>

</div>
