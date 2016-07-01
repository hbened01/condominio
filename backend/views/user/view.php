<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\User */
$asset = backend\assets\DashboardAsset::register($this);
$baseUrl = $asset->baseUrl;
$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-view">

    <p>
        <?= Html::a(Yii::t('app', 'Lista de Usuarios'), ['index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a(Yii::t('app', 'Actualizar'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            // 'auth_key',
            // 'password_hash',
            // 'password_reset_token',
            'email:email',
            'status',
            'created_at',
            'updated_at',
            [
                'label' => 'Rol',
                'value'=> $model->rol($model->rol_id),

            ],
        ],
    ]) ?>

</div>
<button type="button" class="btn btn-warning pull-right" id="btn-passwd"><i class="fa fa-key" aria-hidden="true"></i></button>

<!-- Modal -->
<div class="modal fade" id="modal-passwd" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Asignar Password Nuevo</h4>
            </div>
            <div class="modal-body">
                <?php $form = ActiveForm::begin(['action' => false,'id' => 'form-pass']); ?>
                    <?= $form->field($model, 'id')->hiddenInput(['value' => $model->id])->label(false) ?>
                    <?= $form->field($model, 'password')->passwordInput(['placeholder' => 'Escriba nuevo password'])->label(false) ?>
                <?php ActiveForm::end(); ?>
            </div>
            <div class="modal-footer">
                    <div id="btn-model">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="btn-asignar-pass">Asignar</button>
                    </div>
                    <div id="img-loading" class="text-center hide">
                            <?= Html::img($baseUrl.'/dist/img/loading.gif', ['width' => 35]);?>
                    </div>
            </div>
        </div>
    <!-- /.modal-content -->
    </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

