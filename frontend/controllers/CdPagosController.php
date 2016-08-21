<?php

namespace frontend\controllers;

use Yii;
use frontend\models\CdPagos;
use frontend\models\Facturas;
use frontend\models\CdPagosSearch;
use frontend\models\CdPropietarios;
use frontend\models\FacturasPagos;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;


/**
 * CdPagosController implements the CRUD actions for CdPagos model.
 */
class CdPagosController extends Controller
{
    /**
     * Lists all CdPagos models.
     * @return mixed
     */
    public function actionIndex()
    {   
        $user = new CdPropietarios();
        $update_usr = $user->getStatus(Yii::$app->user->identity->username);
        if ($update_usr) {
            Yii::$app->session->setFlash('warning', 'Antes de ejecutar cualquier otra opción por favor registre sus datos en el formulario.');
            return $this->redirect('cd-propietarios/update');
        }
        $model = new CdPagos();
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
        $model = new CdPagos();
        $table = $model->getFacturas($id);
        return $this->render('view', [
            'model' => $this->findModel($id),
            'table' => $table,
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
        $model_facturas = new Facturas();
        $post = Yii::$app->request->post();

        if (!empty($post) && $model->load(Yii::$app->request->post()) && $model->validate()) {
            // GUARDADO TABLA CD_PAGOS
            $model->load(Yii::$app->request->post());
            $model->save();
            $post['CdPagos']['monto'] = str_replace(',', '.', str_replace(['.', ',00', 'Bs '], '' , $post['CdPagos']['monto']));
            foreach ($post['CdPagos']['cod_factura'] as $key => $factura):
                $search = $model_facturas->find()->where(['cd_factura_pk' => $factura])->one();
                $total_deducible = $search['total_deducible'];
                if ($total_deducible !== 0) {
                    $calculo = $post['CdPagos']['monto'] - $total_deducible;
                    if ($calculo >= 0) {
                        // SE GUARDA EL MONTO AJUSTADO
                        $post['CdPagos']['monto'] = $calculo;
                        // GUARDADO DE CONTROL TABLA FACTURAS
                        $search->total_deducible = 0;
                        $model_facturas = $search;
                        $model_facturas->save();
                        // GUARDADO DE CONTROL TABLA FACTURAS_PAGOS
                        $model_facturas_pagos = new FacturasPagos();
                        $model_facturas_pagos->cod_facturas_fk = $factura;
                        $model_facturas_pagos->cod_pagos_fk = $model->cd_pago_pk;
                        $model_facturas_pagos->save();
                    }else{
                        if (($total_deducible *= -1) < $calculo) {
                            // SE GUARDA EL MONTO AJUSTADO
                            $post['CdPagos']['monto'] = $calculo;
                            // GUARDADO DE CONTROL TABLA FACTURAS
                            $search->total_deducible = ($calculo *-1);
                            $model_facturas = $search;
                            $model_facturas->save();
                            // GUARDADO DE CONTROL TABLA FACTURAS_PAGOS
                            $model_facturas_pagos = new FacturasPagos();
                            $model_facturas_pagos->cod_facturas_fk = $factura;
                            $model_facturas_pagos->cod_pagos_fk = $model->cd_pago_pk;
                            $model_facturas_pagos->save();
                        }
                        else{
                            // SE TERMINA LAZO
                            break;
                        }
                    }
                }
            endforeach;
            Yii::$app->session->setFlash('success', 'El pago fue creado exitosamente.');
            return $this->redirect(['view', 'id' => $model->cd_pago_pk]);
        }
        else {
            $id_user = Yii::$app->user->identity->id;
            $concat_id_factura = $model->getIdFacturaConcat($id_user);
            if (empty($concat_id_factura)) {
               Yii::$app->session->setFlash('error', 'Aún no se han generado facturas para asociar a un pago.');
               return $this->redirect(['index']);
            }
            return $this->render('create', [
                'model' => $model,
                'data' => $concat_id_factura, 
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
        $model_facturas = new Facturas();
        $post = Yii::$app->request->post();

        if ($model->estatus_pago) {
            Yii::$app->session->setFlash('error', 'Pago validado, no se puede realizar actualización de datos.');
            return $this->goHome();
        }

        if (!empty($post) && $model->load(Yii::$app->request->post()) && $model->validate()) {
            $delete = $model->getUpdatePago($id, $post['CdPagos']['cod_factura']);
            foreach ($delete as $key => $fact):
                $fact =$fact['id'];
                // SE ELIMINAN PAGOS NO SELECCIONADOS
                Yii::$app->db->createCommand()
                ->delete('facturas_pagos', ['cod_facturas_fk' => $fact, 'cod_pagos_fk' => $id])
                ->execute();
                // SE ACTUALIZAN TOTALES DEDUCIBLES
                $search = $model_facturas->find()->where(['cd_factura_pk' => $fact])->one();
                $search->total_deducible = $search->total_pagar_mes;
                $search->update();
            endforeach;
            // GUARDADO TABLA CD_PAGOS
            $model->load(Yii::$app->request->post());
            $model->update();
            $post['CdPagos']['monto'] = str_replace(',', '.', str_replace(['.', ',00', 'Bs '], '' , $post['CdPagos']['monto']));
            // AJUSTE DE FACTURAS
            foreach ($post['CdPagos']['cod_factura'] as $key => $factura):
                // SE ACTUALIZAN TOTALES DEDUCIBLES
                $search = $model_facturas->find()->where(['cd_factura_pk' => $factura])->one();
                $search->total_deducible = $search->total_pagar_mes;
                $search->update();
                // SE CALCULA NUEVAMENTE
                $total_deducible = $search['total_deducible'];
                if ($total_deducible !== 0) {
                    $calculo = $post['CdPagos']['monto'] - $total_deducible;
                    if ($calculo >= 0) {
                        // SE GUARDA EL MONTO AJUSTADO
                        $post['CdPagos']['monto'] = $calculo;
                        // GUARDADO DE CONTROL TABLA FACTURAS
                        $search->total_deducible = 0;
                        $model_facturas = $search;
                        $model_facturas->update();
                    }else{
                        if (($total_deducible *= -1) < $calculo) {
                            // SE GUARDA EL MONTO AJUSTADO
                            $post['CdPagos']['monto'] = $calculo;
                            // GUARDADO DE CONTROL TABLA FACTURAS
                            $search->total_deducible = ($calculo *-1);
                            $model_facturas = $search;
                            $model_facturas->update();
                        }
                        else{
                            // SE TERMINA LAZO
                            break;
                        }
                    }
                }
            endforeach;
            // DESVINCULA FACTURA SI EL PAGO NO ALTERA SU TOTAL DEDUCIBLE
            foreach ($post['CdPagos']['cod_factura'] as $key => $factura):
                $search = $model_facturas->find()->where(['cd_factura_pk' => $factura])->one();
                if ($search->total_deducible == $search->total_pagar_mes) {
                Yii::$app->db->createCommand()
                ->delete('facturas_pagos', ['cod_facturas_fk' => $factura, 'cod_pagos_fk' => $id])
                ->execute();
                }
            endforeach;
            Yii::$app->session->setFlash('success', 'El pago fue actualizado exitosamente.');
            return $this->redirect(['view', 'id' => $model->cd_pago_pk]);
        }
        else {
            $concat_id_factura = $model->getUpdatePago($id);
            return $this->render('update', [
                'model' => $model,
                'data' => $concat_id_factura,
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
        $model = new CdPagos();

        $status = $this->findModel($id);

        if ($status->estatus_pago) {
            Yii::$app->session->setFlash('error', 'Pago validado, no se puede realizar esta acción.');
            return $this->goHome();
        }

        $update = $model->getFacturas($id);
            foreach ($update as $key => $fact):
                $fact =$fact['id'];
                //SE ACTUALIZAN TOTALES DEDUCIBLES
                $model_facturas = new Facturas();
                $search = $model_facturas->find()->where(['cd_factura_pk' => $fact])->one();
                $search->total_deducible = $search->total_pagar_mes;
                $search->update();
            endforeach;

        $this->findModel($id)->delete();

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
}
