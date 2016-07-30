<?php

namespace backend\controllers;

use Yii;
use backend\models\Roles;
use backend\models\RolesSearch;
//use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Operaciones;
use common\models\AccessHelpers; 
use common\models\LoginForm;

/**
 * RolesController implements the CRUD actions for Roles model.
 */
class RolesController extends BaseController
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
     * Lists all Roles models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RolesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Roles model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->identity->rol_id != 1 && $id == 1){
            return $this->render('/site/deneid');
        }

        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Roles model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */

    public function actionCreate()
    {
        if (Yii::$app->user->identity->rol_id != 1) {
            $permitirSuperUsuario = "nombre not in ('operaciones-index', 'operaciones-create', 'operaciones-view', 'operaciones-update', 'operaciones-delete')";
        }else{
            $permitirSuperUsuario = "1 = 1";
        }

        $model = new Roles();
        $tipoOperaciones = Operaciones::find()->select(['id', 'descripcion as nombre'])->where($permitirSuperUsuario)->all();
     
        if ($model->load(Yii::$app->request->post())) {
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'El rol fue creado exitosamente.');
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                Yii::$app->session->setFlash('error', 'El rol no pudo ser creado.');
                return $this->render('create', [
                    'model' => $model,
                    'tipoOperaciones' => $tipoOperaciones
                ]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
                'tipoOperaciones' => $tipoOperaciones
            ]);
        }
    }

    /**
     * Updates an existing Roles model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->identity->rol_id != 1 && ($id == 1 || Yii::$app->user->identity->rol_id == $id)){
            return $this->render('/site/deneid');
        }elseif (Yii::$app->user->identity->rol_id != 1) {
            $permitirSuperUsuario = "nombre not in ('operaciones-index', 'operaciones-create', 'operaciones-view', 'operaciones-update', 'operaciones-delete')";
        }else{
            $permitirSuperUsuario = "1 = 1";
        }

        $model = $this->findModel($id);
        $tipoOperaciones = Operaciones::find()->select(['id', 'descripcion as nombre'])->where($permitirSuperUsuario)->all();
     
        $model->operaciones = \yii\helpers\ArrayHelper::getColumn(
            $model->getRolesOperaciones()->asArray()->all(),
            'operacion_id'
        );
     
        if ($model->load(Yii::$app->request->post())) {
            if (!isset($_POST['Roles']['operaciones'])) {
                $model->operaciones = [];
            }
            if ($model->save()) {
                $session = Yii::$app->session;
                $session->set('operaciones', LoginForm::permittedOperations());
                Yii::$app->session->setFlash('success', 'El rol fue actualizado exitosamente.');
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                Yii::$app->session->setFlash('error', 'El rol no pudo ser actualizado.');
                return $this->render('update', [
                    'model' => $model,
                    'tipoOperaciones' => $tipoOperaciones
                ]);
            }
        } else {
            return $this->render('update', [
                'model' => $model,
                'tipoOperaciones' => $tipoOperaciones
            ]);
        }
    }

    /**
     * Deletes an existing Roles model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->identity->rol_id != 1 && ($id == 1 || Yii::$app->user->identity->rol_id == $id)){
            return $this->render('/site/deneid');
        }

        $this->findModel($id)->delete();
        if ($this->findModel($id)->delete()) {
            Yii::$app->session->setFlash('success', 'El rol fue eliminado exitosamente.');
        }
        else {
            Yii::$app->session->setFlash('error', 'El rol no pudo ser eliminado.');
        }
        return $this->redirect(['index']);
    }

    /**
     * Finds the Roles model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Roles the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Roles::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
