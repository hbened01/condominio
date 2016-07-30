<?php

namespace frontend\models; 

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
            [['cod_factura', 'cod_tipo_pago', 'nro_referencia', 'fecha_pago', 'nombre', 'apellido', 'nro_cedula', 'cod_tipo_doc', 'email'], 'required'],

            [['fecha_pago'], 'safe'],

            [['estatus_pago'], 'boolean'],
            ['estatus_pago', 'default', 'value' => false],

            [['cod_factura', 'cod_tipo_pago', 'cod_tipo_doc'], 'integer'],

            [['nro_cedula', 'nro_referencia'], 'number'],

            ['email', 'email'],
            ['email', 'filter', 'filter' => 'trim'],
            [['email'], 'string', 'max' => 255],
            
            [['nota_pago'], 'string', 'max' => 500],
            [['nota_pago'], 'filter', 'filter' => 'strtoupper'],

            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['nombre', 'apellido'], 'filter', 'filter' => 'strtoupper'],
            [['nombre', 'apellido'], 'match' ,'pattern'=>'/^[a-zA-ZÑñ" "]+$/u', 'message'=> 'Solo introducir letras'],

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
            'cd_pago_pk' => Yii::t('frontend', 'Cd Pago Pk'),
            'cod_tipo_pago' => Yii::t('frontend', 'Payment Type'),
            'cod_factura' => Yii::t('frontend', 'Billing Code'),
            'nro_referencia' => Yii::t('frontend', 'Transfer or Reference Number'),
            'fecha_pago' => Yii::t('frontend', 'Payment Date'),
            'nota_pago' => Yii::t('frontend', 'Note Description Payment'),
            'nombre' => Yii::t('frontend', 'Name'),
            'apellido' => Yii::t('frontend', 'Last Name'),
            'nro_cedula' => Yii::t('frontend', 'Identity Card'),
            'cod_tipo_doc' => Yii::t('frontend', 'Document Type'),
            'email' => Yii::t('frontend', 'Email'),
            'estatus_pago' => Yii::t('frontend', 'Payment Status'),
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

    public function getIdFacturaConcat($id)
    {   
        $filter = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id'])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('cd_pagos e','e.cod_factura = d.cd_factura_pk');

        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', "CONCAT('Apto:', d.cod_apto, ' - Edificio:', d.edificio, ' - Fecha:',d.fecha, ' - Nr: ',d.nr) AS descripcion"])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->where (['and','b.id='.$id.'', 'd.estatus_factura = false', ['not in', 'd.cd_factura_pk', $filter]])
                        ->all();
                        
        return $result;
    }

    public function getEstatusPago($id)
    {
        $result = (new \yii\db\Query())
                        ->select(['e.estatus_pago AS status', "CONCAT('Apto:', d.cod_apto, ' - Edificio:', d.edificio, ' - Fecha:',d.fecha, ' - Nr: ',d.nr) AS descripcion"])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('cd_pagos e','e.cod_factura = d.cd_factura_pk')
                        ->where (['e.cd_pago_pk' => $id]) 
                        ->one();
                        
        return $result;
    }

    public function getUpdatePago($id)
    {
        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', "CONCAT('Apto:', d.cod_apto, ' - Edificio:', d.edificio, ' - Fecha:',d.fecha, ' - Nr: ',d.nr) AS descripcion"])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('cd_pagos e','e.cod_factura = d.cd_factura_pk')
                        ->where (['e.cd_pago_pk' => $id]) 
                        ->all();
                        
        return $result;
    }


}
