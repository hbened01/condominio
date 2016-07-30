<?php

namespace backend\models;


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
            [['cod_user','nro_cedula','nombre', 'apellido','nro_piso','email','telf_local'], 'required'],
            [['cod_user'], 'integer'],
            [['nro_cedula', 'alicuota'], 'number'],
            [['update_usr'], 'boolean'],
            [['nro_piso'], 'string', 'max' => 5],
            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['telf_local', 'telf_celular'], 'string', 'max' => 50],
            [['email'], 'string', 'max' => 256],
            [['quien_vive'], 'string', 'max' => 25],
            [['direccion', 'direccion_cobro'], 'string', 'max' => 150],
            [['cod_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['cod_user' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_propietarios_pk' => Yii::t('app', 'Código Propietario'),
            'cod_user' => Yii::t('app', 'Cod User'),
            'nro_piso' => Yii::t('app', 'Nro Piso'),
            'nombre' => Yii::t('app', 'Nombre'),
            'apellido' => Yii::t('app', 'Apellido'),
            'nro_cedula' => Yii::t('app', 'Nro Cedula'),
            'telf_local' => Yii::t('app', 'Telf Local'),
            'telf_celular' => Yii::t('app', 'Telf Celular'),
            'email' => Yii::t('app', 'Email'),
            'alicuota' => Yii::t('app', 'Alicuota'),
            'quien_vive' => Yii::t('app', 'Quien Vive'),
            'direccion' => Yii::t('app', 'Direccion'),
            'direccion_cobro' => Yii::t('app', 'Direccion Cobro'),
            'update_usr' => Yii::t('app', 'Propietario Actualizado'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'cod_user']);
    }

    public function usuario($id)
    {
        $model = User::find()->where(['id' => $id])->one();
        return $model?$model->username:null;
    }
}
