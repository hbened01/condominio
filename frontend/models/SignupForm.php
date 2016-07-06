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
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],

            ['verifyCode', 'captcha'],

            // DATOS DE PROPIETARIO 
            ['nro_cedula', 'required'],
            [['nro_cedula'], 'number', 'min' => 8],

            ['nro_apto', 'required'],
            [['nro_apto'], 'string', 'min' => 2],

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

        $query_1 = (new \yii\db\Query())
                        ->select(['a.*', 'b.email_edificio'])
                        ->from('cd_aptos a')
                        ->innerJoin('cd_edificios b','b.cd_edificios_pk = a.cod_edificio')
                        ->where (['a.cd_aptos_pk' => $this->nro_apto, 'b.email_edificio' => $this->email_edificio])
                        ->one();
        $query_2 = (new \yii\db\Query())
                         ->select(['c.*'])
                         ->from('cd_propietarios c')
                         ->where (['c.cd_propietarios_pk' => $query_1['cod_propietario']])
                         ->one();

        if (empty($query_1)) {
            return "N° de apartamento o Email de edificio erroneo, intente nuevamente...";
        }

        if (is_null($query_2['cod_user'])) {
            $rol = new Roles();
            $user = new User();
            $user->username = $this->username;
            $user->email = $this->email;
            $user->setPassword($this->password);
            $user->generateAuthKey();
            $user->rol_id = $rol->getIdRol('Usuario Estandar');
            $save = $user->save();

            $propietario = CdPropietarios::findOne($query_1['cod_propietario']);
            $propietario->nro_cedula = $this->nro_cedula;
            $propietario->cod_user = $user->id;
            $propietario->save();

            return $save ? $user : null;
        }
        else{
            return "El Propietario del apartamento ya tiene un Usuario WEB asignado...";
        }
    }
}
