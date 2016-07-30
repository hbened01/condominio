<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Mensajes */

$this->title = Yii::t('app', 'Crear Mensajes');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Mensajes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= Html::a(Yii::t('app', 'Lista de Mensajes'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="mensajes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
