<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdConceptos */

$this->title = Yii::t('app', 'Crear Concepto');
$this->params['breadcrumbs'][] = ['label' => 'Cd Conceptos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<p>
    <?= Html::a(Yii::t('app', 'Lista de Conceptos'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="cd-conceptos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
