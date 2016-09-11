<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "cd_tipos_pagos".
 *
 * @property integer $cd_tipo_pago_pk
 * @property string $descrip_pago
 *
 * @property CdPagos[] $cdPagos
 */
class CdTiposPagos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_tipos_pagos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descrip_pago'], 'required'],
            [['descrip_pago'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_tipo_pago_pk' => Yii::t('frontend', 'Id'),
            'descrip_pago' => Yii::t('frontend', 'Payment Type'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdPagos()
    {
        return $this->hasMany(CdPagos::className(), ['cod_tipo_pago' => 'cd_tipo_pago_pk']);
    }
}
