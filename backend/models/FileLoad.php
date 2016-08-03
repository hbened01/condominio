<?php 
namespace backend\models;

use Yii; 
use yii\base\Model;

class FileLoad extends Model
{
    /**
     * @var UploadedFile
     */
    public $file;
    
    public function upload()
    {
        if ($this->validate()) {
            $this->file->saveAs(Yii::$app->basePath.'/web/files/copiacondc'.strtotime(date("Y-m-d H:i:s")).'.' . $this->file->extension);
            return true;
        } else {
            return false;
        }
    }
}