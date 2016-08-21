<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "facturas_gastos_comunes".
 *
 * @property integer $cod_gasto_comun_fk
 * @property integer $cod_factura_fk
 *
 * @property Facturas $codFacturaFk
 * @property GastosComunes $codGastoComunFk
 */
class FacturasGastosComunes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'facturas_gastos_comunes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_gasto_comun_fk', 'cod_factura_fk'], 'required'],
            [['cod_gasto_comun_fk', 'cod_factura_fk'], 'integer'],
            [['cod_factura_fk'], 'exist', 'skipOnError' => true, 'targetClass' => Facturas::className(), 'targetAttribute' => ['cod_factura_fk' => 'cd_factura_pk']],
            [['cod_gasto_comun_fk'], 'exist', 'skipOnError' => true, 'targetClass' => GastosComunes::className(), 'targetAttribute' => ['cod_gasto_comun_fk' => 'cd_gasto_comun_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cod_gasto_comun_fk' => 'Cod Gasto Comun Fk',
            'cod_factura_fk' => 'Cod Factura Fk',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodFacturaFk()
    {
        return $this->hasOne(Facturas::className(), ['cd_factura_pk' => 'cod_factura_fk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodGastoComunFk()
    {
        return $this->hasOne(GastosComunes::className(), ['cd_gasto_comun_pk' => 'cod_gasto_comun_fk']);
    }
}
