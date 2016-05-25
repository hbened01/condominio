<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdConjuntos */

$this->title = 'Create Cd Conjuntos';
$this->params['breadcrumbs'][] = ['label' => 'Cd Conjuntos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-conjuntos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
