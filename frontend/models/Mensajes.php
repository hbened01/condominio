<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "mensajes".
 *
 * @property integer $cd_mensajes_pk
 * @property string $texto
 * @property boolean $msn_default
 */
class Mensajes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mensajes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['texto'], 'required'],
            [['texto'], 'string'],
            [['msn_default'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_mensajes_pk' => Yii::t('frontend', 'Cd Mensajes Pk'),
            'texto' => Yii::t('frontend', 'Texto'),
            'msn_default' => Yii::t('frontend', 'Msn Default'),
        ];
    }
}