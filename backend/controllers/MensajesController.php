<?php

namespace backend\controllers;

use Yii;
use backend\models\Mensajes;
use backend\models\MensajesSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * MensajesController implements the CRUD actions for Mensajes model.
 */
class MensajesController extends Controller
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
     * Lists all Mensajes models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MensajesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Mensajes model.
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
     * Creates a new Mensajes model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Mensajes();

        if ($model->load(Yii::$app->request->post())) {
            if ($model->msn_default) {
                $msn_default = Mensajes::find()->where(['msn_default' => true])->one();
                if (!empty($msn_default)) {
                    $msn_default->msn_default = false;
                    $msn_default->save();
                }
            }
            
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'El mensaje fue creado exitosamente.');
                return $this->redirect(['view', 'id' => $model->cd_mensajes_pk]);
            } else {
                Yii::$app->session->setFlash('error', 'El mensaje no pudo ser creado.');
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Mensajes model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
            if ($model->msn_default) {
                $msn_default = Mensajes::find()->where(['msn_default' => true])->one();
                if (!empty($msn_default)) {
                    $msn_default->msn_default = false;
                    $msn_default->save();
                }
            }

            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'El mensaje fue actualizado exitosamente.');
                return $this->redirect(['view', 'id' => $model->cd_mensajes_pk]);
            } else {
                Yii::$app->session->setFlash('error', 'El mensaje no pudo ser actualizado.');
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Mensajes model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if ($this->findModel($id)->delete()) {
            Yii::$app->session->setFlash('success', 'El mensaje fue eliminado exitosamente.');
        } else {
            Yii::$app->session->setFlash('error', 'El mensaje no pudo ser eliminado.');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the Mensajes model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Mensajes the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Mensajes::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
