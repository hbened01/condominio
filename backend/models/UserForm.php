<?php
namespace backend\models;

use yii\base\Model;
use common\models\User;

/**
 * Signup form
 */
class UserForm extends User
{
    public $password;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'Este nombre de usuario ya existe.', 'on' => 'create'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required', 'message' => 'El correo electrónico es requerido.'],
            ['email', 'email', 'message' => 'Formato de correo invalido. Ejemplo: prueba@prueba.com.'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'Este correo electrónico ya existe.', 'on' => 'create'],

            ['password', 'required', 'message' => 'El password es requerido.', 'on' => 'create'],
            ['password', 'string', 'min' => 6],

            ['rol_id', 'required', 'message' => 'Debe seleccionar el rol que tendrá el usuario.'],

        ];
    }

    /**
     * Create new user.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function saveNewUser()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $this->setPassword($this->password);
        $this->generateAuthKey();
        
        return $this->save();
    }
}