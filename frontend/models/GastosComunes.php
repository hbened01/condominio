<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "gastos_comunes".
 *
 * @property integer $cd_gasto_comun_pk
 * @property string $descripcion
 * @property string $monto
 *
 * @property FacturasGastosComunes[] $facturasGastosComunes
 */
class GastosComunes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'gastos_comunes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion', 'monto'], 'required'],
            [['monto'], 'number'],
            [['descripcion'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_gasto_comun_pk' => Yii::t('frontend', 'Cd Gasto Comun Pk'),
            'descripcion' => Yii::t('frontend', 'Descripcion'),
            'monto' => Yii::t('frontend', 'Monto'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFacturasGastosComunes()
    {
        return $this->hasMany(FacturasGastosComunes::className(), ['cod_gasto_comun_fk' => 'cd_gasto_comun_pk']);
    }
}
