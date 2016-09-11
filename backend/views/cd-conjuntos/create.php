<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdConjuntos */

$this->title = Yii::t('backend', 'Create Set');

?>

<p>
    <?= Html::a(Yii::t('backend', 'List of Sets'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="cd-conjuntos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
