<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "cd_pagos".
 *
 * @property integer $cd_pago_pk
 * @property integer $cod_factura
 * @property integer $cod_tipo_pago
 * @property string $nro_referencia
 * @property string $fecha_pago
 * @property string $nota_pago
 * @property string $nombre
 * @property string $apellido
 * @property string $nro_cedula
 * @property integer $cod_tipo_doc
 * @property string $email
 * @property boolean $estatus_pago
 *
 * @property CdTiposDocs $codTipoDoc
 * @property CdTiposPagos $codTipoPago
 * @property Facturas $codFactura
 */
class CdPagos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cd_pagos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_factura', 'cod_tipo_pago', 'nro_referencia', 'fecha_pago', 'nombre', 'apellido', 'cod_tipo_doc', 'email'], 'required'],
            [['cod_factura', 'cod_tipo_pago', 'cod_tipo_doc'], 'integer'],
            [['nro_referencia', 'nro_cedula'], 'number'],
            [['fecha_pago'], 'safe'],
            [['estatus_pago'], 'boolean'],
            [['nota_pago'], 'string', 'max' => 500],
            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['email'], 'string', 'max' => 255],
            [['cod_tipo_doc'], 'exist', 'skipOnError' => true, 'targetClass' => CdTiposDocs::className(), 'targetAttribute' => ['cod_tipo_doc' => 'cd_tipo_doc_pk']],
            [['cod_tipo_pago'], 'exist', 'skipOnError' => true, 'targetClass' => CdTiposPagos::className(), 'targetAttribute' => ['cod_tipo_pago' => 'cd_tipo_pago_pk']],
            [['cod_factura'], 'exist', 'skipOnError' => true, 'targetClass' => Facturas::className(), 'targetAttribute' => ['cod_factura' => 'cd_factura_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_pago_pk' => 'Cd Pago Pk',
            'cod_factura' => 'Cod Factura',
            'cod_tipo_pago' => 'Cod Tipo Pago',
            'nro_referencia' => 'Nro Referencia',
            'fecha_pago' => 'Fecha Pago',
            'nota_pago' => 'Nota Pago',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'nro_cedula' => 'Nro Cedula',
            'cod_tipo_doc' => 'Cod Tipo Doc',
            'email' => 'Email',
            'estatus_pago' => 'Estatus Pago',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodTipoDoc()
    {
        return $this->hasOne(CdTiposDocs::className(), ['cd_tipo_doc_pk' => 'cod_tipo_doc']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodTipoPago()
    {
        return $this->hasOne(CdTiposPagos::className(), ['cd_tipo_pago_pk' => 'cod_tipo_pago']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodFactura()
    {
        return $this->hasOne(Facturas::className(), ['cd_factura_pk' => 'cod_factura']);
    }
}
