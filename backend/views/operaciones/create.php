<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Operaciones */

$this->title = Yii::t('app', 'Create Operaciones');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Operaciones'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<p>
    <?= Html::a(Yii::t('app', 'Lista de Operaciones'), ['index'], ['class' => 'btn btn-info']); ?>
</p>
<div class="operaciones-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
