<?php
namespace common\models;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class LoginForm extends Model
{
    public $username;
    public $password;
    public $rememberMe = true;
    public $verifyCode;

    private $_user;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $defaultUrl = Yii::$app->request->baseUrl;
        $string   = 'frontend';
        $search = stripos($defaultUrl, $string);
        if ($search !== false) {   
            return [
                // username and password are both required
                [['username', 'password'], 'required'],
                // rememberMe must be a boolean value
                ['rememberMe', 'boolean'],
                // password is validated by validatePassword()
                ['password', 'validatePassword'],
                // verifyCode needs to be entered correctly
                ['verifyCode', 'captcha'],
            ];
        } 
        else{
            return [
                // username and password are both required
                [['username', 'password'], 'required'],
                // rememberMe must be a boolean value
                ['rememberMe', 'boolean'],
                // password is validated by validatePassword()
                ['password', 'validatePassword'],
            ];
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'verifyCode' => Yii::t('frontend', 'Verification Code'),
            'rememberMe' => Yii::t('frontend', 'Remember Me'),
            'password' => Yii::t('frontend', 'Password'),
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'Nombre de usuario o password incorrecto.');
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return boolean whether the user is logged in successfully
     */
    public function login()
    {
        if ($this->validate()) {
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
        } else {
            return false;
        }
    }

    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }

    /**
     * Finds the user's permissions.
     * @param integer $id
     * @return User's permissions
     */
    static function permittedOperations()
    {
        $result = (new \yii\db\Query())
                        ->select(['operaciones.nombre'])
                        ->from('operaciones')
                        ->innerJoin('roles_operaciones','roles_operaciones.operacion_id = operaciones.id')
                        ->innerJoin('roles','roles.id = roles_operaciones.rol_id')
                        ->innerJoin('user','"user".rol_id = roles.id')
                        ->where(['user.id' => Yii::$app->user->id])
                        ->all();

        if (!empty($result)) {
            foreach ($result as $key => $value) {
                $result2[$key] = $value['nombre'];
            }
            $result = $result2;
        }

        return $result;

    }
}
