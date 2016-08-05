<?php

namespace frontend\controllers;

use Yii;
use frontend\models\CdPagos;
use frontend\models\CdPagosSearch;
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
        $factura =  $model->getUpdatePago($id);
        return $this->render('view', [
            'model' => $this->findModel($id),
            'factura' => $factura,
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
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->cd_pago_pk]);
        } else {
            $id_user = Yii::$app->user->identity->id;
            $concat_id_factura = $model->getIdFacturaConcat($id_user);
            if (empty($concat_id_factura)) {
               Yii::$app->session->setFlash('error', 'Aún no se han generado facturas para asociar a un pago.');
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

        if ($model->estatus_pago) {
            Yii::$app->session->setFlash('error', 'Pago validado, no se puede realizar actualización de datos.');
            return $this->goHome();
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->cd_pago_pk]);
        } else {
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
