<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "fondos".
 *
 * @property integer $cd_fondo_pk
 * @property integer $cod_factura_fk
 * @property string $descripcion
 * @property string $saldo_anterior
 * @property string $cota_mes
 * @property string $cargo
 * @property string $saldo_actual
 *
 * @property Facturas $codFacturaFk
 */
class Fondos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'fondos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_factura_fk', 'descripcion'], 'required'],
            [['cod_factura_fk'], 'integer'],
            [['saldo_anterior', 'cota_mes', 'cargo', 'saldo_actual'], 'number'],
            [['descripcion'], 'string', 'max' => 250],
            [['cod_factura_fk'], 'exist', 'skipOnError' => true, 'targetClass' => Facturas::className(), 'targetAttribute' => ['cod_factura_fk' => 'cd_factura_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_fondo_pk' => 'Cd Fondo Pk',
            'cod_factura_fk' => 'Cod Factura Fk',
            'descripcion' => 'Descripcion',
            'saldo_anterior' => 'Saldo Anterior',
            'cota_mes' => 'Cota Mes',
            'cargo' => 'Cargo',
            'saldo_actual' => 'Saldo Actual',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodFacturaFk()
    {
        return $this->hasOne(Facturas::className(), ['cd_factura_pk' => 'cod_factura_fk']);
    }
}
