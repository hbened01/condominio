<?php

namespace common\models;

use yii;
use yii\base\Model;

class AccessHelpers extends Model {

    public static function getAcceso($operacion)
    {
        $result = (new \yii\db\Query())
                        ->select(['operaciones.nombre'])
                        ->from('operaciones')
                        ->innerJoin('roles_operaciones','roles_operaciones.operacion_id = operaciones.id')
                        ->innerJoin('roles','roles.id = roles_operaciones.rol_id')
                        ->innerJoin('user','"user".rol_id = roles.id')
                        ->where(['operaciones.nombre' =>$operacion,'user.id' => Yii::$app->user->id])
                        ->one();

        if (!empty($result['nombre'])){
            return true;
        } else {
            return false;
        }
    }

}