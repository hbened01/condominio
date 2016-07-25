<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "cd_pagos".
 *
 * @property integer $cd_pago_pk
 * @property integer $cod_edificio
 * @property integer $cod_apto
 * @property integer $cod_tipo_pago
 * @property string $nro_transferencia_referencia
 * @property string $fecha_pago
 * @property string $nota_descrip_pago
 * @property string $nombre
 * @property string $apellido
 * @property string $nro_cedula
 * @property integer $cod_tipo_doc
 * @property string $email
 *
 * @property CdTiposDocs $codTipoDoc
 * @property CdTiposPagos $codTipoPago
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
            [['cod_edificio', 'cod_apto', 'cod_tipo_pago', 'nro_transferencia_referencia', 'fecha_pago', 'nombre', 'apellido', 'nro_cedula', 'cod_tipo_doc', 'email'], 'required'],
            
            [['cod_edificio', 'cod_apto', 'cod_tipo_pago', 'cod_tipo_doc'], 'integer'],

            [['fecha_pago'], 'safe'],

            [['nro_cedula', 'nro_transferencia_referencia'], 'number'],

            [['nota_descrip_pago', 'email'], 'string', 'max' => 255],
            [['nota_descrip_pago'], 'filter', 'filter' => 'strtoupper'],

            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['nombre', 'apellido'], 'filter', 'filter' => 'strtoupper'],
            [['nombre', 'apellido'], 'match' ,'pattern'=>'/^[a-zA-ZÑñ" "]+$/u', 'message'=> 'Solo introducir letras'],

            [['cod_tipo_doc'], 'exist', 'skipOnError' => true, 'targetClass' => CdTiposDocs::className(), 'targetAttribute' => ['cod_tipo_doc' => 'cd_tipo_doc_pk']],

            [['cod_tipo_pago'], 'exist', 'skipOnError' => true, 'targetClass' => CdTiposPagos::className(), 'targetAttribute' => ['cod_tipo_pago' => 'cd_tipo_pago_pk']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cd_pago_pk' => Yii::t('frontend', 'Cd Pago Pk'),
            'cod_edificio' => Yii::t('frontend', 'Building'),
            'cod_apto' => Yii::t('frontend', 'Apartment'),
            'cod_tipo_pago' => Yii::t('frontend', 'Payment Type'),
            'nro_transferencia_referencia' => Yii::t('frontend', 'Transfer or Reference Number'),
            'fecha_pago' => Yii::t('frontend', 'Payment Date'),
            'nota_descrip_pago' => Yii::t('frontend', 'Note Description Payment'),
            'nombre' => Yii::t('frontend', 'Name'),
            'apellido' => Yii::t('frontend', 'Last Name'),
            'nro_cedula' => Yii::t('frontend', 'Identity Card'),
            'cod_tipo_doc' => Yii::t('frontend', 'Document Type'),
            'email' => Yii::t('frontend', 'Email'),
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
}
