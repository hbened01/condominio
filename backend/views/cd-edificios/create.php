<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */

$this->title = Yii::t('app', 'Create Cd Edificios');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Edificios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-edificios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
