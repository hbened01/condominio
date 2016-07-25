<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\models\CdPagos */

$this->title = 'Create Cd Pagos';
$this->params['breadcrumbs'][] = ['label' => 'Cd Pagos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-pagos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
