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
        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, 'file');
            print_r($model->file);
            if ($model->upload()) {
                print_r(Yii::$app->request->post());
            }
            //exit();
        } else {
            //print_r('holaaaaaaaaaa');
        }
        return $this->render('file-load');
    }
 
    // public function actionFileProcess() { 
        
    // }
}