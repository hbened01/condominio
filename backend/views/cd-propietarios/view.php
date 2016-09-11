<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = $model->nombre.' '.$model->apellido;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-propietarios-view">

    <p>
        <?= Html::a(Yii::t('backend', 'Owners list'), ['index'], ['class' => 'btn btn-info']) ?>
        <?= (in_array(Yii::$app->controller->id.'-update',$operaciones)) ? Html::a(Yii::t('backend', 'Update'), ['update', 'id' => $model->cd_propietarios_pk], ['class' => 'btn btn-primary']) : '' ?>
        <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('backend', 'Delete'), ['delete', 'id' => $model->cd_propietarios_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('backend', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) : '' ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('backend', 'THERE IS NO DATA').')</span>',
                    'booleanFormat' => ['<span class="glyphicon glyphicon-remove"></span> &nbsp'.Yii::t('backend', 'Not Active').'', '<span class="glyphicon glyphicon-ok"></span> &nbsp'.Yii::t('backend', 'Active').''],
                    'dateFormat' => 'dd-MM-Y',
                    'datetimeFormat' => 'dd-MM-Y H:i:s',
                    'timeFormat' => 'H:i:s',
        ],
        'attributes' => [
            'cd_propietarios_pk',
            [
                'label' => Yii::t('backend', 'User'),
                'value'=> $model->usuario($model->cod_user),

            ],
            'nro_piso',
            'nombre',
            'apellido',
            'nro_cedula',
            'telf_local',
            'telf_celular',
            'email:email',
            'alicuota',
            'quien_vive:boolean',
            'direccion',
            'direccion_cobro',
            'update_usr:boolean',
        ],
    ]) ?>

</div>
