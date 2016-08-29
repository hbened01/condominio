<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "facturas_pagos".
 *
 * @property integer $cod_facturas_fk
 * @property integer $cod_pagos_fk
 *
 * @property CdPagos $codPagosFk
 * @property Facturas $codFacturasFk
 */
class FacturasPagos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'facturas_pagos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_facturas_fk', 'cod_pagos_fk'], 'integer'],
            [['cod_pagos_fk'], 'exist', 'skipOnError' => true, 'targetClass' => CdPagos::className(), 'targetAttribute' => ['cod_pagos_fk' => 'cd_pago_pk']],
            [['cod_facturas_fk'], 'exist', 'skipOnError' => true, 'targetClass' => Facturas::className(), 'targetAttribute' => ['cod_facturas_fk' => 'cd_factura_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cod_facturas_fk' => Yii::t('frontend', 'Cod Facturas Fk'),
            'cod_pagos_fk' => Yii::t('frontend', 'Cod Pagos Fk'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodPagosFk()
    {
        return $this->hasOne(CdPagos::className(), ['cd_pago_pk' => 'cod_pagos_fk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodFacturasFk()
    {
        return $this->hasOne(Facturas::className(), ['cd_factura_pk' => 'cod_facturas_fk']);
    }
}
