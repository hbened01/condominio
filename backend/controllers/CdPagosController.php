<?php

namespace backend\controllers;

use Yii;
use backend\models\CdPagos;
use backend\models\CdPagosSearch;
// use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Facturas;
use backend\models\FacturasPagos;

/**
 * CdPagosController implements the CRUD actions for CdPagos model.
 */
class CdPagosController extends BaseController
{

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all CdPagos models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CdPagosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CdPagos model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new CdPagos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CdPagos();

        $concat_id_factura = $model->getIdFacturaConcat();
        $propietarios = $model->getPropietarios();

        if ($model->load(Yii::$app->request->post())) {
            $model->fecha_pago = date('Y-m-d',strtotime($model->fecha_pago));

            // print_r($model);
            // exit();

            if ($model->save()) {
                $model2 = new FacturasPagos();
                foreach ($model->cod_factura as $key => $value) {
                    $model2->cod_facturas_fk = $value;
                    $model2->cod_pagos_fk = $model->cd_pago_pk;
                    $model2->save();
                }
                // print_r($model2);
                // exit();
                Yii::$app->session->setFlash('success', 'El pago fue creado exitosamente.');
                return $this->redirect(['view', 'id' => $model->cd_pago_pk]);
            } else {
                Yii::$app->session->setFlash('error', 'El pago no pudo ser creado.');
                return $this->render('create', [
                    'model' => $model,
                    'data' => $concat_id_factura, 
                    'propietarios' => $propietarios, 
                ]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
                'data' => $concat_id_factura, 
                'propietarios' => $propietarios, 
            ]);
        }
    }

    /**
     * Updates an existing CdPagos model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->fecha_pago = date('d-m-Y',strtotime($model->fecha_pago));

        $concat_id_factura = $model->getIdFacturaConcat();
        $propietarios = $model->getPropietarios();

        if ($model->load(Yii::$app->request->post())) {
            $model->fecha_pago = date('Y-m-d',strtotime($model->fecha_pago));
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'El pago fue actualizado exitosamente.');
                return $this->redirect(['view', 'id' => $model->cd_pago_pk]);
            } else {
                Yii::$app->session->setFlash('error', 'El pago no pudo ser actualizado.');
                return $this->render('create', [
                    'model' => $model,
                    'data' => $concat_id_factura, 
                    'propietarios' => $propietarios, 
                ]);
            }
        } else {
            return $this->render('update', [
                'model' => $model,
                'data' => $concat_id_factura,  
                'propietarios' => $propietarios, 
            ]);
        }
    }

    /**
     * Deletes an existing CdPagos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if ($this->findModel($id)->delete()) {
            Yii::$app->session->setFlash('success', 'El pago fue eliminado exitosamente.');
        } else {
            Yii::$app->session->setFlash('error', 'El pago no pudo ser eliminado.');
        }
        return $this->redirect(['index']);
    }

    /**
     * Finds the CdPagos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CdPagos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CdPagos::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * Deletes an existing CdPagos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionPayApproved($id)
    {
        $model = $this->findModel($id);
        $model->estatus_pago = true;

        $model2 = Facturas::find()->where(['cd_factura_pk' => $model->cod_factura])->one();
        $model2->estatus_factura = true;

        if ($model->save()) {
            $model2->save();
            Yii::$app->session->setFlash('success', 'El pago fue aprobado exitosamente.');
        } else {
            Yii::$app->session->setFlash('error', 'El pago no pudo ser aprobado.');
        }
        return $this->redirect(['index']);
    }

    /**
     * Deletes an existing CdPagos model.
     */
    public function actionOptionsSelectFacturas()
    {
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();

            $opciones = CdPagos::getOptionsFacturas($data['id']);
            //print_r($opciones);

            $optionsHtml = '';
            if (!empty($opciones)) {
                foreach ($opciones as $key => $value) {
                    $optionsHtml .= '<option value="'.$value['id'].'">'.$value['descripcion'].'</option>';
                }
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return [
                'options' => $optionsHtml,
            ];
        }
    }
}
