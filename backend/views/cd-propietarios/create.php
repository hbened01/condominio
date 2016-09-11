<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = Yii::t('backend', 'Create Owner');

?>

<p>
    <?= Html::a(Yii::t('backend', 'Owners list'), ['index'], ['class' => 'btn btn-info']) ?>
</p>

<div class="cd-propietarios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
