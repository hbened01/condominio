<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "roles_operaciones".
 *
 * @property integer $rol_id
 * @property integer $operacion_id
 *
 * @property Operaciones $operacion
 * @property Roles $rol
 */
class RolesOperaciones extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'roles_operaciones';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rol_id', 'operacion_id'], 'required'],
            [['rol_id', 'operacion_id'], 'integer'],
            [['operacion_id'], 'exist', 'skipOnError' => true, 'targetClass' => Operaciones::className(), 'targetAttribute' => ['operacion_id' => 'id']],
            [['rol_id'], 'exist', 'skipOnError' => true, 'targetClass' => Roles::className(), 'targetAttribute' => ['rol_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'rol_id' => Yii::t('app', 'Rol ID'),
            'operacion_id' => Yii::t('app', 'Operacion ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOperacion()
    {
        return $this->hasOne(Operaciones::className(), ['id' => 'operacion_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRol()
    {
        return $this->hasOne(Roles::className(), ['id' => 'rol_id']);
    }
}
