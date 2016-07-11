<?php

namespace backend\controllers;

use Yii;
//use common\models\User;
use backend\models\UserSearch;
//use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\UserForm;
use backend\models\Roles;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends BaseController
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
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
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
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new UserForm();

        if ($model->load(Yii::$app->request->post()) && $model->saveNewUser()) {
            Yii::$app->session->setFlash('success', 'El usuario fue creado exitosamente.');
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->identity->rol_id != 1 && $id == 1){
            return $this->render('/site/deneid');
        }

        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->updateNewUser()) {
            Yii::$app->session->setFlash('success', 'El usuario fue actualizado exitosamente.');
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if ($this->findModel($id)->delete()) {
            Yii::$app->session->setFlash('success', 'El usuario fue eliminado exitosamente.');
            return $this->redirect(['index']);
        }
        else {
            Yii::$app->session->setFlash('error', 'El usuario no pudo ser eliminado. Por favor intente de nuevo');
            return $this->redirect(['index']);
        }
    }


    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = UserForm::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('El usuario requerido no existe.');
        }
    }

    /**
    * Assign new password to the users. This function is accessed it for ajax request
    * @return json responsive 
    */
    public function actionSetPassword()
    {
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->post();
            $model = $this->findModel($data['UserForm']['id']);
            $model->password = $data['UserForm']['password'];
            $model->scenario = 'set-password';

            if ($save = $model->validate()) {
                if ($save = $model->updateNewUser()) {
                    Yii::$app->session->setFlash('success', 'El password fue cambiado exitosamente.');
                } else {
                    Yii::$app->session->setFlash('error', 'El password no pudo ser cambiado. Por favor intente de nuevo');
                }
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return [
                'save' => $save,
                'id' => $data['UserForm']['id'],
                'msn_error' => $model->getErrors()
            ];
        }
    }
}
