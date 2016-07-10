<?php

namespace frontend\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "cd_propietarios".
 *
 * @property integer $cd_propietarios_pk
 * @property integer $cod_user
 * @property string $nro_piso
 * @property string $nombre
 * @property string $apellido
 * @property string $nro_cedula
 * @property string $telf_local
 * @property string $telf_celular
 * @property string $email
 * @property string $alicuota
 * @property string $quien_vive
 * @property string $direccion
 * @property string $direccion_cobro
 * @property boolean $update_usr
 *
 * @property User $codUser
 */
class CdPropietarios extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_propietarios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_user'], 'integer'],

            [['nro_cedula', 'alicuota'], 'number'],

            [['update_usr'], 'boolean'],

            [['nro_piso'], 'string', 'max' => 5],

            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['nombre', 'apellido'], 'filter', 'filter' => 'strtoupper'],
            [['nombre', 'apellido'], 'match' ,'pattern'=>'/^[a-zA-ZÑñ" "]+$/u', 'message'=> 'Solo introducir letras'],

            [['telf_local', 'telf_celular'], 'match' ,'pattern'=>'/^[0-9-]+$/u', 'message'=> 'Solo introducir números'],

            [['email'], 'string', 'max' => 256],
            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'email'],

            [['quien_vive'], 'string', 'max' => 25],
            ['quien_vive', 'filter', 'filter' => 'strtoupper'],

            [['direccion', 'direccion_cobro'], 'string', 'max' => 150],
            [['direccion', 'direccion_cobro'], 'filter', 'filter' => 'strtoupper'],

            [['cod_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['cod_user' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_propietarios_pk' => Yii::t('frontend', 'Cd Propietarios Pk'),
            'cod_user' => Yii::t('frontend', 'Cod User'),
            'nro_piso' => Yii::t('frontend', 'Nro. Piso'),
            'nombre' => Yii::t('frontend', 'Nombre'),
            'apellido' => Yii::t('frontend', 'Apellido'),
            'nro_cedula' => Yii::t('frontend', 'Nro. Cedula'),
            'telf_local' => Yii::t('frontend', 'Telf. Local'),
            'telf_celular' => Yii::t('frontend', 'Telf. Celular'),
            'email' => Yii::t('frontend', 'Email Personal'),
            'alicuota' => Yii::t('frontend', 'Alicuota'),
            'quien_vive' => Yii::t('frontend', 'Quien Vive?'),
            'direccion' => Yii::t('frontend', 'Dirección de Residencia'),
            'direccion_cobro' => Yii::t('frontend', 'Dirección de Cobro'),
            'update_usr' => Yii::t('frontend', 'Update Usr'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodUser()
    {
        return $this->hasOne(User::className(), ['id' => 'cod_user']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPropietario($cod_user)
    {
        $result = (new \yii\db\Query())
                        ->select(['cd_propietarios_pk'])
                        ->from('cd_propietarios')
                        ->where(['cod_user' =>$cod_user])
                        ->one();

        return $result['cd_propietarios_pk'];
    }

    public function getStatus($usr)
    {
        $result = (new \yii\db\Query())
                        ->select(['a.update_usr'])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->where (['b.username' => $usr])
                        ->one();
                        

        if (!empty($result['update_usr'])){
            return true;

        } else {
            return false;
        }
    }

}
