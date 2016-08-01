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
 * @property Fondos[] $fondos
 * @property GastosNocomunes[] $gastosNocomunes
 * @property GastosComunes[] $gastosComunes
 */
class Facturas extends \yii\db\ActiveRecord
{
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
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_factura_pk' => 'Cd Factura Pk',
            'cod_apto' => 'Apartamento',
            'edificio' => 'Edificio',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'alicuota' => 'Alicuota',
            'nr' => 'Número de Factura',
            'fecha' => 'Fecha',
            'total_gastos_mes' => 'Total Gastos Mes',
            'sub_total_alicuota' => 'Sub Total Alicuota',
            'total_pagar_mes' => 'Total Pagar Mes',
            'deuda_actual' => 'Deuda Actual',
            'recibos' => 'Recibos',
            'estatus_factura' => 'Factura Pagada',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCdPagos()
    {
        return $this->hasMany(CdPagos::className(), ['cod_factura' => 'cd_factura_pk']);
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
