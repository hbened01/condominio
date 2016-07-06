<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = Yii::t('app', 'Create Cd Propietarios');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Propietarios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cd-propietarios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
