<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdAptos */

$this->title = 'Create Cd Aptos';
$this->params['breadcrumbs'][] = ['label' => 'Cd Aptos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-aptos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
