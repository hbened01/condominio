<?php 

namespace backend\controllers;

use Yii; 
use backend\models\FileLoad;
use common\models\AccessHelpers; 
use yii\web\UploadedFile;
use yii\helpers\Url;
 
class FilesController extends BaseController { 
 
    public function actionFileLoad()
    {
        $model = new FileLoad();
        return $this->render('file-load', [
                'model' => $model,
        ]);
    }
 
    public function actionFileProcess() { 
        $model = new FileLoad();

        if (Yii::$app->request->isAjax) {
            $model->file = UploadedFile::getInstance($model, 'file');
                // print_r($model->file);
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            if ($model->upload()) {
                return [
                    'success' => 'Archivo cargado'
                ];
            }else{
                return [
                    'error' => 'El archivo no se pudo cargar'
                ];
            }
        }
    }
}