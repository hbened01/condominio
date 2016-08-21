<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "cd_pagos".
 *
 * @property integer $cd_pago_pk
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
 * @property string $monto
 * @property integer $cod_banco
 *
 * @property CdBancos $codBanco
 * @property CdTiposDocs $codTipoDoc
 * @property CdTiposPagos $codTipoPago
 * @property FacturasPagos[] $facturasPagos
 */

class CdPagos extends \yii\db\ActiveRecord
{
    public $cod_factura;
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
            [['cod_factura', 'cod_tipo_pago', 'nro_referencia', 'fecha_pago', 'nombre', 'apellido', 'nro_cedula', 'cod_tipo_doc', 'email', 'cod_banco', 'monto'], 'required'],

            [['fecha_pago'], 'safe'],

            [['estatus_pago'], 'boolean'],
            ['estatus_pago', 'default', 'value' => false],

            [['cod_tipo_pago', 'cod_tipo_doc', 'cod_banco'], 'integer'],

            [['nro_cedula', 'nro_referencia'], 'number'],

            //removes commas and periods and currency
            ['monto', 'filter', 'filter' => function($value) {return str_replace(',', '.', str_replace(['.', ',00', 'Bs '], '' , $value));}],
            [['monto'], 'number', 'min' => 100 ],

            ['email', 'email'],
            ['email', 'filter', 'filter' => 'trim'],
            [['email'], 'string', 'max' => 255],

            [['nota_pago'], 'string', 'max' => 500],

            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['nombre', 'apellido'], 'filter', 'filter' => 'strtoupper'],
            [['nombre', 'apellido'], 'match' ,'pattern'=>'/^[a-zA-ZÑñ" "]+$/u', 'message'=> 'Solo introducir letras'],

            [['cod_banco'], 'exist', 'skipOnError' => true, 'targetClass' => CdBancos::className(), 'targetAttribute' => ['cod_banco' => 'cd_bancos_pk']],

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
            'cod_tipo_pago' => Yii::t('frontend', 'Payment Type'),
            'nro_referencia' => Yii::t('frontend', 'Transfer or Reference Number'),
            'fecha_pago' => Yii::t('frontend', 'Payment Date'),
            'nota_pago' => Yii::t('frontend', 'Note Description Payment'),
            'nombre' => Yii::t('frontend', 'Name'),
            'apellido' => Yii::t('frontend', 'Last Name'),
            'nro_cedula' => Yii::t('frontend', 'Identity Card'),
            'cod_tipo_doc' => Yii::t('frontend', 'Document Type'),
            'email' => Yii::t('frontend', 'Email'),
            'estatus_pago' => Yii::t('frontend', 'Payment Status'),
            'monto' => Yii::t('frontend', 'Monto Cancelado'),
            'cod_banco' => Yii::t('frontend', 'Banco'),
            'cod_factura' => Yii::t('frontend', 'Factura'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodBanco()
    {
        return $this->hasOne(CdBancos::className(), ['cd_bancos_pk' => 'cod_banco']);
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
    public function getFacturasPagos()
    {
        return $this->hasMany(FacturasPagos::className(), ['cod_pagos_fk' => 'cd_pago_pk']);
    }


    public function getIdFacturaConcat($id)
    {   
        $filter = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id'])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('facturas_pagos e','e.cod_facturas_fk = d.cd_factura_pk')
                        ->innerJoin('cd_pagos f','f.cd_pago_pk = e.cod_pagos_fk')
                        ->where(['and','b.id='.$id.'', 'd.total_deducible = 0']);

        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', "CONCAT(' Apto:', d.cod_apto, ' - Edificio:', d.edificio, ' - Fecha:', d.fecha, ' - Nr:', d.nr, ' - Monto:', d.total_deducible, ' BsF.') AS descripcion"])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->where(['and','b.id='.$id.'', 'd.estatus_factura = false', 'd.total_deducible <> 0', ['not in', 'd.cd_factura_pk', $filter]])
                        ->orderBy(['d.fecha_creada' => SORT_ASC, 'd.nr'=> SORT_ASC])
                        ->all();                  
        return $result;
    }

    public function getUpdatePago($id, $cod=null)
    {  
        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', "CONCAT(' Apto:', d.cod_apto, ' - Edificio:', d.edificio, ' - Fecha:', d.fecha, ' - Nr:', d.nr, ' - Monto:', d.total_deducible, ' BsF.') AS descripcion"])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('facturas_pagos e','e.cod_facturas_fk = d.cd_factura_pk')
                        ->innerJoin('cd_pagos f','f.cd_pago_pk = e.cod_pagos_fk')
                        ->Where(['and','e.cod_pagos_fk='.$id.''])
                        ->andFilterWhere(['not in', 'd.cd_factura_pk', $cod])
                        ->orderBy(['d.fecha_creada' => SORT_ASC, 'd.nr'=> SORT_ASC]) 
                        ->all(); 
        return $result;
    }

    public function getFacturas($id)
    {
        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', 'd.cod_apto', 'd.edificio', 'd.fecha', 'd.nr'])
                        ->from('cd_propietarios a')
                        ->innerJoin('user b','b.id = a.cod_user')
                        ->innerJoin('cd_aptos c','c.cod_propietario = a.cd_propietarios_pk')
                        ->innerJoin('facturas d','d.cod_apto = c.cd_aptos_pk')
                        ->innerJoin('facturas_pagos e','e.cod_facturas_fk = d.cd_factura_pk')
                        ->innerJoin('cd_pagos f','f.cd_pago_pk = e.cod_pagos_fk')
                        ->where(['e.cod_pagos_fk' => $id])            
                        ->orderBy(['d.fecha_creada' => SORT_ASC, 'd.nr'=> SORT_ASC]) 
                        ->all();                      
        return $result;
    }



}
