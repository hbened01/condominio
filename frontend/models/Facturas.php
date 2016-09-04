<?php

namespace frontend\models;

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
 * @property string $total_deducible
 * @property string $fecha_creada
 *
 * @property FacturasGastosComunes[] $facturasGastosComunes
 * @property FacturasPagos[] $facturasPagos
 * @property Fondos[] $fondos
 * @property GastosNocomunes[] $gastosNocomunes
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
            [['alicuota', 'nr', 'total_gastos_mes', 'sub_total_alicuota', 'total_pagar_mes', 'deuda_actual', 'total_deducible'], 'number'],
            [['recibos'], 'integer'],
            [['estatus_factura'], 'boolean'],
            [['fecha_creada'], 'safe'], 
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
            'cd_factura_pk' => Yii::t('frontend', 'Cd Factura Pk'),
            'cod_apto' => Yii::t('frontend', 'Apartment'),
            'edificio' => Yii::t('frontend', 'Building'),
            'nombre' => Yii::t('frontend', 'Name'),
            'apellido' => Yii::t('frontend', 'Last Name'),
            'alicuota' => Yii::t('frontend', 'Aliquot'),
            'nr' => Yii::t('frontend', 'Nr'),
            'fecha' => Yii::t('frontend', 'Date'),
            'total_gastos_mes' => Yii::t('frontend', 'Total Gastos Mes'),
            'sub_total_alicuota' => Yii::t('frontend', 'Sub Total Alicuota'),
            'total_pagar_mes' => Yii::t('frontend', 'Total Pagar Mes'),
            'deuda_actual' => Yii::t('frontend', 'Deuda Actual'),
            'recibos' => Yii::t('frontend', 'Recibos'),
            'estatus_factura' => Yii::t('frontend', 'Invoice Status'),
            'total_deducible' => Yii::t('frontend', 'Total Deducible'),
            'fecha_creada' => Yii::t('frontend', 'Fecha Creada'), 
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
        return $this->hasMany(FacturasPagos::className(), ['cod_factura_fk' => 'cd_facturas_pk']);
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