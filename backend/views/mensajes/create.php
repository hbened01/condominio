<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Mensajes */

$this->title = Yii::t('backend', 'Create Message');

?>

<p>
    <?= Html::a(Yii::t('backend', 'List of Messages'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="mensajes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
