<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdPagos */

$this->title = Yii::t('app', 'Crear Pago');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Pagos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= Html::a(Yii::t('app', 'Lista de Pagos'), ['index'], ['class' => 'btn btn-info']); ?>
</p>

<div class="cd-pagos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
        'propietarios' => $propietarios, 
    ]) ?>

</div>
