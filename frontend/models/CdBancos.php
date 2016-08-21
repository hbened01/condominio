<?php

<<<<<<< HEAD
namespace app\models;
=======
namespace frontend\models;
>>>>>>> cond_humberto_12_pagos_mejoras

use Yii;

/**
 * This is the model class for table "cd_bancos".
 *
 * @property integer $cd_bancos_pk
 * @property string $nombre
 *
 * @property CdPagos[] $cdPagos
 */
class CdBancos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_bancos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
<<<<<<< HEAD
            'cd_bancos_pk' => 'Cd Bancos Pk',
            'nombre' => 'Nombre',
=======
            'cd_bancos_pk' => Yii::t('frontend', 'Cd Bancos Pk'),
            'nombre' => Yii::t('frontend', 'Banco'),
>>>>>>> cond_humberto_12_pagos_mejoras
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdPagos()
    {
        return $this->hasMany(CdPagos::className(), ['cod_banco' => 'cd_bancos_pk']);
    }
}
