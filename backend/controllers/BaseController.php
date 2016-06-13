<?php 

namespace backend\controllers; 

use Yii; 
use yii\web\Controller; 
use common\models\AccessHelpers; 
use yii\helpers\Url;//
 
class BaseController extends Controller { 

    public $layout;
 
    public function beforeAction($action) { 
        if (!parent::beforeAction($action)) { 
             return false; 
        } 

        if (is_null(Yii::$app->user->identity)){
            $this->layout = 'mainLogin';
            if(Yii::$app->controller->route != 'site/login'){
                return $this->redirect(Yii::$app->getUser()->loginUrl);
            }
        }else{
            $this->layout = 'main';
        }

        $operacion = str_replace("/", "-", Yii::$app->controller->route);
 
        $permitirSiempre = ['site-captcha', 'site-signup', 'site-index', 'site-error', 'site-about', 'site-contact', 'site-login', 'site-logout'];
 
        if (in_array($operacion, $permitirSiempre)) {
            return true;
        }
 
        if (!AccessHelpers::getAcceso($operacion)) {
            echo $this->render('/site/deneid');
            return false;
        }
 
        return true;
    }
}