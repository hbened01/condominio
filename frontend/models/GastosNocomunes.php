<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "gastos_nocomunes".
 *
 * @property integer $cd_gasto_nocomun_pk
 * @property integer $cod_factura_fk
 * @property string $descripcion
 * @property string $monto
 *
 * @property Facturas $codFacturaFk
 */
class GastosNocomunes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'gastos_nocomunes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cod_factura_fk', 'descripcion', 'monto'], 'required'],
            [['cod_factura_fk'], 'integer'],
            [['monto'], 'number'],
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
            'cd_gasto_nocomun_pk' => Yii::t('frontend', 'Cd Gasto Nocomun Pk'),
            'cod_factura_fk' => Yii::t('frontend', 'Cod Factura Fk'),
            'descripcion' => Yii::t('frontend', 'Descripcion'),
            'monto' => Yii::t('frontend', 'Monto'),
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
