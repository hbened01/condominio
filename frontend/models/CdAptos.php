<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "cd_aptos".
 *
 * @property string $cd_aptos_pk
 * @property integer $cod_propietario
 * @property integer $cod_edificio
 */
class CdAptos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_aptos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cd_aptos_pk', 'cod_propietario', 'cod_edificio'], 'required'],
            [['cod_propietario', 'cod_edificio'], 'integer'],
            [['cd_aptos_pk'], 'string', 'max' => 3],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_aptos_pk' => Yii::t('frontend', 'Apartment'),
            'cod_propietario' => Yii::t('frontend', 'Cod. Owner'),
            'cod_edificio' => Yii::t('frontend', 'Cod. Building'),
        ];
    }
}
