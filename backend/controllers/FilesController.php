<?php 

namespace backend\controllers;

use Yii; 
use backend\models\Operaciones;
use backend\models\OperacionesSearch;
use common\models\AccessHelpers; 
use yii\helpers\Url;
 
class FilesController extends BaseController { 
 
    public function actionFileLoad()
    {

        return $this->render('file-load');
    }
 
    // public function actionFileProcess() { 
        
    // }
}