<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdConceptos */

$this->title = Yii::t('backend', 'Create Concept');

?>

<p>
    <?= Html::a(Yii::t('backend', 'List of Concepts'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="cd-conceptos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
