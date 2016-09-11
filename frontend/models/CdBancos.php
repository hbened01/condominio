<?php

namespace frontend\models;

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
            'cd_bancos_pk' => Yii::t('frontend', 'Id'),
            'nombre' => Yii::t('frontend', 'Bank'),
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
