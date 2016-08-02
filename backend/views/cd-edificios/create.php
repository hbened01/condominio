<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdEdificios */

$this->title = Yii::t('app', 'Crear Edificio');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Edificios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= Html::a(Yii::t('app', 'Lista de Edificios'), ['index'], ['class' => 'btn btn-info']); ?>
</p>

<div class="cd-edificios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
