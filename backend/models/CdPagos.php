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
            'cd_pago_pk' => 'Cd Pago Pk',
            'cod_factura' => 'Factura',
            'cod_tipo_pago' => 'Tipo Pago',
            'nro_referencia' => 'Nro Referencia',
            'fecha_pago' => 'Fecha Pago',
            'nota_pago' => 'Observación sobre el pago',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'nro_cedula' => 'Nro Documento',
            'cod_tipo_doc' => 'Tipo Documento',
            'email' => 'Email',
            'estatus_pago' => 'Pago Aprobado',
            'monto' => 'Monto del Pago',
            'cod_banco' => 'Banco',
            'id_propietario' => 'Seleccione Propietario',
            'codBancos.nombre' => 'Banco',
            'codTipoPago.descrip_pago' => 'Tipo de Pago',
            'codTipoDoc.descrip_doc' => 'Tipo de Documento'
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
                        ->select(['d.cd_factura_pk AS id', "CONCAT('Apto.: ', d.cod_apto, ' - Edif.: ', d.edificio, ' - ',d.fecha, ' - Monto: ',replace(replace(replace(to_char(d.total_deducible,'999,999,999.99'),',','*'),'.',','),'*','.')) AS descripcion"])
                        ->from('facturas d')
                        ->innerJoin('cd_aptos a','a.cd_aptos_pk = d.cod_apto')
                        ->innerJoin('cd_edificios e','e.cd_edificios_pk = a.cod_edificio AND e.nombre_edificio = d.edificio')
                        ->where(['and','a.cod_propietario = '.$id,'d.estatus_factura = false','d.total_deducible > 0'])
                        ->orderBy(['d.fecha_creada' => SORT_ASC])
                        ->all();

        return $result;
    }
}
