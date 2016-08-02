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

    public function actionLoadInvoices()
    {
        if (file_exists(Yii::$app->basePath.'/web/files/copiacondc.csv')) {
            chdir(Yii::$app->basePath.'/web/shell/');
            // $salida = exec('./carga_facturas.sh');
            // $contents = file_get_contents(Yii::$app->basePath.'/web/shell/carga_facturas.sh');
            $salida = shell_exec(' ./carga_facturas');
            Yii::$app->session->setFlash('success', $salida);
        } else {
            Yii::$app->session->setFlash('error', 'No hay archivo para procesar, por favor cargue un archivo');
        }

        return $this->redirect(['file-load']);
    }

}