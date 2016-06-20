<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Roles */

$this->title = Yii::t('app', 'Crear Rol');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Roles'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Roles'), ['index'], ['class' => 'btn btn-info']); ?>
</p>
<div class="roles-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'tipoOperaciones' => $tipoOperaciones,
        'titulo' => $this->title
    ]) ?>

</div>
