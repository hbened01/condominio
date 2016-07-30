<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CdPropietarios */

$this->title = $model->nombre.' '.$model->apellido;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cd Propietarios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-propietarios-view">

    <p>
        <?= Html::a(Yii::t('app', 'Lista de Propietarios'), ['index'], ['class' => 'btn btn-info']) ?>
        <?= (in_array(Yii::$app->controller->id.'-update',$operaciones)) ? Html::a(Yii::t('app', 'Actualizar'), ['update', 'id' => $model->cd_propietarios_pk], ['class' => 'btn btn-primary']) : '' ?>
        <?= (in_array(Yii::$app->controller->id.'-delete',$operaciones)) ? Html::a(Yii::t('app', 'Eliminar'), ['delete', 'id' => $model->cd_propietarios_pk], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) : '' ?>
    </p>

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cd_propietarios_pk',
            [
                'label' => 'Usuario',
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
            'quien_vive',
            'direccion',
            'direccion_cobro',
            'update_usr:boolean',
        ],
    ]) ?>

</div>
