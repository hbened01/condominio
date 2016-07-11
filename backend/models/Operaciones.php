<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "operaciones".
 *
 * @property integer $id
 * @property string $nombre
 *
 * @property RolesOperaciones[] $rolesOperaciones
 * @property Roles[] $rols
 */
class Operaciones extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'operaciones';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre','descripcion'], 'required'],
            [['nombre','descripcion'], 'string', 'max' => 64],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'nombre' => Yii::t('app', 'Nombre'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRolesOperaciones()
    {
        return $this->hasMany(RolesOperaciones::className(), ['operacion_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRols()
    {
        return $this->hasMany(Roles::className(), ['id' => 'rol_id'])->viaTable('roles_operaciones', ['operacion_id' => 'id']);
    }
}
