<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\User */
$asset = backend\assets\DashboardAsset::register($this);
$baseUrl = $asset->baseUrl;
$this->title = $model->username;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="user-view">

    <p>
        <?= Html::a(Yii::t('backend', 'User Lists'), ['index'], ['class' => 'btn btn-info']) ?>
        <?= (in_array(Yii::$app->controller->id.'-update',$operaciones)) ? Html::a(Yii::t('backend', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) : '' ?>
        <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones) && Yii::$app->user->identity->rol_id != $model->id) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) : '' ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= DetailView::widget([
        'model' => $model,
        'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('backend', 'THERE IS NO DATA').')</span>',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbsp'.Yii::t('backend', 'Not Active User').'', '<span class="glyphicon glyphicon-ok"></span> &nbsp'.Yii::t('backend', 'Active User').''],
                    'dateFormat' => 'dd-MM-Y',
                    'datetimeFormat' => 'dd-MM-Y H:i:s',
                    'timeFormat' => 'H:i:s',
                ],
        'attributes' => [
            'id',
            'username',
            // 'auth_key',
            // 'password_hash',
            // 'password_reset_token',
            'email:email',
            'status:boolean',
            'created_at:date',
            'updated_at:date',
            [
                'label' => 'Rol',
                'value'=> $model->rol($model->rol_id),

            ],
        ],
    ]) ?>

</div>
<button type="button" class="btn btn-warning pull-right" id="btn-passwd"><i class="glyphicons glyphicons-keys" aria-hidden="true"></i></button>

<!-- Modal -->
<div class="modal fade" id="modal-passwd" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Asignar Password Nuevo</h4>
            </div>
            <div class="modal-body">
                <?php $form = ActiveForm::begin(['action' => false,'id' => 'form-pass']); ?>
                    <?= $form->field($model, 'id')->hiddenInput(['value' => $model->id])->label(false) ?>
                    <?= $form->field($model, 'password')->passwordInput(['placeholder' => 'Escriba nuevo password'])->label(false) ?>
                <?php ActiveForm::end(); ?>
                <!-- <div class="alert alert-danger">

                </div> -->
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

