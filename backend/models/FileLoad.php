<?php 
namespace backend\models;

use yii\base\Model;
use yii\web\UploadedFile;

class FileLoad extends Model
{
    /**
     * @var UploadedFile
     */
    public $file;

    public function rules()
    {
        return [
            [['file'], 'file', 'skipOnEmpty' => false, 'extensions' => 'csv','message' => 'No es un archivo .csv'],
        ];
    }
    
    public function upload()
    {
        if ($this->validate()) {
            print_r($this->file);
            $this->file->saveAs('files/' . $this->file->baseName . '.' . $this->file->extension);
            return true;
        } else {
            return false;
        }
    }
}