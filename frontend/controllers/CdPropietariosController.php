<?php

namespace frontend\controllers;

use Yii;
use frontend\models\CdPropietarios;
use frontend\models\CdPropietariosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CdPropietariosController implements the CRUD actions for CdPropietarios model.
 */
class CdPropietariosController extends Controller
{
    /**
     * Updates an existing CdPropietarios model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate()
    {
        $model = new CdPropietarios();
        $id_user = Yii::$app->user->identity->id;
        $id = $model->getIdPropietario($id_user);
        if (empty($id)) {
            Yii::$app->session->setFlash('error', 'Usuario no encontrado, no se puede realizar actualización de datos.');
            return $this->goHome();
        }
        else {
            $model = $this->findModel($id);
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $model->update_usr = 0;
                $model->save();
                Yii::$app->session->remove('user.update_usr');
                return $this->goHome();
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }
    /**
     * Finds the CdPropietarios model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CdPropietarios the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CdPropietarios::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
