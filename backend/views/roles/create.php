<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Roles */

$this->title = Yii::t('backend', 'Create Rol');
?>
<p>
    <?= Html::a(Yii::t('backend', 'List of Roles'), ['index'], ['class' => 'btn btn-info']); ?>
</p>
<div class="roles-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'tipoOperaciones' => $tipoOperaciones,
        'titulo' => $this->title
    ]) ?>

</div>
