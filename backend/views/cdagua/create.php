<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CdAguas */

$this->title = 'Create Cd Aguas';
$this->params['breadcrumbs'][] = ['label' => 'Cd Aguas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-aguas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
