<?php

namespace backend\models;

use Yii;
//use backend\models\CdTiposPagos;
//use backend\models\Facturas;

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
 *
 * @property CdTiposDocs $codTipoDoc
 * @property CdTiposPagos $codTipoPago
 * @property FacturasPagos[] $facturasPagos
 * @property CdBancos $codBancos
 * @property Facturas[] $facturas
 * @property CdPropietarios[] $cdPropietarios
 * @property CdAptos[] $cdAptos
 */
class CdPagos extends \yii\db\ActiveRecord
{
    public $id_propietario;
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
            [['cod_factura', 'cod_tipo_pago', 'nro_referencia', 'fecha_pago', 'nombre', 'apellido', 'cod_tipo_doc','monto','cod_banco','nro_cedula'], 'required'],
            [['cod_tipo_pago', 'cod_tipo_doc'], 'integer'],
            [['nro_referencia', 'nro_cedula','monto'], 'number'],
            [['fecha_pago'], 'safe'],
            [['estatus_pago'], 'boolean'],
            [['nota_pago'], 'string', 'max' => 500],
            [['nombre', 'apellido'], 'string', 'max' => 30],
            [['email'], 'string', 'max' => 255],
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
            'cd_pago_pk' => Yii::t('backend', 'Id'),
            'cod_tipo_pago' => Yii::t('backend', 'Payment Type'),
            'nro_referencia' => Yii::t('backend', 'Transfer or Reference Number'),
            'fecha_pago' => Yii::t('backend', 'Payment Date'),
            'nota_pago' => Yii::t('backend', 'Note Description Payment'),
            'nombre' => Yii::t('backend', 'Name'),
            'apellido' => Yii::t('backend', 'Last Name'),
            'nro_cedula' => Yii::t('backend', 'Identity Card'),
            'cod_tipo_doc' => Yii::t('backend', 'Document Type'),
            'email' => Yii::t('backend', 'Email'),
            'estatus_pago' => Yii::t('backend', 'Payment Status'),
            'monto' => Yii::t('backend', 'Cancelled amount'),
            'cod_factura' => Yii::t('backend', 'Invoice'),
            'id_propietario' => Yii::t('backend', 'Select Owner'),
            'codBancos.nombre' => Yii::t('backend', 'Bank'),
            'codTipoPago.descrip_pago' => Yii::t('backend', 'Payment type'),
            'codTipoDoc.descrip_doc' => Yii::t('backend', 'Document type'),
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
    public function getFacturasPagos()
    {
        return $this->hasMany(FacturasPagos::className(), ['cod_pagos_fk' => 'cd_pago_pk']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFacturas()
    {
        return $this->hasMany(Facturas::className(), ['cd_factura_pk' => 'cod_facturas_fk'])
                    ->viaTable('facturas_pagos', ['cod_pagos_fk' => 'cd_pago_pk']);
    }

    public function tipoPago($id)
    {
        $model = CdTiposPagos::find()->where(['cd_tipo_pago_pk' => $id])->one();
        return $model?$model->descrip_pago:'';
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCodBancos()
    {
        return $this->hasOne(CdBancos::className(), ['cd_bancos_pk' => 'cod_banco']);
    }

    public function getIdFacturaConcat($id = null)
    {   

        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', "CONCAT('Apto.: ', d.cod_apto, ' - Edif.: ', d.edificio, ' - ',d.fecha, ' - Monto: ',replace(replace(replace(to_char(d.total_deducible,'999,999,999.99'),',','*'),'.',','),'*','.')) AS descripcion"])
                        ->from('facturas d')
                        ->where (['and','d.estatus_factura = false','d.total_deducible > 0'])
                        ->groupBy(['d.cd_factura_pk','d.cod_apto', 'd.edificio'])
                        ->orderBy(['d.edificio' => SORT_ASC])
                        ->all();
                        
        return $result;
    }

    public function getIdPropietario($id)
    {   
        
        $result = (new \yii\db\Query())
                        ->select(['a.cod_propietario AS id'])
                        ->from('cd_aptos a')
                        ->innerJoin('cd_edificios e','e.cd_edificios_pk = a.cod_edificio')
                        ->innerJoin('facturas f','f.cod_apto = a.cd_aptos_pk AND f.edificio = e.nombre_edificio')
                        ->where (['and','f.estatus_factura = false','f.cd_factura_pk = '.$id])
                        ->one();
                        
        return $result;
    }

    public function getPropietarios($id = null)
    {   
        $result = (new \yii\db\Query())
                        ->select(['d.cd_propietarios_pk AS id', "CONCAT(d.apellido, ' - ',d.nombre) AS nombre"])
                        ->from('cd_propietarios d')
                        ->groupBy(['d.cd_propietarios_pk','d.nombre'])
                        ->orderBy(['d.apellido' => SORT_ASC])
                        ->all();
                        
        return $result;
    }

    public static function getOptionsFacturas($id)
    {

        $result = (new \yii\db\Query())
                        ->select(['d.cd_factura_pk AS id', "CONCAT('Apto.: ', d.cod_apto, ' - Edif.: ', d.edificio, ' - ',d.fecha, ' - Monto: ',replace(replace(replace(to_char(d.total_deducible,'999,999,999'),',','*'),'.',','),'*','.')) AS descripcion"])
                        ->from('facturas d')
                        ->innerJoin('cd_aptos a','a.cd_aptos_pk = d.cod_apto')
                        ->innerJoin('cd_edificios e','e.cd_edificios_pk = a.cod_edificio AND e.nombre_edificio = d.edificio')
                        ->where(['and','a.cod_propietario = '.$id,'d.estatus_factura = false'])
                        ->orderBy(['d.fecha_creada' => SORT_ASC])
                        ->all();

        return $result;
    }
}
