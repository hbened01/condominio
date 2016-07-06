<?php

namespace backend\controllers;

use Yii;
use backend\models\CdAptos;
use backend\models\CdAptosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CdAptosController implements the CRUD actions for CdAptos model.
 */
class CdAptosController extends Controller
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
     * Lists all CdAptos models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CdAptosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CdAptos model.
     * @param string $cd_aptos_pk
     * @param integer $cod_edificio
     * @return mixed
     */
    public function actionView($cd_aptos_pk, $cod_edificio)
    {
        return $this->render('view', [
            'model' => $this->findModel($cd_aptos_pk, $cod_edificio),
        ]);
    }

    /**
     * Creates a new CdAptos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CdAptos();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'cd_aptos_pk' => $model->cd_aptos_pk, 'cod_edificio' => $model->cod_edificio]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing CdAptos model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $cd_aptos_pk
     * @param integer $cod_edificio
     * @return mixed
     */
    public function actionUpdate($cd_aptos_pk, $cod_edificio)
    {
        $model = $this->findModel($cd_aptos_pk, $cod_edificio);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'cd_aptos_pk' => $model->cd_aptos_pk, 'cod_edificio' => $model->cod_edificio]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CdAptos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $cd_aptos_pk
     * @param integer $cod_edificio
     * @return mixed
     */
    public function actionDelete($cd_aptos_pk, $cod_edificio)
    {
        $this->findModel($cd_aptos_pk, $cod_edificio)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the CdAptos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $cd_aptos_pk
     * @param integer $cod_edificio
     * @return CdAptos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($cd_aptos_pk, $cod_edificio)
    {
        if (($model = CdAptos::findOne(['cd_aptos_pk' => $cd_aptos_pk, 'cod_edificio' => $cod_edificio])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
