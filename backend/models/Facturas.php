<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "facturas".
 *
 * @property integer $cd_factura_pk
 * @property string $cod_apto
 * @property string $edificio
 * @property string $nombre
 * @property string $apellido
 * @property string $alicuota
 * @property string $nr
 * @property string $fecha
 * @property string $total_gastos_mes
 * @property string $sub_total_alicuota
 * @property string $total_pagar_mes
 * @property string $deuda_actual
 * @property integer $recibos
 * @property boolean $estatus_factura
 *
 * @property CdPagos[] $cdPagos
 * @property FacturasGastosComunes[] $facturasGastosComunes
 * @property FacturasPagos[] $facturasPagos
 * @property Fondos[] $fondos
 * @property GastosNocomunes[] $gastosNocomunes
 * @property GastosComunes[] $gastosComunes
 * @property CdPagos[] $cdPagos
 */
class Facturas extends \yii\db\ActiveRecord
{
    public $status_bill;
    const STATUS_0 = 0;
    const STATUS_1 = 1;
    const STATUS_2 = 2;
    const STATUS_3 = 3;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'facturas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_apto', 'edificio', 'nombre', 'apellido', 'alicuota', 'nr', 'fecha', 'total_gastos_mes', 'sub_total_alicuota', 'total_pagar_mes', 'deuda_actual'], 'required'],
            [['alicuota', 'nr', 'total_gastos_mes', 'sub_total_alicuota', 'total_pagar_mes', 'deuda_actual'], 'number'],
            [['recibos'], 'integer'],
            [['estatus_factura'], 'boolean'],
            [['cod_apto'], 'string', 'max' => 3],
            [['edificio'], 'string', 'max' => 250],
            [['nombre', 'apellido'], 'string', 'max' => 100],
            [['fecha'], 'string', 'max' => 30],
            ['status_bill', 'in', 'range' => [self::STATUS_0, self::STATUS_1, self::STATUS_2, self::STATUS_3]],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_factura_pk' => Yii::t('backend', 'Id'),
            'cod_apto' => Yii::t('backend', 'Apartment'),
            'edificio' => Yii::t('backend', 'Building'),
            'nombre' => Yii::t('backend', 'Name'),
            'apellido' => Yii::t('backend', 'Last Name'),
            'alicuota' => Yii::t('backend', 'Aliquot'),
            'nr' => Yii::t('backend', 'Invoice Number'),
            'fecha' => Yii::t('backend', 'Date'),
            'total_gastos_mes' => Yii::t('backend', 'Total Monthly Expenses'),
            'sub_total_alicuota' => Yii::t('backend', 'Sub Total Aliquot'),
            'total_pagar_mes' => Yii::t('backend', 'Total Pay Month'),
            'deuda_actual' => Yii::t('backend', 'Current Debt'),
            'recibos' => Yii::t('backend', 'Receipts'),
            'estatus_factura' => Yii::t('backend', 'Invoice Status'),
            'total_deducible' => Yii::t('backend', 'Total Deductible'),
            'fecha_creada' => Yii::t('backend', 'Date Created'), 
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFacturasGastosComunes()
    {
        return $this->hasMany(FacturasGastosComunes::className(), ['cod_factura_fk' => 'cd_factura_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFacturasPagos()
    {
        return $this->hasMany(FacturasPagos::className(), ['cod_facturas_fk' => 'cd_factura_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdPagos()
    {
        return $this->hasMany(CdPagos::className(), ['cd_pago_pk' => 'cod_pagos_fk'])
                    ->viaTable('facturas_pagos', ['cod_facturas_fk' => 'cd_factura_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFondos()
    {
        return $this->hasMany(Fondos::className(), ['cod_factura_fk' => 'cd_factura_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGastosNocomunes()
    {
        return $this->hasMany(GastosNocomunes::className(), ['cod_factura_fk' => 'cd_factura_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGastosComunes()
    {
        return $this->hasMany(GastosComunes::className(), ['cd_gasto_comun_pk' => 'cod_gasto_comun_fk'])
                    ->viaTable('facturas_gastos_comunes', ['cod_factura_fk' => 'cd_factura_pk']);
    }
}
