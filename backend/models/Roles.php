<?php

namespace backend\models;

use Yii;
use common\models\User;
use backend\models\Roles;
use backend\models\RolesOperaciones;
use backend\models\Operaciones;

/**
 * This is the model class for table "roles".
 *
 * @property integer $id
 * @property string $nombre
 *
 * @property RolesOperaciones[] $rolesOperaciones
 * @property Operaciones[] $operacions
 */
class Roles extends \yii\db\ActiveRecord
{
    public $operaciones;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'roles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['nombre'], 'string', 'max' => 32],
            ['operaciones', 'safe'],
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
        return $this->hasMany(RolesOperaciones::className(), ['rol_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOperacions()
    {
        return $this->hasMany(Operaciones::className(), ['id' => 'operacion_id'])->viaTable('roles_operaciones', ['rol_id' => 'id']);
    }

    public function getUsers()
    {
            return $this->hasMany(User::className(), ['rol_id' => 'id']);
    }

    public function afterSave($insert, $changedAttributes){
        Yii::$app->db->createCommand()->delete('roles_operaciones', 'rol_id = '.(int) $this->id)->execute();
 
        foreach ($this->operaciones as $id) {
            $ro = new RolesOperaciones();
            $ro->rol_id = $this->id;
            $ro->operacion_id = $id;
            $ro->save();
        }
    }

    public function getRolOperaciones(){
        return $this->hasMany(RolesOperaciones::className(), ['rol_id' => 'id']);
    }
     
    public function getOperacionesPermitidas(){
        return $this->hasMany(Operaciones::className(), ['id' => 'operacion_id'])
            ->viaTable('roles_operaciones', ['rol_id' => 'id']);
    }
     
    public function getOperacionesPermitidasList(){
        return $this->getOperacionesPermitidas()->asArray();
    }

    public function getIdRol($nombrerol){

        $result = (new \yii\db\Query())
                        ->select(['id'])
                        ->from('roles')
                        ->where(['nombre' =>$nombrerol])
                        ->one();

        return $result['id'];
    }
}
