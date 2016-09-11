<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = Yii::t('backend', 'Create User');
?>

<p>
    <?= Html::a(Yii::t('backend', 'User Lists'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="user-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
