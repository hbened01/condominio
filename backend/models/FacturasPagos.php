<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "facturas_pagos".
 *
 * @property integer $cod_facturas
 * @property integer $cod_pagos
 *
 * @property CdPagos $codPagos
 * @property Facturas $codFacturas
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
            [['cod_facturas', 'cod_pagos'], 'integer'],
            [['cod_pagos'], 'exist', 'skipOnError' => true, 'targetClass' => CdPagos::className(), 'targetAttribute' => ['cod_pagos' => 'cd_pago_pk']],
            [['cod_facturas'], 'exist', 'skipOnError' => true, 'targetClass' => Facturas::className(), 'targetAttribute' => ['cod_facturas' => 'cd_factura_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cod_facturas' => 'Cod Facturas',
            'cod_pagos' => 'Cod Pagos',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodPagos()
    {
        return $this->hasOne(CdPagos::className(), ['cd_pago_pk' => 'cod_pagos']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodFacturas()
    {
        return $this->hasOne(Facturas::className(), ['cd_factura_pk' => 'cod_facturas']);
    }
}
