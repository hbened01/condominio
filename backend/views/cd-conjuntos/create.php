<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdConjuntos */

$this->title = Yii::t('app', 'Crear Conjunto');
$this->params['breadcrumbs'][] = ['label' => 'Cd Conjuntos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= Html::a(Yii::t('app', 'Lista de Conjuntos'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="cd-conjuntos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
