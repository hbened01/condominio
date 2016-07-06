<?php
namespace frontend\models;

use yii\base\Model;
use common\models\User;
use backend\models\Roles;
use frontend\models\CdPropietarios;
use frontend\models\CdAptos;
use frontend\models\CdEdificios;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $verifyCode;
    public $nombre;
    public $apellido;
    public $nro_apto;
    public $email_edificio;
    public $nro_cedula;
    // public $telf_celular;
    // public $telf_local;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // ['username', 'filter', 'filter' => 'trim'],
            // ['username', 'required'],
            // ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            // ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],

            // verifyCode needs to be entered correctly
            //['verifyCode', 'captcha'],

            // DATOS DE PROPIETARIO 
            // nombre de propietario
            //['nombre', 'match', 'pattern' => '/^[a-zA-Záéíóú]"+$/', 'message' => 'Introducir solo letras...'],
            ['nombre', 'filter', 'filter' => 'trim'],
            ['nombre', 'required'],
            ['nombre', 'string', 'min' => 2, 'max' => 30],
            // apellido de propietario
            //['apellido', 'match', 'pattern' => '/^[a-zA-Záéíóú]"+$/', 'message' => 'Introducir solo letras...'],
            ['apellido', 'filter', 'filter' => 'trim'],
            ['apellido', 'required'],
            ['apellido', 'string', 'min' => 2, 'max' => 30],
            // cédula de propietario
            ['nro_cedula', 'required'],
            [['nro_cedula'], 'number', 'min' => 8],
            // n° de apto de propietario
            ['nro_apto', 'required'],
            [['nro_apto'], 'string', 'min' => 2],
            // e-mail de propietario
            ['email_edificio', 'filter', 'filter' => 'trim'],
            ['email_edificio', 'required'],
            ['email_edificio', 'email'],
            ['email_edificio', 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'verifyCode' => 'Verification Code',
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }

        $val_1 = (new \yii\db\Query())
                        ->select(['a.cd_aptos_pk', 'a.cod_propietario', 'a.cod_edificio', /*'cd_propietarios.nombre', 'cd_propietarios.apellido', 'cd_propietarios.nro_cedula',*/ 'b.email_edificio'])
                        ->from('cd_aptos a')
                        //->innerJoin('cd_propietarios','cd_propietarios.cd_propietarios_pk = cd_aptos.cod_propietario')
                        ->innerJoin('cd_edificios b','b.cd_edificios_pk = a.cod_edificio')
                        ->where (['a.cd_aptos_pk' => $this->nro_apto, 'b.email_edificio' => $this->email_edificio])
                        ->all();
        $val_2 = (new \yii\db\Query())
                        ->select(['cd_propietarios.nombre', 'cd_propietarios.apellido', 'cd_propietarios.nro_cedula'])
                        ->from('cd_propietarios')
                        //->innerJoin(['val_1' => $val_1], 'val_1.cod_propietario = cd_propietarios.cd_propietarios_pk')
                        ->where (['cd_propietarios.nombre' => $this->nombre, 'cd_propietarios.apellido' => $this->apellido])
                        ->all();


        print_r($val_1);
        print_r($val_2);

        if (!empty($val_1)) {

        }

        exit();

        $rol = new Roles();
        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        $user->rol_id = $rol->getIdRol('Usuario Estandar');
        
        return $user->save() ? $user : null;
    }
}
