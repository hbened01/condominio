<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CdPropietariosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Owner');

$session = Yii::$app->session;
$operaciones = $session->get('operaciones');

?>
<div class="cd-propietarios-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= (in_array(Yii::$app->controller->id.'-create',$operaciones)) ? Html::a(Yii::t('backend', 'Create Owner'), ['create'], ['class' => 'btn btn-success']) : '' ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'filterSelector' => 'select[name="per-page"]',
        'formatter' => [
                    'class' => 'yii\\i18n\\Formatter',
                    'nullDisplay' => '<span class="not-set"><i class="glyphicons glyphicons-cleaning"></i>&nbsp&nbsp('.Yii::t('backend', 'THERE IS NO DATA').')</span>',
                    'dateFormat' => 'dd-MM-Y',
                    'datetimeFormat' => 'dd-MM-Y H:i:s',
                    'timeFormat' => 'H:i:s',
                ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'cd_propietarios_pk',
            'nro_cedula',
            // 'nro_piso',
            'nombre',
            'apellido',
            // 'telf_local',
            // 'telf_celular',
            [
                'attribute' => 'usuario',
                'label' => Yii::t('backend', 'User'),
                'value' => function($data){
                    return $data->usuario($data->cod_user); 
                },
            ],
            // 'email:email',
            // 'alicuota',
            // 'quien_vive',
            // 'direccion',
            // 'direccion_cobro',
            // 'update_usr:boolean',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{ver}  {actualizar}  {eliminar}',
                'buttons' => [
                    'ver' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-view',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                        'title' => Yii::t('backend', 'See'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'actualizar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-update',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                        'title' => Yii::t('backend', 'Update'),
                            ]);
                        }else{
                            return false;
                        }
                    },
                    'eliminar' => function ($url, $model) {
                        $session = Yii::$app->session;
                        if (in_array(Yii::$app->controller->id.'-delete',$session->get('operaciones'))) {
                            return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                        'title' => Yii::t('backend', 'Delete'),
                                        'data-confirm' => Yii::t('backend', 'Are you sure you want to delete the user').' "'.$model->nombre.' '.$model->apellido.'"?',
                                        'data-method' => 'POST'
                            ]);
                        }else{
                            return false;
                        }
                    },
                ],
                'urlCreator' => function ($action, $model, $key, $index) {
                    if ($action === 'ver') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/view?id='.$model->cd_propietarios_pk;
                        return $url;
                    }
                    if ($action === 'actualizar') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/update?id='.$model->cd_propietarios_pk;
                        return $url;
                    }
                    if ($action === 'eliminar') {
                        $url = Url::base().'/'.Yii::$app->controller->id.'/delete?id='.$model->cd_propietarios_pk;
                        return $url;
                    }
                }
            ],
        ],
    ]); ?>
    <div class="row-sm-5" align="left">
        <b> <?= Yii::t('backend', Html::encode('Quantity per page')) ?>:&nbsp<?php echo \nterms\pagesize\PageSize::widget(
                [   
                    'defaultPageSize' => 10,
                    'sizes' => [5 => 5, 10 => 10, 15 => 15, 20 => 20, 25 => 25, 50 => 50],
                    'label' => Yii::t('backend', Html::encode('Records')),
                ]
            ); ?>
        </b>        
    </div>
</div>
